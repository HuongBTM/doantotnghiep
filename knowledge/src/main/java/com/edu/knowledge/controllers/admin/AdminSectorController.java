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

import com.edu.knowledge.entities.Sector;
import com.edu.knowledge.services.SectorService;
import com.edu.knowledge.utils.Constant;

@Controller
@RequestMapping(value = "/admin/sector")
public class AdminSectorController {

	@Autowired
	private SectorService sectorService;
	
	@RequestMapping(value = "/allsector", method = RequestMethod.GET)
	public ModelAndView getAllSector() {
		ModelAndView modelAndView = new ModelAndView("admin_sector_list");
		List<Sector> sectorLst = new ArrayList<>();
		sectorLst = sectorService.findAll();
		Sector sector = new Sector();
		modelAndView.addObject("sector", sector);
		modelAndView.addObject("lstSector", sectorLst);
		return modelAndView;
	}
	
	@RequestMapping(value = "/findone/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Sector findOne(@PathVariable("id") Integer sectorId) {
		return sectorService.getSectorById(sectorId);
	}
	
	@RequestMapping(value = "/addsector", method = RequestMethod.GET)
	public ModelAndView addSector() {
		ModelAndView modelAndView = new ModelAndView("admin_sector_edit");
		Sector sector = new Sector();
		modelAndView.addObject("sector", sector);
		return modelAndView;
	}
	
	@RequestMapping(value = "/editsector/{id}", method = RequestMethod.GET)
	public ModelAndView editSector(@PathVariable("id") Integer sectorId) {
		ModelAndView modelAndView = new ModelAndView("admin_sector_edit");
		Sector sector = sectorService.getSectorById(sectorId);
		modelAndView.addObject("sector", sector);
		return modelAndView;
	}
	
	@RequestMapping(value = "/savesector", method=RequestMethod.POST)
	public ModelAndView saveSector(@ModelAttribute("sector") Sector sector, BindingResult result, HttpServletRequest request) {
		ModelAndView model = new ModelAndView("admin_sector_edit");
		int idHidden = Integer.parseInt(request.getParameter("idHidden"));
		if(idHidden != 0) {
			sector.setSectorId(idHidden);
			if (sectorService.getOtherSectorNameToCurrent(idHidden, sector.getSectorName())) {
				model.addObject("sector", sector);
				result.rejectValue("sectorName","sector.sectorName.errors", "Lĩnh vực đã tồn tại");
			} else {
				sectorService.updateSector(sector);
				System.out.println("sector=" +sector);
				model = new ModelAndView("redirect:/admin/sector/allsector");
			}
		} else if (sectorService.checkExistedSectorName(sector.getSectorName())) {
			result.rejectValue("sectorName", "sector.sectorName.errors", "Lĩnh vực đã tồn tại");
		} else {
			sectorService.saveSector(sector);
			model = new ModelAndView("redirect:/admin/sector/allsector");
		}
		
		return model;
	}
	
	@RequestMapping(value = "/deletesector", method=RequestMethod.GET)
	@ResponseBody
	public String deleteSector(HttpServletRequest request) {
		int sectorId = Integer.parseInt(request.getParameter("sectorid").toString());
		if(sectorService.deleteSector(sectorId) ==1) {
			return Constant.SUCCESS;
		}
		return Constant.ERROR;
	}
	
	@RequestMapping(value="/user/{id}")
	public ModelAndView listUser(@PathVariable("id") int sectorId) {
		ModelAndView mav = new ModelAndView("admin_sector_user");
		Sector sector = sectorService.getOne(sectorId);
		mav.addObject("sector", sector);
		return mav;
	}
}
