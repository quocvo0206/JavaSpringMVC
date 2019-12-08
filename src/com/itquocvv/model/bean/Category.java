package com.itquocvv.model.bean;

import javax.validation.constraints.NotBlank;

import com.sun.istack.internal.NotNull;

public class Category {
	private int id;
	@NotBlank
	private String name;
	@NotNull
	private Integer parentId;
	@NotNull
	private Integer sort;

	public Category(int id, String name, Integer parentId, Integer sort) {
		super();
		this.id = id;
		this.name = name;
		this.parentId = parentId;
		this.sort = sort;
	}

	public Category() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", parentId=" + parentId + ", sort=" + sort + "]";
	}

}
