package com.itquocvv.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.itquocvv.model.bean.Category;
import com.itquocvv.model.bean.Order;
import com.itquocvv.model.bean.OrderItem;
import com.itquocvv.model.bean.Product;

@Repository
public class OrderItemDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String INSERT_ITEM = "INSERT INTO orderitems(orderId, productId, quantity) VALUES(?, ?, ?)";
	private final String DELETE_ITEMS_BY_ORDER_ID = "DELETE FROM orderitems WHERE orderId = ?";
	
	private final String FIND_ITEMS_BY_ORDER_ID = 
			"SELECT\r\n" + 
			"    oi.id AS oi_id,\r\n" + 
			"    oi.orderId AS oi_orderId,\r\n" + 
			"    oi.productId AS oi_productId,\r\n" + 
			"    oi.quantity AS oi_quantity,\r\n" + 
			"    o.id AS o_id,\r\n" + 
			"    o.status AS o_status,\r\n" + 
			"    o.fullname AS o_fullname,\r\n" + 
			"    o.address AS o_address,\r\n" + 
			"    o.email AS o_email,\r\n" + 
			"    o.phone AS o_phone,\r\n" + 
			"    o.message AS o_message,\r\n" + 
			"    o.amount AS o_amouut,\r\n" + 
			"    o.payment AS o_payment,\r\n" + 
			"    o.dateCreated AS o_dateCreared,\r\n" + 
			"    p.id AS p_id,\r\n" + 
			"    p.categoryId AS p_categoryId,\r\n" + 
			"    p.name AS p_name,\r\n" + 
			"    p.description AS p_description,\r\n" + 
			"    p.content AS p_content,\r\n" + 
			"    p.price AS p_price,\r\n" + 
			"    p.discount AS p_discount,\r\n" + 
			"    p.image AS p_image,\r\n" + 
			"    p.imageList AS p_imageList,\r\n" + 
			"    p.dateCreated AS p_dateCreate,\r\n" + 
			"    p.view AS p_view,\r\n" + 
			"    p.countBuy AS p_countBuy\r\n" + 
			"FROM\r\n" + 
			"    orderitems AS oi\r\n" + 
			"INNER JOIN orders AS o\r\n" + 
			"ON\r\n" + 
			"    oi.orderId = o.id\r\n" + 
			"INNER JOIN products AS p\r\n" + 
			"ON\r\n" + 
			"    oi.productId = p.id\r\n" + 
			"WHERE\r\n" + 
			"    oi.orderId = ?";
	
	private RowMapper<OrderItem> getRowMapper() {
		return new RowMapper<OrderItem>() {

			@Override
			public OrderItem mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrderItem orderItem = new OrderItem(rs.getInt("oi_id"), 
						
						new Order(rs.getInt("o_id"), rs.getInt("o_status"), rs.getString("o_fullname"), rs.getString("o_address"),
						rs.getString("o_email"), rs.getString("o_phone"), rs.getString("o_message"),
						rs.getTimestamp("o_dateCreared"), rs.getInt("o_amouut"), rs.getString("o_payment")), 
						
						new Product(rs.getInt("p_id"), new Category(rs.getInt("p_categoryId"), null, null, null),
						rs.getString("p_name"), rs.getString("p_description"), rs.getString("p_content"), rs.getInt("p_price"),
						rs.getInt("p_discount"), rs.getString("p_image"), rs.getString("p_imageList"), rs.getTimestamp("p_dateCreate"),
						rs.getInt("p_view"), rs.getInt("p_countBuy")), 
						
						rs.getInt("oi_quantity"));
				return orderItem;
			}
		};
	}
	
	public List<OrderItem> getItemsByOrderId(int orderId) {
		return jdbcTemplate.query(FIND_ITEMS_BY_ORDER_ID, new Object[] { orderId }, getRowMapper());
	}
	
	public int addItem(OrderItem objOrderItem) {
		return jdbcTemplate.update(INSERT_ITEM, new Object[] { objOrderItem.getOrder().getId(),
				objOrderItem.getProduct().getId(), objOrderItem.getQuantity() });
	}
	
	public int deleteItemsByOrderId(int orderId) {
		return jdbcTemplate.update(DELETE_ITEMS_BY_ORDER_ID, new Object[] { orderId });
	}
	
}
