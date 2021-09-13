package com.sist.model;

import java.io.*;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.BookDAO;
import com.sist.dao.SearchDAO;
import com.sist.vo.BookVO;

@Controller
public class SearchModel {
	@RequestMapping("search/search.do")
	  public String book_list(HttpServletRequest request,HttpServletResponse response)
	  {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		  String page=request.getParameter("page");
		  String opt=request.getParameter("opt");
		  String search=request.getParameter("search");
		  System.out.println(opt);
		  System.out.println(page);
		  System.out.println(search);
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  SearchDAO dao=SearchDAO.newInstance();
		  List<BookVO> list=dao.SearchListData(opt, search, curpage);
		  int totalpage=dao.totalPage(opt, search);
		  
		  SearchDAO sdao=SearchDAO.newInstance();
		  BookVO vo=sdao.searchDetailData(opt, search);
		  
		  request.setAttribute("vo", vo);
		  request.setAttribute("opt", opt);
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("search", search);
		  request.setAttribute("list", list);
		  request.setAttribute("main_jsp", "../search/search.jsp");
		  return "../main/main.jsp";
	  }
}