package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class NoticeModel {
	@RequestMapping("notice/list.do")
	public String notice_list(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		String page = request.getParameter("page");
		if(page==null)
			page="1";
		int curpage = Integer.parseInt(page);
		NoticeDAO dao = NoticeDAO.newInstance();
		
		List<NoticeVO> list= dao.noticeListData(curpage);
		int totalpage=dao.noticeTotalPage();

		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../notice/list.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("notice/insert.do")
	public String notice_insert(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../notice/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("notice/insert_ok.do")
	public String notice_insert_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
	
		NoticeVO vo = new NoticeVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);

		NoticeDAO dao = NoticeDAO.newInstance();
		
		dao.noticeInsert(vo);
		
		return "redirect:../notice/list.do";
	}
	
	@RequestMapping("notice/detail.do")
	  public String noticeDetail(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 요청한 데이터 받기 (no)
		  String no=request.getParameter("no");
		  // FreeBoardDAO연결 => 데이터 얻기를 한다 
		  NoticeDAO dao=NoticeDAO.newInstance();
		  // 메소드 호출 
		  NoticeVO vo=dao.noticeDetailData(Integer.parseInt(no));
		  
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../notice/detail.jsp");

		  return "../main/main.jsp";
	  }
	
	 @RequestMapping("notice/update.do")
	  public String notice_update(HttpServletRequest request,HttpServletResponse response)
	  {
		  // Model => Model(요청 => 응답:비지니스로직) => DAO,VO,Manager(포함) 
		  // 자바 코딩은 모두 Model이다 
		  // 데이터 읽기
		  String no=request.getParameter("no");
		  // DAO=>연결 
		  NoticeDAO dao=NoticeDAO.newInstance();
		  // FreeBoardVO값을 얻어온다 
		  NoticeVO vo=dao.noticeUpdateData(Integer.parseInt(no));
		  // update.jsp전송 
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../notice/update.jsp");
		  return "../main/main.jsp";
	  }
	 
	 @RequestMapping("notice/update_ok.do")
	  public String notice_update_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 스프링에서는 @RestController => 자바스크립트 전송이 가능 (자바스크립트 전송 불가능)
		  // 수정하는 데이터를 받는다 
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  
		  String name=request.getParameter("name");
		  String subject=request.getParameter("subject");
		  String content=request.getParameter("content");
		  String pwd=request.getParameter("pwd");
		  String no=request.getParameter("no");
		  
		  NoticeVO vo=new NoticeVO();
		  vo.setNo(Integer.parseInt(no));
		  vo.setName(name);
		  vo.setSubject(subject);
		  vo.setContent(content);
		  vo.setPwd(pwd);
		  
		  NoticeDAO dao=NoticeDAO.newInstance();
		  // 메소드 호출 
		  boolean bCheck=dao.noticeUpdate(vo);
		  // 답변 , 수정 , 추가 => 오라클에 있는 데이터 조절 
		  request.setAttribute("bCheck", bCheck);
		  request.setAttribute("no", no);
		  return "../notice/update_ok.jsp";//이동 2개 (비밀번호 틀릴경우/비밀번호 맞는 경우) 
	  }
}