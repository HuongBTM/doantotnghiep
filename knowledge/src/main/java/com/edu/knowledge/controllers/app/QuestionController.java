package com.edu.knowledge.controllers.app;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.knowledge.entities.Answer;
import com.edu.knowledge.entities.Comment;
import com.edu.knowledge.entities.Post;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.entities.VoteDetail;
import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.services.UserService;
import com.edu.knowledge.services.VoteDetailService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/app/question")
public class QuestionController {

	@Autowired
	private TopicService topicService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private VoteDetailService voteDetailService;
	
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public ModelAndView allQuestion(){
		ModelAndView model = new ModelAndView("question_list");
		List<Question> newQuestions = questionService.findAllChecked();
		model.addObject("newQuestions", newQuestions);
		return model;
	}
	
	@RequestMapping(value="/ask", method=RequestMethod.GET)
	public ModelAndView askQuestion(HttpSession session){
		ModelAndView model = new ModelAndView("question_form");
		if(session.getAttribute(Constant.CURRENT_USER) == null) {
			model.setViewName("redirect:/login");
			return model;
		}
		
		Question question = new Question();
		List<Topic> topics = topicService.findAll();
		model.addObject("topics", topics);
		model.addObject("question",question);
		return model;
	}
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Set.class, "topics", new CustomCollectionEditor(Set.class) {
            @Override
            protected Object convertElement(Object element) {
                Integer id = Integer.parseInt((String) element);
                return topicService.getOne(id);
            }
        });
    }
	
	@RequestMapping(value="/{userId}/ask", method= RequestMethod.POST)
	public ModelAndView postQuestion(@PathVariable("userId") int userId, @ModelAttribute("question") Question question, BindingResult result, RedirectAttributes redirect) {
		ModelAndView model = new ModelAndView();
		if(result.hasErrors()) {
			model.setViewName("question_form");
		} else {
			User user = userService.getOne(userId);
			question.setUser(user);
			question.setCheck(0);
			questionService.createQuestion(question);
			model.setViewName("redirect:/app/question/"+question.getQuestionId()+"/detail");
		}
		redirect.addFlashAttribute("success", "Your question has been posted successfully!");
		return model;
	}
	
	@RequestMapping(value="/{id}/detail", method=RequestMethod.GET)
	public ModelAndView questionDetail(@PathVariable("id") int id) {
		ModelAndView model = new ModelAndView("question_detail");
		Question question = questionService.getOne(id);
		questionService.updateViews(question.getViews()+1, id);
		List<Topic> topics = topicService.findTopTen();
		List<User> users = userService.findTopFiveExpect();
		List<User> expects = userService.findTopNineExpect();
		System.out.println(expects.size());
		Answer answer = new Answer();
		Comment comment = new Comment();
		model.addObject("question", question);
		model.addObject("answer", answer);
		model.addObject("comment",comment);
		model.addObject("topics", topics);
		model.addObject("users", users);
		model.addObject("expects", expects);
		return model;
	}
	
	@RequestMapping(value="/post/{id}/ask/{userId}", method= RequestMethod.POST)
	public ModelAndView addOnPost(@PathVariable("id") int id, @PathVariable("userId") int userId, @ModelAttribute("question") Question question) {
		ModelAndView model = new ModelAndView("question_detail");
		Post post = postService.getOne(id);
		question.setPost(post);
		Set<Topic> topics = post.getTopics();
		Set<Topic> questionTopics = new HashSet<>();
		for (Topic topic : topics) {
			questionTopics.add(topic);
		}
		question.setTopics(questionTopics);
		User user = userService.getOne(userId);
		question.setUser(user);
		question.setCheck(0);
		questionService.createQuestion(question);
		model.setViewName("redirect:/app/question/"+question.getQuestionId()+"/detail");
		return model;
	}
	
	/**
	 * 
	 * @param questionId id câu hỏi
	 * @param ownerId id người đăng bài viết
	 * @param userId id thành viên vote
	 * @param action upvote/ downvote
	 * @return success/ voted
	 */
	@RequestMapping("/vote")
	@ResponseBody
	public String questionVote(@RequestParam("qid") int questionId, @RequestParam("oid") int ownerId,
			@RequestParam("uid") int userId, @RequestParam("action") String action) {
		VoteDetail voteDetail = new VoteDetail();
		voteDetail.setQuestionId(questionId);
		voteDetail.setUserId(userId);
		VoteDetail voteDetailDb = voteDetailService.findByQuestionIdAndUserId(questionId, userId);
		if(voteDetailDb == null) {
			voteDetailService.createVoteDetail(voteDetail);
			if(action.equals(Constant.ACTION_UPVOTE)) {				
				voteDetail.setVoteTypeId(Constant.UPVOTE_ID);
				questionService.updateUpvotes(questionId);
				userService.updatePoints(Constant.POINTS_POST_OR_QUESTION_UPVOTED, ownerId);
			} else {
				voteDetail.setVoteTypeId(Constant.DOWNVOTE_ID);
				questionService.updateDownvotes(questionId);
				userService.updatePoints(Constant.POINTS_DOWNVOTED, ownerId);
			}
			return "success";
		} else {
			voteDetailService.deleteVote(voteDetailDb.getId());
			if(action.equals(Constant.ACTION_UPVOTE)) {				
				questionService.removeUpvotes(questionId);
				userService.updatePoints(Constant.REMOVE_POST_OR_QUESTION_UPVOTE_POINT, ownerId);
			} else {
				questionService.removeDownvotes(questionId);
				userService.updatePoints(Constant.REMOVE_POST_OR_QUESTION_DOWNVOTE_POINT, ownerId);
			}
			return "voted";
		}
		
	}
}
