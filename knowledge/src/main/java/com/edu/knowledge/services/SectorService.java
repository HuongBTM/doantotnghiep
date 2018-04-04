package com.edu.knowledge.services;

import java.util.List;

import javax.transaction.Transactional;

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
	
	public Sector getSectorById(int sectorId) {
		return sectorRepositery.findSectorById(sectorId);
	}
	
	public Sector saveSector(Sector sector) {
		return sectorRepositery.save(sector);
	}
	public boolean getOtherSectorNameToCurrent(int sectorId, String sectorName) {
		return (sectorRepositery.getOtherSectorNameToCurrent(sectorId, sectorName) != null) ? true : false;
	}
	public boolean checkExistedSectorName(String name) {
		return (sectorRepositery.getExistSectorName(name) !=null) ? true : false;
	}

	@Transactional
	public boolean updateSector(Sector sector) {
		int rowUpdate = sectorRepositery.updateSector(sector.getSectorName(), sector.getDescribeSector(), sector.getSectorId());
		return (rowUpdate==0) ? false :true;
	}
	
	@Transactional
	public int deleteSector(int sectorId) {
		return sectorRepositery.deleteSector(sectorId);
	}
}
