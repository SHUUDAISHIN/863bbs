package com.soft863.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.soft863.service.UserService;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	/*
	 * @RequestMapping("/noUserLogin") public String noUserLogin(){
	 * 
	 * return "main"; }
	 */
	@ResponseBody
	@RequestMapping("/checkUserName")
	public int checkUserName(String name) {
		int result = userService.checkUserName(name);
		return result;
	}

	/**
	 * 验证账号登录操作
	 * 
	 * @param name
	 *            用户名
	 * @param password
	 *            密码
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/userLogin")
	public int userLogin(String name, String password, HttpSession session) {
		short count = userService.checkUser(name, password);
		session.setAttribute("userid", count);
		session.setAttribute("name", name);
		session.setAttribute("password", password);
		return count;
	}
	
	@RequestMapping("/toLoginPage")
	public String toLoginPage(HttpSession session) {
		/*String name = (String) session.getAttribute("name");
		String password = (String) session.getAttribute("password");*/
		return "login";
	}
}
