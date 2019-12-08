package com.itquocvv.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itquocvv.model.bean.Category;
import com.itquocvv.model.bean.Product;
import com.itquocvv.model.dao.CategoryDAO;
import com.itquocvv.model.dao.ProductDAO;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	/**
	 * @author 	Dell
	 * @return 	lấy ra map category cho menu 2 cấp: mỗi phần tử của map gồm: key: category cha, 
	 * 			value: list category con của categoy cha là key
	 */
	public Map<Category, List<Category>> getMapCategory() {
		Map<Category, List<Category>> mapCategories = new LinkedHashMap<Category, List<Category>>();
		List<Category> listCategoriesParent = categoryDAO.getItemsByParentId(0);
		for (Category item : listCategoriesParent) {
			mapCategories.put(item, categoryDAO.getItemsByParentId(item.getId()));
		}
		/*for (Map.Entry<Category, List<Category>> entry : mapCategories.entrySet()) {
	        System.out.println(entry.getKey());
	        for (Category item : entry.getValue()) {
				System.out.println("\t" + item);
			}
	    }*/
		return mapCategories;
	}
	
	/**
	 * @author 	Dell
	 * @param 	parentCategoryId	category id equal zero
	 * @return	hash map<Category, List<Product>>
	 */
	public Map<Category, List<Product>> getMapProductByParentCateogy() {
		Map<Category, List<Product>> mapProductByParentCateogy = new LinkedHashMap<Category, List<Product>>();
		List<Category> listCategoriesParent = categoryDAO.getItemsByParentId(0);
		for (Category item : listCategoriesParent) {
			mapProductByParentCateogy.put(item, productDAO.getItemsByParentCategoryIdOfCategory(item.getId(), 8));
		}
		/*for (Map.Entry<Category, List<Product>> entry : mapProductByParentCateogy.entrySet()) {
	        System.out.println(entry.getKey());
	        for (Product item : entry.getValue()) {
				System.out.println("\t" + item.getName());
			}
	    }*/
		return mapProductByParentCateogy;
	}
	
}
