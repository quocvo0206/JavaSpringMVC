package com.itquocvv.model.bean;

public class OrderStatus {
	private Integer id;
	private String name;

	public OrderStatus(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public OrderStatus() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "OrderStatus [id=" + id + ", name=" + name + "]";
	}

}
