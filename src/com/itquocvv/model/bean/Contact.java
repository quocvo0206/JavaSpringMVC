package com.itquocvv.model.bean;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public class Contact {
	private int id;
	@NotBlank
	private String fullname;
	@NotBlank
	private String numberphone;
	@NotBlank
	@Email
	private String email;
	@NotBlank
	private String subject;
	@NotBlank
	private String message;

	public Contact(int id, String fullname, String numberphone, String email, String subject, String message) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.numberphone = numberphone;
		this.email = email;
		this.subject = subject;
		this.message = message;
	}

	public Contact() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getNumberphone() {
		return numberphone;
	}

	public void setNumberphone(String numberphone) {
		this.numberphone = numberphone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "Contact [id=" + id + ", fullname=" + fullname + ", numberphone=" + numberphone + ", email=" + email
				+ ", subject=" + subject + ", message=" + message + "]";
	}

}
