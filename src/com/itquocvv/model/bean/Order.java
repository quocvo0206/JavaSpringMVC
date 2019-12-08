package com.itquocvv.model.bean;

import java.sql.Timestamp;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class Order {
	private Integer id;
	private Integer status;
	@NotEmpty
	private String fullname;
	@NotEmpty
	private String address;
	@Email
	private String email;
	@NotEmpty
	private String phone;
	private String message;
	private Timestamp dateCreated;
	private Integer amount;
	private String payment;

	public Order(Integer id, Integer status, String fullname, String address, String email, String phone,
			String message, Timestamp dateCreated, Integer amount, String payment) {
		super();
		this.id = id;
		this.status = status;
		this.fullname = fullname;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.message = message;
		this.dateCreated = dateCreated;
		this.amount = amount;
		this.payment = payment;
	}

	public Order() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", status=" + status + ", fullname=" + fullname + ", address=" + address + ", email="
				+ email + ", phone=" + phone + ", message=" + message + ", dateCreated=" + dateCreated + ", amount="
				+ amount + ", payment=" + payment + "]";
	}

}
