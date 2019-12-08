package com.itquocvv.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.itquocvv.constant.Defines;
import com.itquocvv.model.bean.Category;
import com.itquocvv.model.bean.Product;

@Repository
public class ProductDAO {
	private final String COUNT_ITEMS = "SELECT COUNT(*) FROM products";
	private final String COUNT_SEARCH_ITEMS = "SELECT COUNT(*) FROM products WHERE name LIKE ?";
	private final String FIND_ITEM_BY_ID = "SELECT p.*, c.name AS cname FROM products AS p"
			+ " INNER JOIN categories AS c ON p.categoryId = c.id WHERE p.id = ?";
	private final String FIND_ITEMS_PAGINATION = "SELECT p.*, c.name AS cname FROM products AS p"
			+ " INNER JOIN categories AS c ON p.categoryId = c.id ORDER BY p.id DESC LIMIT ?, ?";
	private final String FIND_SEARCH_ITEMS_PAGINATION = "SELECT p.*, c.name AS cname FROM products AS p"
			+ " INNER JOIN categories AS c ON p.categoryId = c.id WHERE p.name LIKE ? ORDER BY p.id DESC LIMIT ?, ?";
	private final String INSERT_ITEM = "INSERT INTO products(categoryId, name, description, content, price, discount, image, imageList)" 
			+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
	private final String EDIT_ITEM = "UPDATE products SET categoryId = ?, name = ?,"
			+ " description = ?, content = ?, price = ?, discount = ?, image = ?, imageList = ? WHERE id = ?";
	private final String DELETE_ITEM = "DELETE FROM products WHERE id = ?";
	private final String FIND_ITEMS_BY_PARENT_CATEGORY_ID_OF_CATEGORY
		= "SELECT p.*, c.name AS cname FROM products AS p INNER JOIN categories AS c ON p.categoryId = c.id WHERE c.parentId = ? LIMIT ?";
	private final String FIND_ITEMS_TOP
		= "SELECT p.*, c.name AS cname FROM products AS p INNER JOIN categories AS c ON p.categoryId = c.id ORDER BY p.id DESC"
				+ " LIMIT ?";
	private final String FIND_ITEMS_RAND
	= "SELECT p.*, c.name AS cname FROM products AS p INNER JOIN categories AS c ON p.categoryId = c.id ORDER BY RAND() "
			+ " LIMIT ?";
	private static final String COUNT_ITEMS_PAGINATION_BY_CATEGORY_ID = "SELECT COUNT(*) FROM products WHERE categoryId = ?";
	private static final String COUNT_SEARCH_ITEMS_PAGINATION_BY_CATEGORY_ID = "SELECT COUNT(*) FROM products WHERE categoryId = ? AND name LIKE ?";
	private static final String FIND_ITEMS_PAGINATION_BY_CAT_ID = "SELECT p.*, c.name AS cname FROM products AS p"
			+ " INNER JOIN categories AS c ON p.categoryId = c.id WHERE p.categoryId = ? LIMIT ?, ?";
	private static final String FIND_SEARCH_ITEMS_PAGINATION_BY_CAT_ID = "SELECT p.*, c.name AS cname FROM products AS p"
			+ " INNER JOIN categories AS c ON p.categoryId = c.id WHERE p.categoryId = ? AND p.name LIKE ? LIMIT ?, ?";
	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<Product> getRowMapper() {
		return new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new Product(rs.getInt("id"),
						new Category(rs.getInt("categoryId"), rs.getString("cname"), null, null), rs.getString("name"),
						rs.getString("description"), rs.getString("content"), rs.getInt("price"), rs.getInt("discount"),
						rs.getString("image"), rs.getString("imageList"), rs.getTimestamp("dateCreated"),
						rs.getInt("view"), rs.getInt("countBuy"));
			}
		};
	}
	
	public List<Product> getItemsPagination(int offset) {
		return jdbcTemplate.query(FIND_ITEMS_PAGINATION, new Object[] { offset, Defines.ROW_COUNT }, getRowMapper());
	}
	
	public int countItems() {
		return jdbcTemplate.queryForObject(COUNT_ITEMS, Integer.class);
	}

	public int countSearchItems(String searchString) {
		return jdbcTemplate.queryForObject(COUNT_SEARCH_ITEMS, new Object[] { "%" + searchString + "%" }, Integer.class);
	}

	public List<Product> getSearchItemsPagination(String searchString, int offset) {
		return jdbcTemplate.query(FIND_SEARCH_ITEMS_PAGINATION, new Object[] { "%" + searchString + "%", offset, Defines.ROW_COUNT }, getRowMapper());
	}

	public int addItem(Product objProduct) {
		return jdbcTemplate.update(INSERT_ITEM, 
				new Object[] { objProduct.getCategory().getId(), objProduct.getName(), objProduct.getDescription(),
						objProduct.getContent(), objProduct.getPrice(), objProduct.getDiscount(), objProduct.getImage(),
						objProduct.getImageList() });
	}

	public Product getItem(int id) {
		return jdbcTemplate.queryForObject(FIND_ITEM_BY_ID, new Object[] { id }, getRowMapper());
	}

	public int editItem(Product objProduct) {
		return jdbcTemplate.update(EDIT_ITEM,
				new Object[] { objProduct.getCategory().getId(), objProduct.getName(), objProduct.getDescription(),
						objProduct.getContent(), objProduct.getPrice(), objProduct.getDiscount(), objProduct.getImage(),
						objProduct.getImageList(), objProduct.getId() });
	}

	public int deleteItem(int id) {
		return jdbcTemplate.update(DELETE_ITEM, new Object[] { id });
	}
	
	/**
	 * @author 	Dell
	 * @param 	parentCategoryIdOfCategory	id của danh mục lớn nhất: tức là danh mục này có id là 0
	 * @return	lấy ra tất cả product của danh mục có id trên
	 */
	public List<Product> getItemsByParentCategoryIdOfCategory(int parentCategoryIdOfCategory, int limit) {
		return jdbcTemplate.query(FIND_ITEMS_BY_PARENT_CATEGORY_ID_OF_CATEGORY,
				new Object[] { parentCategoryIdOfCategory, limit }, getRowMapper());
	}
	
	
	//lấy ra limit product mới nhất
	public List<Product> getItemsTop(int limit) {
		return jdbcTemplate.query(FIND_ITEMS_TOP,
				new Object[] { limit }, getRowMapper());
	}

	public List<Product> getItemsRand(int limit) {
		return jdbcTemplate.query(FIND_ITEMS_RAND,
				new Object[] { limit }, getRowMapper());
	}

	public int countItemsByCategoryId(int categoryId) {
		return jdbcTemplate.queryForObject(COUNT_ITEMS_PAGINATION_BY_CATEGORY_ID, new Object[] { categoryId }, Integer.class);
	}
	
	public int countSearchItemsByCategoryId(int categoryId, String searchString) {
		return jdbcTemplate.queryForObject(COUNT_SEARCH_ITEMS_PAGINATION_BY_CATEGORY_ID, new Object[] { categoryId, "%" + searchString + "%" }, Integer.class);
	}

	public List<Product> getItemsPaginationsByCategoryId(int offset, int categoryId) {
		return jdbcTemplate.query(FIND_ITEMS_PAGINATION_BY_CAT_ID, new Object[] { categoryId, offset, Defines.ROW_COUNT }, getRowMapper());
	}
	
	public List<Product> getSearchItemsPaginationsByCategoryId(int offset, int categoryId, String searchString) {
		return jdbcTemplate.query(FIND_SEARCH_ITEMS_PAGINATION_BY_CAT_ID, new Object[] { categoryId, "%" + searchString + "%", offset, Defines.ROW_COUNT }, getRowMapper());
	}

	
}
