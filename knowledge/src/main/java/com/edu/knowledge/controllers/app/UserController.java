package com.edu.knowledge.controllers.app;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edu.knowledge.entities.Answer;
import com.edu.knowledge.entities.Post;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.AnswerService;
import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.UserService;
import com.edu.knowledge.utils.Constant;
import com.edu.knowledge.validator.UserValidator;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private UserValidator userValidator;
	
	@RequestMapping(value="/app/user/{id}/changeprofile", method=RequestMethod.GET)
	public ModelAndView updateProfile(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("user_change_profile");
		User user = userService.getOne(id);
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value = "/app/user/{id}/info", method = RequestMethod.GET)
	public ModelAndView userInfo(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("user_info");
		User user = userService.getOne(id);
		List<Post> posts = postService.findAllByUser(id);
		List<Question> questions = questionService.findAllByUser(id);
		List<Answer> answers = answerService.findAllByUser(id);
		int countBestAnswer = answerService.countBestAnswer(id);
		Question question = new Question();
		Answer answer = new Answer();
		Post post = new Post();
		mav.addObject("user", user);
		mav.addObject("posts", posts);
		mav.addObject("questions", questions);
		mav.addObject("answers", answers);
		mav.addObject("countBestAnswer", countBestAnswer);
		mav.addObject("question", question);
		mav.addObject("answer", answer);
		mav.addObject("post", post);
		return mav;
	}
	
	@RequestMapping(value="/user/{id}/notify", method=RequestMethod.GET)
	public ModelAndView notification(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("user_notification");
		//TODO
		return mav;
	}
	
	@RequestMapping(value="/app/user/save", method=RequestMethod.POST)
	public ModelAndView changeProfile(@ModelAttribute("user") User user, BindingResult result,  
			HttpSession session, RedirectAttributes redirect) {
		ModelAndView mav = new ModelAndView("user_change_profile");
		User userDB = (User) session.getAttribute(Constant.CURRENT_USER);
		user.setUserId(userDB.getUserId());
		user.setPoints(userDB.getPoints());
		user.setImage(userDB.getImage());
		userValidator.validate(user, result);
		if(result.hasErrors()) {
			return mav;
		}
		if(!userService.updateUser(user, userDB.getRole())) {
			redirect.addFlashAttribute("error", "Saved user " + user.getFullname() + " error!");
			return mav;
		}
		redirect.addFlashAttribute("success", "Saved user " + user.getFullname() + " successfully!");
		mav.setViewName("redirect:/app/user/"+user.getUserId()+"/info");
		return mav;
	}
}
