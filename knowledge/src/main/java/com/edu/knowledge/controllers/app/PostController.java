package com.edu.knowledge.controllers.app;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Post;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.entities.VoteDetail;
import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.services.UserService;
import com.edu.knowledge.services.VoteDetailService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/app/post")
public class PostController {

	@Autowired
	private PostService postService;
	
	@Autowired
	private TopicService topicService;
	
	@Autowired
	private VoteDetailService voteDetailService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/{id}/detail", method = RequestMethod.GET)
	public ModelAndView postDetail(@PathVariable("id") int id, HttpSession session) {
		ModelAndView model = new ModelAndView("post_detail");
		Post post = postService.getOne(id);
		postService.updateView(post.getViews() + 1, id);
		Question question = new Question();
		List<Topic> topics = topicService.findTopTen();
		if(session.getAttribute(Constant.CURRENT_USER) !=null) {
			User user = (User) session.getAttribute(Constant.CURRENT_USER);
			VoteDetail voteDetail = voteDetailService.findByPostIdAndUserId(id, user.getUserId());
			model.addObject("voteDetail", voteDetail);
		}
		model.addObject("post", post);
		model.addObject("question", question);
		model.addObject("topics", topics);
		return model;
	}
	
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public ModelAndView allPost() {
		ModelAndView mav = new ModelAndView("post_list");
		List<Post> allPosts = postService.findAll();
		List<Post> newPosts = postService.findTopNew(Constant.QUESTION_LIST_LIMIT);
		List<Post> hotPosts = postService.findTopVote(Constant.QUESTION_LIST_LIMIT);
		List<Topic> topics = topicService.findTopTen();
		List<User> users = userService.findTopFiveExpect();
		mav.addObject("topics", topics);
		mav.addObject("users", users);
		mav.addObject("allPosts", allPosts);
		mav.addObject("newPosts", newPosts);
		mav.addObject("hotPosts", hotPosts);
		return mav;
	}
	
	/**
	 * 
	 * @param postId id bài viết
	 * @param ownerId id người đăng bài viết
	 * @param userId id thành viên vote
	 * @param action upvote/ downvote
	 * @return success/ voted
	 */
	@RequestMapping("/vote")
	@ResponseBody
	public String postVote(@RequestParam("pid") int postId, @RequestParam("oid") int ownerId,
			@RequestParam("uid") int userId, @RequestParam("action") String action) {
		VoteDetail voteDetail = new VoteDetail();
		voteDetail.setPostId(postId);
		voteDetail.setUserId(userId);
		VoteDetail voteDetailDb = voteDetailService.findByPostIdAndUserId(postId, userId);
		if(voteDetailDb == null) {
			voteDetailService.createVoteDetail(voteDetail);
			if(action.equals(Constant.ACTION_UPVOTE)) {				
				voteDetail.setVoteTypeId(Constant.UPVOTE_ID);
				postService.updateUpvotes(postId);
				userService.updatePoints(Constant.POINTS_POST_OR_QUESTION_UPVOTED, ownerId);
			} else {
				voteDetail.setVoteTypeId(Constant.DOWNVOTE_ID);
				postService.updateDownvotes(postId);
				userService.updatePoints(Constant.POINTS_DOWNVOTED, ownerId);
			}
			return "success";
		} else {
			voteDetailService.deleteVote(voteDetailDb.getId());
			if(action.equals(Constant.ACTION_UPVOTE)) {				
				postService.removeUpvotes(postId);
				userService.updatePoints(Constant.REMOVE_POST_OR_QUESTION_UPVOTE_POINT, ownerId);
			} else {
				postService.removeDownvotes(postId);
				userService.updatePoints(Constant.REMOVE_POST_OR_QUESTION_DOWNVOTE_POINT, ownerId);
			}
			return "voted";
		}
		
	}
}
