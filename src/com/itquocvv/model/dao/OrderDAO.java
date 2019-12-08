package com.itquocvv.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.itquocvv.constant.Defines;
import com.itquocvv.model.bean.Order;

@Repository
public class OrderDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String INSERT_ITEM = "INSERT INTO orders(status, fullname, address, email, phone, message, amount, payment)"
			+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
	private final String COUNT_ITEMS = "SELECT COUNT(*) FROM orders";
	private final String COUNT_SEARCH_ITEMS = "SELECT COUNT(*) FROM orders WHERE fullname LIKE ?";
	private final String FIND_ITEMS_PAGINATION = "SELECT * FROM orders ORDER BY id DESC LIMIT ?, ?";
	private final String FIND_SEARCH_ITEMS_PAGINATION = "SELECT * FROM orders WHERE fullname LIKE ? ORDER BY id DESC LIMIT ?, ?";
	private final String DELETE_ITEM = "DELETE FROM orders WHERE id = ?";
	
	private final String FIND_ITEM_BY_ID = "SELECT * FROM orders WHERE id = ?";
	private final String UPDATE_STATUS = "UPDATE orders SET status = ? WHERE id = ?";
	
	public Order addItem(Order objOrder) {
		KeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement pst = connection.prepareStatement(INSERT_ITEM, Statement.RETURN_GENERATED_KEYS); 
				pst.setInt(1, objOrder.getStatus());
				pst.setString(2, objOrder.getFullname());
				pst.setString(3, objOrder.getAddress());
				pst.setString(4, objOrder.getEmail());
				pst.setString(5, objOrder.getPhone());
				pst.setString(6, objOrder.getMessage());
				pst.setInt(7, objOrder.getAmount());
				pst.setString(8, objOrder.getPayment());
				return pst;
			}
		}, holder);
		objOrder.setId(holder.getKey().intValue());
		return objOrder;
	}
	
	private BeanPropertyRowMapper<Order> getBeanPropertyRowMapper() {
		return new BeanPropertyRowMapper<Order>(Order.class);
	}
	
	public int countItems() {
		return jdbcTemplate.queryForObject(COUNT_ITEMS, Integer.class);
	}

	public List<Order> getItemsPagination(int offset) {
		return jdbcTemplate.query(FIND_ITEMS_PAGINATION, new Object[] { offset, Defines.ROW_COUNT }, getBeanPropertyRowMapper());
	}

	public int countSearchItems(String searchString) {
		return jdbcTemplate.queryForObject(COUNT_SEARCH_ITEMS, new Object[] { "%" + searchString + "%" }, Integer.class);
	}

	public List<Order> getSearchItemsPagination(String searchString, int offset) {
		return jdbcTemplate.query(FIND_SEARCH_ITEMS_PAGINATION,
				new Object[] { "%" + searchString + "%", offset, Defines.ROW_COUNT }, getBeanPropertyRowMapper());
	}

	public int deleteItem(int id) {
		return jdbcTemplate.update(DELETE_ITEM, new Object[] { id });
	}

	public Order getItem(Integer orderId) {
		return jdbcTemplate.queryForObject(FIND_ITEM_BY_ID, new Object[] {orderId}, getBeanPropertyRowMapper());
	}
	
	public int updateStatus(int orderId, int status) {
		return jdbcTemplate.update(UPDATE_STATUS, new Object[] { status, orderId });
	}
	
}
