package com.edu.knowledge.controllers.admin;

import java.util.ArrayList;
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

import com.edu.knowledge.entities.PendingTag;
import com.edu.knowledge.services.PendingTagService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/admin/pendingtag")
public class AdminPendingTagController {

	@Autowired
	private PendingTagService pendingTagService;
	
	@RequestMapping(value = "/allpendingtag", method = RequestMethod.GET)
	public ModelAndView getAllPendingTag() {
		ModelAndView modelAndView = new ModelAndView("admin_pendingtag_list");
		List<PendingTag> pendingTagLst = new ArrayList<>();
		pendingTagLst = pendingTagService.findAll();
		PendingTag pendingTag = new PendingTag();
		modelAndView.addObject("pendingTag", pendingTag);
		modelAndView.addObject("lstPendingTag", pendingTagLst);
		return modelAndView;
	}
	
	@RequestMapping(value = "/findone/{id}", method = RequestMethod.GET)
	@ResponseBody
	public PendingTag findOne(@PathVariable("id") Integer id) {
		return pendingTagService.getPendingTagById(id);
	}
	
	/*@RequestMapping(value = "/addpendingtag", method = RequestMethod.GET)
	public ModelAndView addPendingTag() {
		ModelAndView modelAndView = new ModelAndView("admin_pending_edit");
		PendingTag pendingTag = new PendingTag();
		modelAndView.addObject("pendingTag", pendingTag);
		return modelAndView;
	}
	
	@RequestMapping(value = "/editpendingtag/{id}", method = RequestMethod.GET)
	public ModelAndView editPending(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("admin_pendingtag_edit");
		PendingTag pendingTag = pendingTagService.getPendingTagById(id);
		modelAndView.addObject("pendingTag", pendingTag);
		return modelAndView;
	}*/
	
	@RequestMapping(value = "/savependingtag", method=RequestMethod.POST)
	public ModelAndView savePending(@ModelAttribute("pendingTag") PendingTag pendingTag, BindingResult result, HttpServletRequest request) {
		ModelAndView model = new ModelAndView("admin_pendingtag_edit");
		int idHidden = Integer.parseInt(request.getParameter("idHidden"));
		if(idHidden != 0) {
			pendingTag.setPendingId(idHidden);
			if (pendingTagService.getOtherPendingTagNameToCurrent(idHidden, pendingTag.getPendingName())) {
				model.addObject("pendingTag", pendingTag);
				result.rejectValue("pendingTagName","pendingTag.pendingName.errors", "Trạng thái đã tồn tại");
			} else {
				pendingTagService.updatePendingTag(pendingTag);
				System.out.println("pendingTag=" +pendingTag);
				model = new ModelAndView("redirect:/admin/pendingtag/allpendingtag");
			}
		} else if (pendingTagService.checkExistedPendingTagName(pendingTag.getPendingName())) {
			result.rejectValue("pendingTagName", "pendingTag.pendingName.errors", "Trạng thái đã tồn tại");
		} else {
			pendingTagService.savePendingTag(pendingTag);
			model = new ModelAndView("redirect:/admin/pendingtag/allpendingtag");
		}
		
		return model;
	}
	
	@RequestMapping(value = "/deletependingtag", method=RequestMethod.GET)
	@ResponseBody
	public String deletePendingTag(HttpServletRequest request) {
		int pendingTagId = Integer.parseInt(request.getParameter("pendingtagid").toString());
		if(pendingTagService.deletePendingTag(pendingTagId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
}
