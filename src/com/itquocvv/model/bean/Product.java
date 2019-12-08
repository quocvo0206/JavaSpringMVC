package com.itquocvv.model.bean;

import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.istack.internal.NotNull;

public class Product {
	private int id;
	private Category category;
	@NotBlank
	private String name;
	@NotBlank
	private String description;
	@NotBlank
	private String content;
	@NotNull
	@Min(0)
	private Integer price;
	@NotNull
	@Min(0)
	private Integer discount;
	private String image;
	private String imageList;
	private Timestamp dateCreated;
	private Integer view;
	private Integer countBuy;

	public Product(int id, Category category, String name, String description, String content, Integer price,
			Integer discount, String image, String imageList, Timestamp dateCreated, Integer view, Integer countBuy) {
		super();
		this.id = id;
		this.category = category;
		this.name = name;
		this.description = description;
		this.content = content;
		this.price = price;
		this.discount = discount;
		this.image = image;
		this.imageList = imageList;
		this.dateCreated = dateCreated;
		this.view = view;
		this.countBuy = countBuy;
	}

	public Product() {
		super();
	}

	//chuyển json thành list string image
	public List<String> getImageListFromJson() {
		List<String> imageList = new ArrayList<>();
		try {
			Type type = new TypeToken<List<String>>() {
			}.getType();
			Gson gson = new Gson();
			imageList = gson.fromJson(this.imageList, type);
		} catch (Exception e) {
			System.out.println("Lỗi chuyển json image thành list");
			e.printStackTrace();
		}
		return imageList;
	}

	//chuyển list string image thành chuỗi json
	public void setImageListToJson(List<String> imageList) {
		Gson gson = new Gson();
		try {
			this.imageList = gson.toJson(imageList);
		} catch (Exception e) {
			System.out.println("Lỗi set list string thành chuỗi image json trong setter product");
			e.printStackTrace();
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImageList() {
		return imageList;
	}

	public void setImageList(String imageList) {
		this.imageList = imageList;
	}

	public Timestamp getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Integer getView() {
		return view;
	}

	public void setView(Integer view) {
		this.view = view;
	}

	public Integer getCountBuy() {
		return countBuy;
	}

	public void setCountBuy(Integer countBuy) {
		this.countBuy = countBuy;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", category=" + category + ", name=" + name + ", description=" + description
				+ ", content=" + content + ", price=" + price + ", discount=" + discount + ", image=" + image
				+ ", imageList=" + imageList + ", dateCreated=" + dateCreated + ", view=" + view + ", countBuy="
				+ countBuy + "]";
	}

}
