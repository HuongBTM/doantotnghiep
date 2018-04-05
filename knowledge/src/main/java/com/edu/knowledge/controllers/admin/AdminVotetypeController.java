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

import com.edu.knowledge.entities.VoteType;
import com.edu.knowledge.services.VoteTypeService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/admin/votetype")
public class AdminVotetypeController {

	@Autowired
	private VoteTypeService voteTypeService;
	
	@RequestMapping(value = "/allvotetype", method = RequestMethod.GET)
	public ModelAndView getAllVoteType() {
		ModelAndView modelAndView = new ModelAndView("admin_votetype_list");
		List<VoteType> voteTypeLst = new ArrayList<>();
		voteTypeLst = voteTypeService.findAll();
		VoteType voteType = new VoteType();
		modelAndView.addObject("voteType", voteType);
		modelAndView.addObject("lstVoteType", voteTypeLst);
		return modelAndView;
	}
	
	@RequestMapping(value = "/findone/{id}", method = RequestMethod.GET)
	@ResponseBody
	public VoteType findOne(@PathVariable("id") int id) {
		return voteTypeService.getVoteTypeById(id);
	}
	
	/*@RequestMapping(value = "/addvotetype", method = RequestMethod.GET)
	public ModelAndView addVoteType() {
		ModelAndView modelAndView = new ModelAndView("admin_votetype_edit");
		VoteType voteType = new VoteType();
		modelAndView.addObject("voteType", voteType);
		return modelAndView;
	}
	
	@RequestMapping(value = "/editvotetype/{id}", method = RequestMethod.GET)
	public ModelAndView editVoteType(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("admin_VoteType_edit");
		VoteType voteType = voteTypeService.getVoteTypeById(id);
		modelAndView.addObject("voteType", voteType);
		return modelAndView;
	}*/
	
	@RequestMapping(value = "/savevotetype", method=RequestMethod.POST)
	public ModelAndView saveVoteType(@ModelAttribute("voteType") VoteType voteType, BindingResult result, HttpServletRequest request) {
		ModelAndView model = new ModelAndView("admin_votetype_edit");
		int idHidden = Integer.parseInt(request.getParameter("idHidden"));
		if(idHidden != 0) {
			System.out.println(voteType);
			voteType.setVoteTypeId(idHidden);
			if (voteTypeService.getOtherVoteTypeNameToCurrent(idHidden, voteType.getVoteTypeName())) {
				model.addObject("voteType", voteType);
				result.rejectValue("voteTypeName","voteType.voteTypeName.errors", "Tên loại vote đã tồn tại");
			} else {
				voteTypeService.updateVoteType(voteType);
				System.out.println("voteType=" +voteType);
				model = new ModelAndView("redirect:/admin/votetype/allvotetype");
			}
		} else if (voteTypeService.checkExistedVoteTypeName(voteType.getVoteTypeName())) {
			result.rejectValue("voteTypeName","voteType.voteTypeName.errors", "Tên loại vote đã tồn tại");
		} else {
			voteTypeService.saveVoteType(voteType);
			model = new ModelAndView("redirect:/admin/votetype/allvotetype");
		}
		
		return model;
	}
	
	@RequestMapping(value = "/deletevotetype", method=RequestMethod.GET)
	@ResponseBody
	public String deleteVoteType(HttpServletRequest request) {
		int voteTypeId = Integer.parseInt(request.getParameter("votetypeid").toString());
		if(voteTypeService.deleteVoteType(voteTypeId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
}
