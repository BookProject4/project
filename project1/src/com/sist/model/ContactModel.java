package com.sist.model;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;



@Controller
public class ContactModel {
	@RequestMapping("contact/list.do")
	public String contact_list(HttpServletRequest request,HttpServletResponse response)
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
		ContactDAO dao = ContactDAO.newInstance();
		
		List<ContactVO> list= dao.contactListData(curpage);
		int totalpage=dao.contactTotalPage();

		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../contact/list.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("contact/insert.do")
	public String contact_insert(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../contact/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("contact/insert_ok.do")
	public String contact_insert_ok(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		String classify = request.getParameter("classify");
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		
	
		ContactVO vo = new ContactVO();
		vo.setClassify(classify);
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		ContactDAO dao = ContactDAO.newInstance();
		
		dao.contactInsert(vo);
		
		return "redirect:../contact/list.do";
	}
	
	@RequestMapping("contact/detail.do")
	  public String contactDetail(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 요청한 데이터 받기 (no)
		  String no=request.getParameter("no");
		  // FreeBoardDAO연결 => 데이터 얻기를 한다 
		  ContactDAO dao=ContactDAO.newInstance();
		  // 메소드 호출 
		  ContactVO vo=dao.contactDetailData(Integer.parseInt(no));
		  
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../contact/detail.jsp");

		  return "../main/main.jsp";
	  }
	
	 @RequestMapping("contact/update.do")
	  public String contact_update(HttpServletRequest request,HttpServletResponse response)
	  {
		  // Model => Model(요청 => 응답:비지니스로직) => DAO,VO,Manager(포함) 
		  // 자바 코딩은 모두 Model이다 
		  // 데이터 읽기
		  String no=request.getParameter("no");
		  // DAO=>연결 
		  ContactDAO dao=ContactDAO.newInstance();
		  // FreeBoardVO값을 얻어온다 
		  ContactVO vo=dao.contactUpdateData(Integer.parseInt(no));
		  // update.jsp전송 
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../contact/update.jsp");
		  return "../main/main.jsp";
	  }
	 
	 @RequestMapping("contact/update_ok.do")
	  public String contact_update_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 스프링에서는 @RestController => 자바스크립트 전송이 가능 (자바스크립트 전송 불가능)
		  // 수정하는 데이터를 받는다 
		  try
		  {
			  request.setCharacterEncoding("UTF-8");
		  }catch(Exception ex) {}
		  
		  String classify= request.getParameter("classify");
		  String name=request.getParameter("name");
		  String subject=request.getParameter("subject");
		  String content=request.getParameter("content");
		  String pwd=request.getParameter("pwd");
		  String no=request.getParameter("no");
		  
		  ContactVO vo=new ContactVO();
		  vo.setClassify(classify);
		  vo.setNo(Integer.parseInt(no));
		  vo.setName(name);
		  vo.setSubject(subject);
		  vo.setContent(content);
		  vo.setPwd(pwd);
		  
		  ContactDAO dao=ContactDAO.newInstance();
		  // 메소드 호출 
		  boolean bCheck=dao.contactUpdate(vo);
		  // 답변 , 수정 , 추가 => 오라클에 있는 데이터 조절 
		  request.setAttribute("bCheck", bCheck);
		  request.setAttribute("no", no);
		  return "../contact/update_ok.jsp";//이동 2개 (비밀번호 틀릴경우/비밀번호 맞는 경우) 
	  }
}
