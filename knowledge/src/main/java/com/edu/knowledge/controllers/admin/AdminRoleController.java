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

import com.edu.knowledge.entities.Role;
import com.edu.knowledge.services.RoleService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping("/admin/role")
public class AdminRoleController {

	@Autowired
	private RoleService roleService;
	
	@RequestMapping(value = "/allrole", method = RequestMethod.GET)
	public ModelAndView getAllRole() {
		ModelAndView modelAndView = new ModelAndView("admin_role_list");
		List<Role> roleLst = new ArrayList<>();
		roleLst = roleService.findAll();
		Role role = new Role();
		modelAndView.addObject("role", role);
		modelAndView.addObject("lstRole", roleLst);
		return modelAndView;
	}
	
	@RequestMapping(value = "/findone/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Role findOne(@PathVariable("id") Integer id) {
		return roleService.getRoleById(id);
	}

	@RequestMapping(value = "/saverole", method=RequestMethod.POST)
	public ModelAndView savePending(@ModelAttribute("role") Role role, BindingResult result, HttpServletRequest request) {
		ModelAndView model = new ModelAndView("admin_role_edit");
		int idHidden = Integer.parseInt(request.getParameter("idHidden"));
		if(idHidden != 0) {
			role.setRoleId(idHidden);
			if (roleService.getOtherRoleNameToCurrent(idHidden, role.getRoleName())) {
				model.addObject("role", role);
				result.rejectValue("roleName","role.roleName.errors", "Quyền đã tồn tại");
			} else {
				roleService.updateRole(role);
				System.out.println("Role=" +role);
				model = new ModelAndView("redirect:/admin/role/allrole");
			}
		} else if (roleService.checkExistedRoleName(role.getRoleName())) {
			result.rejectValue("roleName", "role.roleName.errors", "Quyền đã tồn tại");
		} else {
			roleService.saveRole(role);
			model = new ModelAndView("redirect:/admin/role/allrole");
		}
		
		return model;
	}
	
	@RequestMapping(value = "/deleterole", method=RequestMethod.GET)
	@ResponseBody
	public String deleteRole(HttpServletRequest request) {
		int roleId = Integer.parseInt(request.getParameter("roleid").toString());
		if(roleService.deleteRole(roleId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
	
	@RequestMapping(value = "/editrole/{id}", method = RequestMethod.GET)
	public ModelAndView editSector(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("admin_role_edit");
		Role role = roleService.getRoleById(id);
		modelAndView.addObject("role", role);
		return modelAndView;
	}
}
