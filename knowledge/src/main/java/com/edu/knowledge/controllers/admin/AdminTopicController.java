package com.edu.knowledge.controllers.admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Topic;
import com.edu.knowledge.services.TopicService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/admin/topic")
public class AdminTopicController {

	@Autowired
	private TopicService topicService;
	
	@RequestMapping(value = "/alltopic", method = RequestMethod.GET)
	public ModelAndView getAllTopic() {
		ModelAndView modelAndView = new ModelAndView("admin_topic_list");
		List<Topic> topicLst = new ArrayList<>();
		topicLst = topicService.findAll();
		Topic topic = new Topic();
		modelAndView.addObject("topic", topic);
		modelAndView.addObject("topicLst", topicLst);
		return modelAndView;
	}
	
	@RequestMapping(value = "/findone/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Topic findOne(@PathVariable("id") Integer id) {
		return topicService.getTopicById(id);
	}

	@RequestMapping(value = "/savetopic", method=RequestMethod.POST)
	public ModelAndView savePending(@ModelAttribute("Topic") Topic topic, BindingResult result, HttpServletRequest request) {
		ModelAndView model = new ModelAndView("admin_Topic_edit");
		int idHidden = Integer.parseInt(request.getParameter("idHidden"));
		if(idHidden != 0) {
			topic.setTopicId(idHidden);
			if (topicService.getOtherTopicNameToCurrent(idHidden, topic.getTopicName())) {
				
				model.addObject("topic", topic);
				result.rejectValue("TopicName","Topic.TopicName.errors", "Chủ đề đã tồn tại");
			} else {
				topicService.updateTopic(topic);
				System.out.println("Topic=" +topic);
				model = new ModelAndView("redirect:/admin/topic/alltopic");
			}
		} else if (topicService.checkExistedTopicName(topic.getTopicName())) {
			result.rejectValue("TopicName", "Topic.TopicName.errors", "Chủ đề đã tồn tại");
		} else {
			topic.setCreateDate(new Date());
			topicService.saveTopic(topic);
			model = new ModelAndView("redirect:/admin/topic/alltopic");
		}
		
		return model;
	}
	
	@RequestMapping(value = "/deletetopic", method=RequestMethod.GET)
	@ResponseBody
	public String deleteTopic(HttpServletRequest request) {
		int topicId = Integer.parseInt(request.getParameter("topicid").toString());
		if(topicService.deleteTopic(topicId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
}
