package com.itquocvv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itquocvv.model.dao.ContactDAO;
import com.itquocvv.model.dao.OrderDAO;
import com.itquocvv.model.dao.ProductDAO;
import com.itquocvv.model.dao.UserDAO;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private ContactDAO contactDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@GetMapping("")
	public String index(ModelMap modelMap) {
		int countUser = userDAO.countItems();
		modelMap.addAttribute("countUser", countUser);
		
		int countContact = contactDAO.countItems();
		modelMap.addAttribute("countContact", countContact);
		
		int countOrder = orderDAO.countItems();
		modelMap.addAttribute("countOrder", countOrder);
		
		int countProduct = productDAO.countItems();
		modelMap.addAttribute("countProduct", countProduct);
		return "admin.index.index";
	}
	
}
