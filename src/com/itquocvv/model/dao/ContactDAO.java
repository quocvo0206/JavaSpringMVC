package com.itquocvv.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itquocvv.constant.Defines;
import com.itquocvv.model.bean.Contact;

@Repository
public class ContactDAO {
	private final String INSERT_ITEM = "INSERT INTO contacts(fullname, numberPhone, email, subject, message) VALUES(?, ?, ?, ?, ?)";
	private final String COUNT_ITEMS = "SELECT COUNT(*) FROM contacts";
	private final String COUNT_SEARCH_ITEMS = "SELECT COUNT(*) FROM contacts WHERE fullname LIKE ?";
	private final String FIND_ITEMS_PAGINATION = "SELECT * FROM contacts ORDER BY id DESC LIMIT ?, ?";
	private final String FIND_SEARCH_ITEMS_PAGINATION = "SELECT * FROM contacts WHERE fullname LIKE ? ORDER BY id DESC LIMIT ?, ?";
	private final String DELETE_ITEM = "DELETE FROM contacts WHERE id = ?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public BeanPropertyRowMapper<Contact> getBeanPropertyRowMapper() {
		return new BeanPropertyRowMapper<Contact>(Contact.class);
	}
	
	public int insertItem(Contact objContact) {
		return jdbcTemplate.update(INSERT_ITEM, new Object[] { objContact.getFullname(), objContact.getNumberphone(),
				objContact.getEmail(), objContact.getSubject(), objContact.getMessage() });
	}

	public int countItems() {
		return jdbcTemplate.queryForObject(COUNT_ITEMS, Integer.class);
	}

	public List<Contact> getItemsPagination(int offset) {
		return jdbcTemplate.query(FIND_ITEMS_PAGINATION, new Object[] { offset, Defines.ROW_COUNT }, getBeanPropertyRowMapper());
	}

	public int countSearchItems(String searchString) {
		return jdbcTemplate.queryForObject(COUNT_SEARCH_ITEMS, new Object[] { "%" + searchString + "%" }, Integer.class);
	}

	public List<Contact> getSearchItemsPagination(String searchString, int offset) {
		return jdbcTemplate.query(FIND_SEARCH_ITEMS_PAGINATION, 
				new Object[] { "%" + searchString + "%", offset, Defines.ROW_COUNT }, getBeanPropertyRowMapper());
	}

	public int deleteItem(int id) {
		return jdbcTemplate.update(DELETE_ITEM, new Object[] { id });
	}
}
