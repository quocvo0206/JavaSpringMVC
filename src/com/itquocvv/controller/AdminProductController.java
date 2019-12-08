package com.itquocvv.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itquocvv.constant.Defines;
import com.itquocvv.constant.MessageEnum;
import com.itquocvv.model.bean.Category;
import com.itquocvv.model.bean.Product;
import com.itquocvv.model.dao.ProductDAO;
import com.itquocvv.service.CategoryService;
import com.itquocvv.util.FilenameUtil;
import com.itquocvv.util.PaginationUtil;


@Controller
@RequestMapping("admin/product")
public class AdminProductController {

	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping(path = { "", "/page-{page}" })
	public String index(@PathVariable(name = "page", required = false) Integer page, ModelMap modelMap) {
		int numberOfItems = productDAO.countItems();
		int numberOfPages = (int) Math.ceil((float) numberOfItems / Defines.ROW_COUNT);
		if (page == null) {
			page = 1;
		} else if (page < 1) {
			return "redirect:/admin/product/page-1";
		} else if (page > numberOfPages) {
			return "redirect:/admin/product/page-" + numberOfPages;
		}
		int offset = (page - 1) * Defines.ROW_COUNT;
		
		List<Integer> paginations = PaginationUtil.makePagination(numberOfPages, 7, page);
		
		modelMap.addAttribute("paginations", paginations);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("numberOfPages", numberOfPages);
		modelMap.addAttribute("numberOfItems", numberOfItems);
		
		List<Product> listProducts = productDAO.getItemsPagination(offset);
		modelMap.addAttribute("listProducts", listProducts);
		return "admin.product.index";
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
		
		int numberOfItems = productDAO.countSearchItems(searchString);
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
		
		List<Product> listProducts = productDAO.getSearchItemsPagination(searchString, offset);
		modelMap.addAttribute("listProducts", listProducts);
		return "admin.product.search";
	}
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		Map<Category, List<Category>> mapCategories = categoryService.getMapCategory();
		modelMap.addAttribute("mapCategories", mapCategories);
		return "admin.product.add";
	}
	
	@PostMapping("add")
	public String add(
			@Valid @ModelAttribute("objProduct") Product objProduct, BindingResult errors,
			@RequestParam("categoryId") int categoryId,
			@RequestParam("picture") CommonsMultipartFile cmf, @RequestParam("pictures") List<CommonsMultipartFile> cmfs,
			ModelMap modelMap, RedirectAttributes ra) {
		
		/* START validate */
		objProduct.setCategory(new Category(categoryId, null, null, null));
		if (objProduct.getPrice() == null) {
			errors.rejectValue("price", "NotNull.objProduct.price");
		}
		if (objProduct.getDiscount() == null) {
			errors.rejectValue("discount", "NotNull.objProduct.discount");
		}
		if (cmf.getOriginalFilename().equals("")) {
			errors.rejectValue("image", "NotChoose.objProduct.image");
		}
		if (cmfs.get(0).getOriginalFilename().equals("")) {
			errors.rejectValue("imageList", "NotChoose.objProduct.image");
		}
		
		if (errors.hasErrors()) {
			Map<Category, List<Category>> mapCategories = categoryService.getMapCategory();
			modelMap.addAttribute("mapCategories", mapCategories);
			System.out.println("Có lỗi validate");
			return "admin.product.add";
		}
		/* END validate */
		
		objProduct.setImage(FilenameUtil.rename(cmf.getOriginalFilename()));
		//lấy tất cả các tên ảnh lưu
		List<String> imageList = new ArrayList<>();
		for (CommonsMultipartFile item : cmfs) {
			imageList.add(FilenameUtil.rename(item.getOriginalFilename()));
		}
		objProduct.setImageListToJson(imageList); //đưa vào list string tên ảnh và thuộc tính imageList thành chuỗi json
		
		System.out.println(objProduct);
		if (productDAO.addItem(objProduct) > 0) {
			String dirPath = servletContext.getRealPath("") + "WEB-INF" + File.separator + Defines.DIR_UPLOAD;
			File dirUpload = new File(dirPath);
			if (!dirUpload.exists()) {
				dirUpload.mkdirs();
			}
			try {
				cmf.transferTo(new File(dirUpload + File.separator + objProduct.getImage()));
				for (int i = 0; i < cmfs.size(); i++) {
					cmfs.get(i).transferTo(new File(dirUpload + File.separator + imageList.get(i)));
				}
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_ADD_SUCCESS);
			ra.addFlashAttribute("objProduct", objProduct);//gởi objProduct để tô màu cho dòng vừa thêm
			return "redirect:/admin/product";
		} else {
			Map<Category, List<Category>> mapCategories = categoryService.getMapCategory();
			modelMap.addAttribute("mapCategories", mapCategories);
			modelMap.addAttribute("eMsg", MessageEnum.MSG_ERROR);
			return "admin.product.add";
		}
	}
	
	@GetMapping("edit/{id}-{page}")
	public String edit(@PathVariable("id") int id, @PathVariable("page") int page, ModelMap modelMap) {
		Map<Category, List<Category>> mapCategories = categoryService.getMapCategory();
		modelMap.addAttribute("mapCategories", mapCategories);
		Product objProduct = productDAO.getItem(id);
		modelMap.addAttribute("objProduct", objProduct);
		modelMap.addAttribute("page", page);
		return "admin.product.edit";
	}
	
	@PostMapping("edit/{id}-{page}")
	public String edit(@Valid @ModelAttribute("objProduct") Product objProduct, BindingResult errors,
			@PathVariable("id") int id, @PathVariable("page") int page, @RequestParam("categoryId") int categoryId,
			@RequestParam("picture") CommonsMultipartFile cmf, @RequestParam("pictures") List<CommonsMultipartFile> cmfs,
			RedirectAttributes ra, ModelMap modelMap) {
		/* START validate */
		Product oldProduct = productDAO.getItem(id); //phải lấy trước để lưu lại trước khi xóa trong db, rồi sau đó nhờ đối tượng này để xóa ảnh
		objProduct.setCategory(new Category(categoryId, null, null, null));
		if (objProduct.getPrice() == null) {
			errors.rejectValue("price", "NotNull.objProduct.price");
		}
		if (objProduct.getDiscount() == null) {
			errors.rejectValue("discount", "NotNull.objProduct.discount");
		}
		if (errors.hasErrors()) {
			Map<Category, List<Category>> mapCategories = categoryService.getMapCategory();
			modelMap.addAttribute("mapCategories", mapCategories);
			System.out.println("Có lỗi validate");
			return "admin.product.edit";
		}
		
		//nếu có chọn ảnh mới thì mới up lên lại
		boolean checkSingleImage = false;
		if (!cmf.getOriginalFilename().equals("")) {
			checkSingleImage = true;
			objProduct.setImage(FilenameUtil.rename(cmf.getOriginalFilename()));
		} else {
			objProduct.setImage(oldProduct.getImage());
		}
		boolean checkMultipleImage = false;
		List<String> imageList = new ArrayList<>();
		if (!cmfs.get(0).getOriginalFilename().equals("")) {
			checkMultipleImage = true;
			for (CommonsMultipartFile item : cmfs) {
				imageList.add(FilenameUtil.rename(item.getOriginalFilename()));
			}
			objProduct.setImageListToJson(imageList); //đưa vào list string tên ảnh và thuộc tính imageList thành chuỗi json
		} else {
			objProduct.setImageList(oldProduct.getImageList());
		}
		
		/* END validate */
		if (productDAO.editItem(objProduct) > 0) {
			String dirPath = servletContext.getRealPath("") + "WEB-INF" + File.separator + Defines.DIR_UPLOAD;
			File dirUpload = new File(dirPath);
			if (!dirUpload.exists()) {
				dirUpload.mkdirs();
			}
			try {
				//có chọn ảnh mới thì upload
				if (checkSingleImage) {
					//xóa file cũ 
					File file = new File(dirPath + File.separator + oldProduct.getImage());
					file.delete();
					//up file mới
					cmf.transferTo(new File(dirUpload + File.separator + objProduct.getImage()));
				}
				if (checkMultipleImage) {
					//xóa file cũ
					List<String> images = oldProduct.getImageListFromJson();
					for (String item : images) {
						File file = new File(dirPath + File.separator + item);
						file.delete();
					}
					//up file mới
					for (int i = 0; i < cmfs.size(); i++) {
						cmfs.get(i).transferTo(new File(dirUpload + File.separator + imageList.get(i)));
					}
				}
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_UPDATE_SUCCESS);
			ra.addFlashAttribute("objProduct", objProduct);//gởi objProduct để tô màu cho dòng vừa thêm
			return "redirect:/admin/product/page-" + page;
		} else {
			Map<Category, List<Category>> mapCategories = categoryService.getMapCategory();
			modelMap.addAttribute("mapCategories", mapCategories);
			modelMap.addAttribute("eMsg", MessageEnum.MSG_ERROR);
			return "admin.product.add";
		}
	}
	
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") int id, RedirectAttributes ra) {
		Product oldProduct = productDAO.getItem(id);
		if (productDAO.deleteItem(id) > 0) {
			//xóa ảnh
			String dirPath = servletContext.getRealPath("") + "WEB-INF" + File.separator + Defines.DIR_UPLOAD;
			File dirUpload = new File(dirPath);
			if (!dirUpload.exists()) {
				dirUpload.mkdirs();
			}
			//xóa ảnh đầu
			File file = new File(dirPath + File.separator + oldProduct.getImage());
			file.delete();
			//xóa list ảnh
			List<String> images = oldProduct.getImageListFromJson();
			for (String item : images) {
				file = new File(dirPath + File.separator + item);
				file.delete();
			}
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_DELETE_SUCCESS);
		} else {
			ra.addFlashAttribute("eMsg", MessageEnum.MSG_ERROR);
		}
		return "redirect:/admin/product";
	}
	
	@ResponseBody
	@PostMapping("deleteSelected")
	public String delChecked(@RequestParam("checked[]") List<Integer> checkedProductIds, RedirectAttributes ra) {
		String dirPath = servletContext.getRealPath("") + "WEB-INF" + File.separator + Defines.DIR_UPLOAD;
		File dirUpload = new File(dirPath);
		if (!dirUpload.exists()) {
			dirUpload.mkdirs();
		}
		
		for (Integer id : checkedProductIds) {
			Product oldProduct = productDAO.getItem(id);
			if (productDAO.deleteItem(id) > 0) {
				//xóa ảnh đầu
				File file = new File(dirPath + File.separator + oldProduct.getImage());
				file.delete();
				//xóa list ảnh
				List<String> images = oldProduct.getImageListFromJson();
				for (String item : images) {
					file = new File(dirPath + File.separator + item);
					file.delete();
				}
			}
		}
		return checkedProductIds.size() + "";
	}
}
