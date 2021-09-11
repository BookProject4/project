package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class CommunityModel {
	@RequestMapping("community/community.do")
	public String community(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../community/community.jsp");
		return "../main/main.jsp";
	}
}
