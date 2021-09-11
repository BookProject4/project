package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class ContactModel {
	@RequestMapping("contact/contact.do")
	public String contact(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../contact/contact.jsp");
		return "../main/main.jsp";
	}
}
