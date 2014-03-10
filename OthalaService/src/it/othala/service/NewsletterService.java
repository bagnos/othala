package it.othala.service;

import it.othala.dao.interfaces.INewsletterDAO;
import it.othala.service.interfaces.INewsletterService;

public class NewsletterService implements INewsletterService {

	private INewsletterDAO newsDAO;

	public void setNewsDAO(INewsletterDAO newsDAO) {
		this.newsDAO = newsDAO;
	}

	@Override
	public void insertNewsletter(String email) {
		// TODO Auto-generated method stub
		if (email != null && !email.isEmpty()) {
			if (newsDAO.existNewsletter(email) == 0) {
				newsDAO.insertNewsletter(email);
			}
		}
	}

}
