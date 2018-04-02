package com.edu.knowledge.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Sector;

@Repository
public interface SectorRepositery extends JpaRepository<Sector, Integer>{

	@Query("SELECT s FROM Sector s WHERE s.sectorId=?1")
	Sector findSectorById(int sectorId);
	
	@Query("SELECT s.sectorName FROM Sector s WHERE s.sectorName=?1")
	String getExistSectorName(String sectorName);
}
