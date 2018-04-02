package com.edu.knowledge.controllers.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.edu.knowledge.entities.Sector;
import com.edu.knowledge.services.SectorService;

@Controller
@RequestMapping(value = "/admin/sector")
public class SectorController {

	@Autowired
	private SectorService sectorService;
	
	@RequestMapping(value = "/allsector", method= RequestMethod.GET)
	public ModelAndView getAllSector() {
		ModelAndView modelAndView = new ModelAndView("admin_sector");
		List<Sector> sectorLst = new ArrayList<>();
		sectorLst = sectorService.findAll();
		Sector sector = new Sector();
		modelAndView.addObject("sector", sector);
		modelAndView.addObject("lstSector", sectorLst);
		return modelAndView;
	}
	
	public Sector addSector(@ModelAttribute("sector") Sector sector) {
		if (sectorService.checkExistedSectorName(sector.getSectorName())) {
			return null;
		}
		return sectorService.saveSector(sector);
	}
	
	@RequestMapping(value = "/updateSector/", method=RequestMethod.PUT)
	public String updateSector(@PathVariable(value = "id") Integer sectorId, @ModelAttribute("sector") Sector sector) {
		Sector updateSector = sectorService.getSectorById(sectorId);
		if(updateSector == null) {
			return "entity not found";
		} else if (sectorService.checkExistedSectorName(sector.getSectorName())) {
			return "existed sector name";
		}
		updateSector.setSectorName(sector.getSectorName());
		updateSector.setDescribeSector(sector.getDescribeSector());
		updateSector = sectorService.saveSector(updateSector);
		return "success";
	}
}
