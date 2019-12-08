package com.itquocvv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("auth")
public class AuthController {

	@GetMapping("login")
	public String login() {
		return "auth/login";
	}
	
	@GetMapping("sign-up")
	public String signUp() {
		return "auth/sign-up";
	}
	
	@GetMapping("forgot-password")
	public String forgotPassword() {
		return "auth/forgot-password";
	}
	
	/*@GetMapping("public-login")
	public String publicLogin() {
		return "public.login";
	}
	
	@GetMapping("forgot")
	public String publicForgot() {
		return "public.forgot";
	}*/
	
}
