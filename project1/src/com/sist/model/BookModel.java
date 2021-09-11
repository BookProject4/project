package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;
@Controller
public class BookModel {
	@RequestMapping("book/book_main.do")
	public String book_main(HttpServletRequest request, HttpServletResponse response) {
		String cate1=request.getParameter("cate1");
		request.setAttribute("cate1", cate1);
		//디비에서 카테고리에 해당되는 서브카테고리 리스트 가져오기
		BookDAO dao = BookDAO.newInstance();
		List<String> cList=dao.bookCateList(cate1);
		request.setAttribute("cList", cList);
		request.setAttribute("main_jsp", "../book/book_main.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("book/book_list.do")
	  public String book_list(HttpServletRequest request,HttpServletResponse response)
	  {
		  String page=request.getParameter("page");
		  String cate1=request.getParameter("cate1");
		  String cate2=request.getParameter("cate2");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  BookDAO dao=BookDAO.newInstance();
		  List<BookVO> list=dao.bookListData(cate1,cate2,curpage);
		  int totalpage=dao.totalPage(cate1, cate2);
		  
		  request.setAttribute("cate1", cate1);
		  request.setAttribute("cate2", cate2);
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("list", list);
		  request.setAttribute("main_jsp", "../book/book_list.jsp");
		  return "../main/main.jsp";
	  }
	@RequestMapping("book/book_detail.do")
	  public String book_detail(HttpServletRequest request,HttpServletResponse response)
	  {
		  String isbn=request.getParameter("isbn");
		  BookDAO dao=BookDAO.newInstance();
		  BookVO vo=dao.bookDetailData(Integer.parseInt(isbn));
		  // request에 값을 담아준다
		  request.setAttribute("vo", vo);
		  return "../main/main.jsp";
	  }
}

