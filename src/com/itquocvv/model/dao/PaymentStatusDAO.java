package com.itquocvv.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itquocvv.model.bean.PaymentStatus;

@Repository
public class PaymentStatusDAO {
	
	private final String FIND_ITEMS = "SELECT * FROM paymentstatus";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private BeanPropertyRowMapper<PaymentStatus> getBeanPropertyRowMapper() {
		return new BeanPropertyRowMapper<PaymentStatus>(PaymentStatus.class);
	}
	
	public List<PaymentStatus> getItems() {
		return jdbcTemplate.query(FIND_ITEMS, getBeanPropertyRowMapper());
	}
}
