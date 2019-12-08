package com.itquocvv.model.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.itquocvv.model.bean.Category;

@Repository
public class CategoryDAO {
	

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String FIND_ITEMS_BY_PARENT_ID = "SELECT * FROM categories WHERE parentId = ? ORDER BY sort ASC";
	private final String FIND_ITEMS_BY_ID = "SELECT * FROM categories WHERE id = ?";
	private final String FIND_FINAL_ITEMS = "SELECT * FROM categories ORDER BY id DESC LIMIT 1";
	private final String INSERT_ITEM = "INSERT INTO categories(name, parentId, sort) VALUES(?, ?, ?)";
	private final String UPDATE_ITEM = "UPDATE categories SET name = ?, parentId = ?, sort = ? WHERE id = ?";
	private final String IS_EXISTED_NAME_IN_PARENT_CATEGORY = "SELECT COUNT(name) FROM categories WHERE name = ? AND parentId = ?";
	private final String DELETE_ITEM_BY_ID = "DELETE FROM categories WHERE id = ?";
	private final String DELETE_ITEMS_BY_PARENT_ID = "DELETE FROM categories WHERE parentId = ?";

	public BeanPropertyRowMapper<Category> getBeanPropertyRowMapper() {
		return new BeanPropertyRowMapper<Category>(Category.class);
	}
	
	public List<Category> getItemsByParentId(int parentId) {
		return jdbcTemplate.query(FIND_ITEMS_BY_PARENT_ID, new Object[] { parentId }, getBeanPropertyRowMapper());
	}

	public int addItem(Category objCategory) {
		return jdbcTemplate.update(INSERT_ITEM,
				new Object[] { objCategory.getName(), objCategory.getParentId(), objCategory.getSort() });
	}

	public Category getItem(int id) {
		return jdbcTemplate.queryForObject(FIND_ITEMS_BY_ID, new Object[] { id }, getBeanPropertyRowMapper());
	}
	
	public Category getFinalItemInDatabase() {
		return jdbcTemplate.queryForObject(FIND_FINAL_ITEMS, getBeanPropertyRowMapper());
	}

	public int editItem(Category objCategory) {
		return jdbcTemplate.update(UPDATE_ITEM, 
				new Object[] { objCategory.getName(), objCategory.getParentId(), objCategory.getSort(), objCategory.getId() });
	}
	
	public boolean isExistedNameInParentCategory(String name, int parentId) {
		return jdbcTemplate.queryForObject(IS_EXISTED_NAME_IN_PARENT_CATEGORY, new Object[] { name, parentId }, Boolean.class);
	}
	
	//xóa một danh mục có id
	public int deleteItemById(int id) {
		return jdbcTemplate.update(DELETE_ITEM_BY_ID, 
				new Object[] { id });
	}
	
	//xóa tất cả các danh mục con của danh mục cha có id là parentId
	public int deleteItemsByParentId(int parentId) {
		return jdbcTemplate.update(DELETE_ITEMS_BY_PARENT_ID, 
				new Object[] { parentId });
	}
	
}

