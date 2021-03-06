package com.edu.knowledge.controllers.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
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
import com.edu.knowledge.entities.Post;
import com.edu.knowledge.entities.Question;
import com.edu.knowledge.entities.Role;
import com.edu.knowledge.entities.Sector;
import com.edu.knowledge.entities.User;
import com.edu.knowledge.services.AnswerService;
import com.edu.knowledge.services.PostService;
import com.edu.knowledge.services.QuestionService;
import com.edu.knowledge.services.RoleService;
import com.edu.knowledge.services.SectorService;
import com.edu.knowledge.services.UserService;
import com.edu.knowledge.utils.Constant;
import com.edu.knowledge.validator.UserValidator;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private SectorService sectorService;
	
	@Autowired
	private UserValidator userValidator;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private PostService postService;
	
	@RequestMapping(value ="/alluser", method=RequestMethod.GET)
	public ModelAndView findAllUser() {
		ModelAndView modelAndView = new ModelAndView("admin_user_list");
		List<User> users = new ArrayList<>();
		users = userService.findAllUser();
		modelAndView.addObject("users", users);
		return modelAndView;
	}
	
	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Set.class, "sectors", new CustomCollectionEditor(Set.class) {
            @Override
            protected Object convertElement(Object element) {
                Integer id = Integer.parseInt((String) element);
                return sectorService.getOne(id);
            }
        });
    }
	
	@RequestMapping(value="/adduser", method=RequestMethod.GET)
	public ModelAndView addUser() {
		ModelAndView modelAndView = new ModelAndView("admin_user_edit");
		User user = new User();
		List<Sector> sectors = sectorService.findAll();
		modelAndView.addObject("user", user);
		modelAndView.addObject("sectors", sectors);
		return modelAndView;
	}
	
	@RequestMapping(value="/{id}", method=RequestMethod.GET)
	public ModelAndView userDetail(@PathVariable("id") int userId) {
		ModelAndView mav = new ModelAndView("admin_user_detail");
		User user = userService.getOne(userId);
		List<Question> questions = questionService.findAllByUser(userId);
		List<Answer> answers = answerService.findAllByUser(userId);
		List<Post> posts = postService.findAllByUser(userId);
		int countBestAnswer = answerService.countBestAnswer(userId);
		mav.addObject("questions", questions);
		mav.addObject("answers", answers);
		mav.addObject("posts", posts);
		mav.addObject("user",user);
		mav.addObject("countBestAnswer", countBestAnswer);
		return mav;
	}
	
	@RequestMapping(value= "/edit/{id}", method=RequestMethod.GET)
	public ModelAndView editUser(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.getOne(id);
		if(user == null) {
			modelAndView.setViewName("404");
		} else {
			List<Sector> sectors = sectorService.findAll();
			modelAndView.addObject("sectors", sectors);
			modelAndView.addObject("user", user);
			modelAndView.setViewName("admin_user_edit");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public ModelAndView saveUserEdit(@ModelAttribute("user") User user, BindingResult result, 
			@RequestParam("roleSelect") String roleName, RedirectAttributes redirect, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("admin_user_edit");
		Role dbRole = roleService.findRoleByName(roleName);
		user.setRole(dbRole);
		int idHidden= Integer.parseInt(request.getParameter("idHidden").toString());
		user.setUserId(idHidden);
		
		userValidator.validate(user, result);
		if(result.hasErrors()) {
			List<Sector> sectors = sectorService.findAll();
			modelAndView.addObject("sectors", sectors);
			return modelAndView;
		}
		if(user.getUserId() ==0) {
			user.setImage("avatar.png");
			userService.createUser(user , dbRole);
		} else {
			User userdb = userService.getOne(user.getUserId());
			
			user.setImage(userdb.getImage());
			user.setPoints(userdb.getPoints());
			if(!userService.updateUser(user, dbRole)) {
				redirect.addFlashAttribute("error", "Saved user " + user.getFullname() + " error!");
				return modelAndView;
			} else if(user.isExpect()) {
				userService.updateSector(user.getSectors(), user);
			}
		}
		redirect.addFlashAttribute("success", "Saved user " + user.getFullname() + " successfully!");
		modelAndView.setViewName("redirect:/admin/user/alluser");
		return modelAndView;
	}
	
	@RequestMapping(value = "/deleteuser", method=RequestMethod.GET)
	@ResponseBody
	public String deleteUser(HttpServletRequest request) {
		int userId = Integer.parseInt(request.getParameter("userid").toString());
		if(userService.deleteUser(userId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
	
	@RequestMapping(value="/print", method=RequestMethod.GET)
	public ModelAndView print() {
		ModelAndView modelAndView = new ModelAndView("admin_user_print");
		List<User> users = new ArrayList<>();
		users = userService.findAllUser();
		modelAndView.addObject("users", users);
		return modelAndView;
	}
	
	@RequestMapping(value="/{userId}/changeprofile", method=RequestMethod.GET)
	public ModelAndView updateProfile(@PathVariable("userId") int userId, HttpSession session) {
		ModelAndView mav = new ModelAndView("admin_change_profile");
		User user = (User) session.getAttribute(Constant.CURRENT_USER);
		mav.addObject("user", user);
		return mav;
	}
	
	@RequestMapping(value="/save/profile", method= RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("user") User user, BindingResult result,  HttpSession session, RedirectAttributes redirect) {
		ModelAndView mav = new ModelAndView("admin_chamge_profile");
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
		mav.setViewName("redirect:/admin/user/"+user.getUserId());
		return mav;
	}
}
