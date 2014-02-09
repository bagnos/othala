package it.othala.service;

import org.springframework.beans.factory.annotation.Autowired;

import it.othala.dao.interfaces.ISampleDAO;
import it.othala.service.interfaces.ISampleService;

public class SampleService implements ISampleService {
	
	@Autowired
	private ISampleDAO sampleDAO;

	public void setSampleDAO(ISampleDAO sampleDAO) {
		this.sampleDAO = sampleDAO;
	}

	@Override
	public Integer getId() {
		// TODO Auto-generated method stub
		return sampleDAO.getId();
		
	}

}
