package com.itquocvv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itquocvv.constant.Defines;
import com.itquocvv.constant.MessageEnum;
import com.itquocvv.model.bean.Contact;
import com.itquocvv.model.dao.ContactDAO;
import com.itquocvv.util.PaginationUtil;


@Controller
@RequestMapping("admin/contact")
public class AdminContactController {
	
	@Autowired
	private ContactDAO contactDAO;
	
	@GetMapping(path = { "", "/page-{page}" })
	public String index(@PathVariable(name = "page", required = false) Integer page, ModelMap modelMap) {
		int numberOfItems = contactDAO.countItems();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/contact/page-1";
		} else if (page > numberOfPages) {
			return "redirect:/admin/contact/page-" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		
		List<Integer> paginations = PaginationUtil.makePagination(numberOfPages, 7, page);
		
		modelMap.addAttribute("paginations", paginations);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("numberOfPages", numberOfPages);
		modelMap.addAttribute("numberOfItems", numberOfItems);
		
		List<Contact> listContacts = contactDAO.getItemsPagination(offset);
		modelMap.addAttribute("listContacts", listContacts);
		return "admin.contact.index";
	}
	
	
	/*s:search*/
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
		
		int numberOfItems = contactDAO.countSearchItems(searchString);
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
		
		List<Contact> listContacts = contactDAO.getSearchItemsPagination(searchString, offset);
		modelMap.addAttribute("listContacts", listContacts);
		return "admin.contact.search";
	}
	
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") int id, RedirectAttributes ra) {
		if (contactDAO.deleteItem(id) > 0) {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_DELETE_SUCCESS);
		} else {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_ERROR);
		}
		return "redirect:/admin/contact";
	}
	
	@ResponseBody
	@PostMapping("deleteSelected")
	public String delChecked(@RequestParam("checked[]") List<Integer> checkedContactIds, RedirectAttributes ra) {
		for (Integer id : checkedContactIds) {
			contactDAO.deleteItem(id);
		}
		return checkedContactIds.size() + "";
	}
	
}
