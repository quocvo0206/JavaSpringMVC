package com.itquocvv.model.bean;

import java.sql.Timestamp;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class User {
	private int id;
	private Role role;
	@NotBlank
	@Size(min=5, max=30)
	private String username;
	@NotBlank
	private String fullname;
	private String password;
	@NotBlank
	@Email
	private String email;
	@NotBlank
	private String phoneNumber;
	@NotBlank
	private String address;
	private Timestamp dateCreated;

	public User(int id, Role role, String username, String fullname, String password, String email, String phoneNumber,
			String address, Timestamp dateCreated) {
		super();
		this.id = id;
		this.role = role;
		this.username = username;
		this.fullname = fullname;
		this.password = password;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.dateCreated = dateCreated;
	}

	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Timestamp getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", role=" + role + ", username=" + username + ", fullname=" + fullname + ", password="
				+ password + ", email=" + email + ", phoneNumber=" + phoneNumber + ", address=" + address
				+ ", dateCreated=" + dateCreated + "]";
	}

}
