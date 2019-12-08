package com.itquocvv.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itquocvv.model.bean.OrderStatus;

@Repository
public class OrderStatusDAO {
	
	private final String FIND_ITEMS = "SELECT * FROM orderstatus";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private BeanPropertyRowMapper<OrderStatus> getBeanPropertyRowMapper() {
		return new BeanPropertyRowMapper<OrderStatus>(OrderStatus.class);
	}
	
	public List<OrderStatus> getItems() {
		return jdbcTemplate.query(FIND_ITEMS, getBeanPropertyRowMapper());
	}
}
