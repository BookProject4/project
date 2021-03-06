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
		  // ????????? ????????? ?????? (no)
		  String no=request.getParameter("no");
		  // FreeBoardDAO?????? => ????????? ????????? ?????? 
		  ContactDAO dao=ContactDAO.newInstance();
		  // ????????? ?????? 
		  ContactVO vo=dao.contactDetailData(Integer.parseInt(no));
		  
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../contact/detail.jsp");

		  return "../main/main.jsp";
	  }
	
	 @RequestMapping("contact/update.do")
	  public String contact_update(HttpServletRequest request,HttpServletResponse response)
	  {
		  // Model => Model(?????? => ??????:??????????????????) => DAO,VO,Manager(??????) 
		  // ?????? ????????? ?????? Model?????? 
		  // ????????? ??????
		  String no=request.getParameter("no");
		  // DAO=>?????? 
		  ContactDAO dao=ContactDAO.newInstance();
		  // FreeBoardVO?????? ???????????? 
		  ContactVO vo=dao.contactUpdateData(Integer.parseInt(no));
		  // update.jsp?????? 
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../contact/update.jsp");
		  return "../main/main.jsp";
	  }
	 
	 @RequestMapping("contact/update_ok.do")
	  public String contact_update_ok(HttpServletRequest request,HttpServletResponse response)
	  {
		  // ?????????????????? @RestController => ?????????????????? ????????? ?????? (?????????????????? ?????? ?????????)
		  // ???????????? ???????????? ????????? 
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
		  // ????????? ?????? 
		  boolean bCheck=dao.contactUpdate(vo);
		  // ?????? , ?????? , ?????? => ???????????? ?????? ????????? ?????? 
		  request.setAttribute("bCheck", bCheck);
		  request.setAttribute("no", no);
		  return "../contact/update_ok.jsp";//?????? 2??? (???????????? ????????????/???????????? ?????? ??????) 
	  }
}
