package com.itquocvv.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.itquocvv.model.bean.Role;

public class MyUserDetails implements UserDetails {
	private static final long serialVersionUID = 1L;

	private String username;
	private String password;
	private String fullname;
	private String address;
	private String phone;
	private String email;
	private Role role;
	private List<GrantedAuthority> authorities;

	public MyUserDetails(String userName, String password, String fullname, String address, String email, String phone,
			Role role, List<GrantedAuthority> authorities) {
		this.username = userName;
		this.password = password;
		this.fullname = fullname;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.role = role;
		this.authorities = authorities;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	public String getFullname() {
		return fullname;
	}

	public Role getRole() {
		return role;
	}

	@Override
	public String toString() {
		return "MyUserDetails [username=" + username + ", password=" + password + ", fullname=" + fullname
				+ ", address=" + address + ", phone=" + phone + ", email=" + email + ", role=" + role + ", authorities="
				+ authorities + "]";
	}

}
