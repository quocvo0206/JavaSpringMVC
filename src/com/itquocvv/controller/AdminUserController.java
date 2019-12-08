package com.itquocvv.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itquocvv.constant.Defines;
import com.itquocvv.constant.MessageEnum;
import com.itquocvv.model.bean.Role;
import com.itquocvv.model.bean.User;
import com.itquocvv.model.dao.RoleDAO;
import com.itquocvv.model.dao.UserDAO;
import com.itquocvv.util.PaginationUtil;


@Controller
@RequestMapping("admin/user")
public class AdminUserController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private RoleDAO roleDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCrypt;
	
	@GetMapping(path = { "", "/page-{page}" })
	public String index(@PathVariable(name = "page", required = false) Integer page, ModelMap modelMap) {
		int numberOfItems = userDAO.countItems();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/user/page-1";
		} else if (page > numberOfPages) {
			return "redirect:/admin/user/page-" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		
		List<Integer> paginations = PaginationUtil.makePagination(numberOfPages, 7, page);
		
		modelMap.addAttribute("paginations", paginations);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("numberOfPages", numberOfPages);
		modelMap.addAttribute("numberOfItems", numberOfItems);
		
		List<User> listUsers = userDAO.getItemsPagination(offset);
		modelMap.addAttribute("listUsers", listUsers);
		return "admin.user.index";
	}
	
	@GetMapping({"search", "search-{name}-{page}"})
	public String search(
		@RequestParam(name="name", required=false) String searchParam,   //lấy từ doget của form tìm kiếm
		@PathVariable(name="name", required=false) String searchPathVar, //lấy từ đường dẫn
		@PathVariable(name="page", required=false) Integer page, ModelMap modelMap) {
		
		String searchString = null;
		if (searchParam == null) {
			searchString = searchPathVar;
		} else {
			searchString = searchParam;
		}
		
		int numberOfItems = userDAO.countSearchItems(searchString);
		int numberOfPages = (int) Math.ceil((float) numberOfItems / Defines.ROW_COUNT);
		
		if (page == null || page < 1) {
			page = 1;
		} else if (page > numberOfPages) {
			page = numberOfPages;
		}
		
		int offset = (page - 1) * Defines.ROW_COUNT;
		
		List<Integer> paginations = PaginationUtil.makePagination(numberOfPages, 7, page);
		
		modelMap.addAttribute("paginations", paginations);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("numberOfPages", numberOfPages);
		modelMap.addAttribute("numberOfItems", numberOfItems);
		modelMap.addAttribute("searchString", searchString);
		
		List<User> listUsers = userDAO.getSearchItemsPagination(searchString, offset);
		modelMap.addAttribute("listUsers", listUsers);
		return "admin.user.search";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") int id, RedirectAttributes ra) {
		if (userDAO.deleteItem(id) > 0) {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_DELETE_SUCCESS);
		} else {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_ERROR);
		}
		return "redirect:/admin/user";
	}
	
	@ResponseBody
	@PostMapping("deleteSelected")
	public String delChecked(@RequestParam("checked[]") List<Integer> checkedContactIds, RedirectAttributes ra) {
		for (Integer id : checkedContactIds) {
			userDAO.deleteItem(id);
		}
		return checkedContactIds.size() + "";
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<Role> listRoles = roleDAO.getItems();
		modelMap.addAttribute("listRoles", listRoles);
		return "admin.user.add";
	}
	
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objUser") User objUser, BindingResult errors,
			@RequestParam("roleId") int roleId, 
			ModelMap modelMap, RedirectAttributes ra) {
		
		/* START validate */
		objUser.setRole(new Role(roleId, null));
		//System.out.println(objUser);
		//valid has username
		if (userDAO.hasUserByUserName(objUser.getUsername())) {
			errors.rejectValue("username", "Existed.objUser.username");
		}
		
		//valid length password
		objUser.setPassword(objUser.getPassword().trim());
		if (objUser.getPassword().equals("")) {
			errors.rejectValue("password", "NotEmpty.objUser.password");
		} else if (objUser.getPassword().length() < 6 || objUser.getPassword().length() > 30) {
			errors.rejectValue("password", "ValidLength.objUser.password");
		}
		
		if (errors.hasErrors()) {
			List<Role> listRoles = roleDAO.getItems();
			modelMap.addAttribute("listRoles", listRoles);
			//System.out.println("Có lỗi validate");
			return "admin.user.add";
		}
		/* END validate */
		
		objUser.setPassword(bCrypt.encode(objUser.getPassword()));
		
		if (userDAO.addItem(objUser) > 0) {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_ADD_SUCCESS);
			ra.addFlashAttribute("objUser", objUser);//gởi objUser để tô màu cho dòng vừa sửa
			return "redirect:/admin/user";
		} else {
			List<Role> listRoles = roleDAO.getItems();
			modelMap.addAttribute("listRoles", listRoles);
			modelMap.addAttribute("eMsg", MessageEnum.MSG_ERROR);
			return "admin.user.add";
		}
	}
	
	@GetMapping("edit/{id}-{page}")
	public String edit(@PathVariable("id") int id, @PathVariable("page") int page, ModelMap modelMap) {
		User objUser = userDAO.getItem(id);
		modelMap.addAttribute("objUser", objUser);
		modelMap.addAttribute("page", page);
		List<Role> listRoles = roleDAO.getItems();
		modelMap.addAttribute("listRoles", listRoles);
		return "admin.user.edit";
	}
	
	@PostMapping("edit/{id}-{page}")
	public String edit(@Valid @ModelAttribute("objUser") User objUser, BindingResult errors,
			@PathVariable("id") int id, @PathVariable("page") int page, @RequestParam("roleId") int roleId,
			RedirectAttributes ra, ModelMap modelMap) {
		User oldUser = userDAO.getItem(id);
		
		/* START validate */
		objUser.setRole(new Role(roleId, null));
		System.out.println(objUser);
		//valid length password
		objUser.setPassword(objUser.getPassword().trim());
		if (!objUser.getPassword().equals("") && (objUser.getPassword().length() < 6 || objUser.getPassword().length() > 30)) {
			errors.rejectValue("password", "ValidLength.objUser.password");
		}
		
		if (errors.hasErrors()) {
			List<Role> listRoles = roleDAO.getItems();
			modelMap.addAttribute("listRoles", listRoles);
			System.out.println("Có lỗi validate");
			return "admin.user.edit";
		}
		 /*END validate*/
		if (objUser.getPassword().equals("")) {
			objUser.setPassword(oldUser.getPassword());
		}
		objUser.setPassword(bCrypt.encode(objUser.getPassword()));
		
		if (userDAO.editItem(objUser) > 0) {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_UPDATE_SUCCESS);
			ra.addFlashAttribute("objUser", objUser);//gởi objUser để tô màu cho dòng vừa sửa
			return "redirect:/admin/user/page-" + page;
		} else {
			List<Role> listRoles = roleDAO.getItems();
			modelMap.addAttribute("listRoles", listRoles);
			modelMap.addAttribute("eMsg", MessageEnum.MSG_ERROR);
			return "admin.user.edit";
		}
	}
}
