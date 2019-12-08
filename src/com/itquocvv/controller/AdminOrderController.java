package com.itquocvv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
import com.itquocvv.model.bean.Order;
import com.itquocvv.model.bean.OrderItem;
import com.itquocvv.model.bean.OrderStatus;
import com.itquocvv.model.bean.PaymentStatus;
import com.itquocvv.model.dao.OrderDAO;
import com.itquocvv.model.dao.OrderItemDAO;
import com.itquocvv.model.dao.OrderStatusDAO;
import com.itquocvv.model.dao.PaymentStatusDAO;
import com.itquocvv.util.PaginationUtil;

@Controller
@RequestMapping("admin/order")
public class AdminOrderController {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private OrderItemDAO orderItemDAO;
	
	@Autowired
	private OrderStatusDAO orderStatusDAO;
	
	@Autowired
	private PaymentStatusDAO paymentStatusDAO;
	
	@ModelAttribute
	public void commonObject(ModelMap modelMap) {
		List<OrderStatus> listOrderStatus = orderStatusDAO.getItems();
		modelMap.addAttribute("listOrderStatus", listOrderStatus);
		
		List<PaymentStatus> listPaymentStatus = paymentStatusDAO.getItems();
		modelMap.addAttribute("listPaymentStatus", listPaymentStatus);
	}

	@GetMapping(path = { "", "/page-{page}" })
	public String index(@PathVariable(name = "page", required = false) Integer page, ModelMap modelMap) {
		int numberOfItems = orderDAO.countItems();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/order/page-1";
		} else if (page > numberOfPages) {
			return "redirect:/admin/order/page-" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		
		List<Integer> paginations = PaginationUtil.makePagination(numberOfPages, 7, page);
		
		modelMap.addAttribute("paginations", paginations);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("numberOfPages", numberOfPages);
		modelMap.addAttribute("numberOfItems", numberOfItems);
		
		List<Order> listOrders = orderDAO.getItemsPagination(offset);
		modelMap.addAttribute("listOrders", listOrders);
		return "admin.order.index";
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
		
		int numberOfItems = orderDAO.countSearchItems(searchString);
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
		
		List<Order> listOrders = orderDAO.getSearchItemsPagination(searchString, offset);
		modelMap.addAttribute("listOrders", listOrders);
		return "admin.order.search";
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") int id, RedirectAttributes ra) {
		if (orderDAO.deleteItem(id) > 0) {
			orderItemDAO.deleteItemsByOrderId(id);
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_DELETE_SUCCESS);
		} else {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_ERROR);
		}
		return "redirect:/admin/order";
	}
	
	@ResponseBody
	@PostMapping("deleteSelected")
	public String delChecked(@RequestParam("checked[]") List<Integer> checkedContactIds, RedirectAttributes ra) {
		for (Integer id : checkedContactIds) {
			if (orderDAO.deleteItem(id) > 0) {
				orderItemDAO.deleteItemsByOrderId(id);
			}
		}
		return checkedContactIds.size() + "";
	}
	
	@GetMapping("orderitem/{id}-{page}")
	public String orderitem(@PathVariable("id") Integer orderId, @PathVariable("page") Integer page, ModelMap modelMap) {
		Order objOrder = orderDAO.getItem(orderId);
		modelMap.addAttribute("objOrder", objOrder);
		
		List<OrderItem> listOrderItems = orderItemDAO.getItemsByOrderId(orderId); 
		modelMap.addAttribute("listOrderItems", listOrderItems);
		
		return "admin.order.orderitem";
	}
	
	@PostMapping("orderitem/{id}-{page}")
	public String orderitem(@PathVariable("id") Integer orderId, @PathVariable("page") Integer page, 
			@RequestParam("status") Integer status, ModelMap modelMap, RedirectAttributes ra) {
		
		if (orderDAO.updateStatus(orderId, status) > 0) {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_UPDATE_SUCCESS);
			Order objOrder = orderDAO.getItem(orderId);
			ra.addFlashAttribute("objOrder", objOrder);
			return "redirect:/admin/order/page-" + page;
		} else {
			return "admin.order.orderitem";
		}
	}
	
}
