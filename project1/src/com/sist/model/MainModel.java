package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.BookDAO;
import com.sist.dao.SearchDAO;
import com.sist.vo.CommunityVO;
import com.sist.dao.CommunityDAO;

import java.util.*;

@Controller
public class MainModel {
	
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response){
		
		SearchDAO dao=SearchDAO.newInstance();
		List<CommunityVO> list=dao.mainCommunityList();
		CommunityVO vo=dao.mainCommunityDetail();
		
		request.setAttribute("list", list);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
}
