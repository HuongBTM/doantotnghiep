package com.edu.knowledge.daos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.edu.knowledge.entities.Sector;

@Repository
public interface SectorRepositery extends JpaRepository<Sector, Integer>{

	@Query("SELECT s FROM Sector s WHERE s.sectorId=?1")
	Sector findSectorById(int sectorId);

	@Query("SELECT s.sectorName FROM Sector s WHERE s.sectorName=?1")
	String getExistSectorName(String sectorName);

	@Query("SELECT s.sectorName FROM Sector s WHERE s.sectorId!=?1 and s.sectorName=?2")
	String getOtherSectorNameToCurrent(int sectorId, String sectorName);

	@Modifying
	@Query("UPDATE Sector s SET s.sectorName=?1, s.describeSector=?2 WHERE s.sectorId=?3")
	int updateSector(String sectorName, String describeSector, int sectorId);
	
	@Modifying
	@Query("DELETE FROM Sector s WHERE s.sectorId=?1")
	int deleteSector(int sectorId);
}
