package com.edu.knowledge.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.knowledge.daos.SectorRepositery;
import com.edu.knowledge.entities.Sector;

@Service("sectorService")
public class SectorService {

	@Autowired
	SectorRepositery sectorRepositery;
	
	public List<Sector> findAll() {
		return sectorRepositery.findAll();
	}
	
	public Sector saveSector(Sector sector) {
		return sectorRepositery.save(sector);
	}
	
	public Sector getSectorById(int sectorId) {
		return sectorRepositery.getOne(sectorId);
	}
	
	public boolean checkExistedSectorName(String name) {
		return (sectorRepositery.getExistSectorName(name) !=null) ? true : false;
	}
}
