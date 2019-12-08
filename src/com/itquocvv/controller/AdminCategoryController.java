package com.itquocvv.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itquocvv.constant.MessageEnum;
import com.itquocvv.model.bean.Category;
import com.itquocvv.model.dao.CategoryDAO;
import com.itquocvv.service.CategoryService;

@Controller
@RequestMapping("admin/category")
public class AdminCategoryController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private CategoryDAO categoryDAO;

	@ModelAttribute
	public void commonObject(ModelMap modelMap) {
		// hỗ trợ menu 2 cấp
		Map<Category, List<Category>> mapCategories = categoryService.getMapCategory();
		modelMap.addAttribute("mapCategories", mapCategories);
	}

	@GetMapping("")
	public String index() {
		return "admin.category.index";
	}

	@GetMapping("/table-arange")
	public String indexDatatable() {
		return "admin.category.index-datatable";
	}

	/* START add */
	@GetMapping("add")
	public String add() {
		return "admin.category.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objCategory") Category objCategory, BindingResult errors,
			RedirectAttributes ra) {

		/* START validate category */
		if (objCategory.getSort() == null) {
			errors.rejectValue("sort", "NotNull.objCategory.sort");
		}

		// check is existed name in parent category
		objCategory.setName(objCategory.getName().trim());
		if (categoryDAO.isExistedNameInParentCategory(objCategory.getName(), objCategory.getParentId())) {
			errors.rejectValue("name", "Existed.objCategory.name");
		}

		if (errors.hasErrors()) {
			return "admin.category.add";
		}
		/* END validate category */

		if (categoryDAO.addItem(objCategory) > 0) {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_ADD_SUCCESS);
			ra.addFlashAttribute("objCategory", categoryDAO.getFinalItemInDatabase()); // lấy ra danh mục vừa thêm được
			return "redirect:/admin/category";
		} else {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_ERROR);
			return "redirect:/admin/category/add";
		}
	}
	/* END add */

	/* START edit */
	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") int id, ModelMap modelMap) {
		Category objCategory = categoryDAO.getItem(id);
		modelMap.addAttribute("objCategory", objCategory);
		return "admin.category.edit";
	}

	@PostMapping("edit/{id}")
	public String edit(@PathVariable("id") int id, @Valid @ModelAttribute("objCategory") Category objCategory,
			BindingResult errors, RedirectAttributes ra) {
		/* START validate category */
		if (objCategory.getSort() == null) {
			errors.rejectValue("sort", "NotNull.objCategory.sort");
		}

		// check is existed name in parent category
		objCategory.setName(objCategory.getName().trim());
		Category oldCategory = categoryDAO.getItem(id); // sửa nếu khác tên cũ thì kiểm tra có trùng với tên các danh
														// mục cùng cấp hay ko
		if (!oldCategory.getName().equalsIgnoreCase(objCategory.getName())) {
			if (categoryDAO.isExistedNameInParentCategory(objCategory.getName(), objCategory.getParentId())) {
				errors.rejectValue("name", "Existed.objCategory.name");
			}
		}

		if (errors.hasErrors()) {
			return "admin.category.add";
		}
		/* END validate category */

		if (categoryDAO.editItem(objCategory) > 0) {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_UPDATE_SUCCESS);
			ra.addFlashAttribute("objCategory", objCategory);// gởi objCategory để tô màu cho dòng vừa sửa
			return "redirect:/admin/category";
		} else {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_ERROR);
			return "redirect:/admin/category/edit";
		}
	}
	/* END edit */

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") int id, RedirectAttributes ra) {
		Category objCategory = categoryDAO.getItem(id);
		if (objCategory.getParentId() == 0) {
			// nếu danh mục này đang là danh mục cha thì xóa tất cả những danh mục con của
			// nó
			int result = 0;
			result += categoryDAO.deleteItemsByParentId(objCategory.getId());
			result += categoryDAO.deleteItemById(objCategory.getId());
			if (result > 0) {
				ra.addFlashAttribute("eMsg", MessageEnum.MSG_DELETE_SUCCESS);
			} else {
				ra.addFlashAttribute("eMsg", MessageEnum.MSG_ERROR);
			}
		} else {
			int result = categoryDAO.deleteItemById(objCategory.getId());
			if (result > 0) {
				ra.addFlashAttribute("eMsg", MessageEnum.MSG_DELETE_SUCCESS);
			}
		}
		return "redirect:/admin/category";
	}

}
