package com.caravan.Dao;

import java.util.List;

import com.caravan.entity.Caravan;

public interface CaravanDao {
	
		
		// Create
	    Long saveCaravan(Caravan caravan);

	    // Read
	    Caravan getCaravanById(Long id);
	    List<Caravan> getAllCaravans();

	    // Update
	    void updateCaravan(Caravan caravan);

	    // Delete
	    void deleteCaravan(Long id);
	    
	    
}
