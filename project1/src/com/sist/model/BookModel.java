package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.BookDAO;
import com.sist.vo.BookVO;
import com.sist.vo.ReplyVO;

@Controller
public class BookModel {
	@RequestMapping("book/book_list.do")
	public String book_list(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		String cate1=request.getParameter("cate1");
		String cate2=request.getParameter("cate2");
		//디비에서 카테고리에 해당되는 서브카테고리 리스트 가져오기
		BookDAO dao = BookDAO.newInstance();
		List<String> cList=dao.bookCateList(cate1);
		if(cate2==null)	cate2=cList.get(0);
		if(page==null) page="1";
		int curpage=Integer.parseInt(page);
		List<BookVO> list=dao.bookListData(cate1,cate2,curpage);
		int totalpage=dao.totalPage(cate1, cate2);
		request.setAttribute("cate1", cate1);
		request.setAttribute("cate2",cate2);
		request.setAttribute("cList", cList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../book/book_list.jsp");
		return "../main/main.jsp";
	}
	
	//상세보기 및 댓글 전체 보기
	@RequestMapping("book/book_detail.do")
	public String x(HttpServletRequest request,HttpServletResponse response){
		String isbn=request.getParameter("isbn");
		BookDAO dao=BookDAO.newInstance();
		BookVO vo=dao.bookDetailData(Long.parseLong(isbn));
		request.setAttribute("vo", vo);
		
		String tagStr=vo.getTags();
		int tagN=0;
		if(tagStr!=null) {
		StringTokenizer st=new StringTokenizer(tagStr, "#");
			while(st.hasMoreTokens()) {
				st.nextToken();
				tagN++;
			}
		}
		request.setAttribute("tagN", tagN);
		
		//reply
		List<ReplyVO> rList=dao.replySelect(Long.parseLong(isbn));
		int rListCnt=rList.size();
		request.setAttribute("rList", rList);
		request.setAttribute("rListCnt", rListCnt);
		
		request.setAttribute("main_jsp", "../book/book_detail.jsp");
		return "../main/main.jsp";
	}

	// 댓글 입력
	@RequestMapping("book/reply_insert.do")
	public String reply_insert(HttpServletRequest request,HttpServletResponse response){ 
		try{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String isbn=request.getParameter("isbn");
		String msg=request.getParameter("msg");
		HttpSession session=request.getSession();
		String id=session.getAttribute("id").toString();
		String name=session.getAttribute("name").toString();
		ReplyVO vo=new ReplyVO();
		vo.setIsbn(Long.parseLong(isbn));
		vo.setId(id);
		vo.setName(name);
		vo.setMsg(msg);
		BookDAO dao=BookDAO.newInstance();
		dao.replyInsert(vo);		
		return "redirect:../book/book_detail.do?isbn="+isbn;
		
	}
	
	// 댓글 수정 전
	@RequestMapping("book/reply_preUpdate.do")
	public String reply_preUpdate(HttpServletRequest request,HttpServletResponse response){
		try{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String isbn=request.getParameter("isbn");
		String no=request.getParameter("no");
		String msg=request.getParameter("msg");
		request.setAttribute("isbn", isbn);
		request.setAttribute("no", no);
		request.setAttribute("msg", msg);
		return "../book/reply_update.jsp";
	}
	
	// 댓글 수정
	@RequestMapping("book/reply_update.do")
	public String reply_update(HttpServletRequest request,HttpServletResponse response){
		try{
			request.setCharacterEncoding("UTF-8");//디코딩
		}catch(Exception ex) {}
		String isbn=request.getParameter("isbn");
		String no=request.getParameter("no");
		String msg=request.getParameter("msg");
		BookDAO dao=BookDAO.newInstance();
		dao.replyUpdate(Integer.parseInt(no), msg);
		return "redirect:../book/book_detail.do?isbn="+isbn;
	}
	
	// 댓글 삭제
	@RequestMapping("book/reply_delete.do")
	public String reply_delete(HttpServletRequest request,HttpServletResponse response){
		String isbn=request.getParameter("isbn");
		String no=request.getParameter("no");
		BookDAO dao=BookDAO.newInstance();
		dao.replyDelete(Integer.parseInt(no));
		return "redirect:../book/book_detail.do?isbn="+isbn;
	}
}