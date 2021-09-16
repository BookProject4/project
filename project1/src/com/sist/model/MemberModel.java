package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.sist.vo.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

@Controller
public class MemberModel {
	// 1. 회원가입 페이지 연결
		@RequestMapping("member/join.do")
		public String member_join(HttpServletRequest request, HttpServletResponse response)
		{	
			request.setAttribute("main_jsp", "../member/join.jsp");
			return "../main/main.jsp";
		}
	// 1-1. 아이디 중복 체크
	@RequestMapping("member/idcheck.do")
	public String member_idcheck(HttpServletRequest request, HttpServletResponse response)
	{
		String id=request.getParameter("id"); 
		// 아이디 있는지 없는지 찾기 => DAO에서
		MemberDAO dao=MemberDAO.newInstance();
		int count=dao.memberidCheck(id);
		request.setAttribute("count", count);
		return "../member/idcheck_result.jsp";
	}
	// 1-2. 우편번호 찾기
	@RequestMapping("member/postfind.do")
	public String member_postfind(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String dong=request.getParameter("dong");
		MemberDAO dao=MemberDAO.newInstance();
		List<ZipcodeVO> list=dao.postfind(dong);
		int count=dao.postfindCount(dong);
		// 해당 페이지에만 출력
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		return "../member/postfind_result.jsp";
	}
	// 1-3. 회원가입
	@RequestMapping("member/join_ok.do")
	public String member_join_ok(HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println("회원 데이터 전송 완료!!");
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		  String id=request.getParameter("id");
		  String pwd=request.getParameter("pwd");
		  String name=request.getParameter("name");
		  String birthday=request.getParameter("birthday");
		  String email=request.getParameter("email");
		  String sex=request.getParameter("sex");
		  String tel=request.getParameter("tel");
		  String post1=request.getParameter("post1");
		  String post2=request.getParameter("post2");
		  String addr1=request.getParameter("addr1");
		  String addr2=request.getParameter("addr2");
		  
		  MemberVO vo=new MemberVO();
		  vo.setId(id);
		  vo.setPwd(pwd);
		  vo.setName(name);
		  vo.setBirthday(birthday);
		  vo.setEmail(email);
		  vo.setSex(sex);
		  vo.setTel(tel);
		  vo.setPost(post1+"-"+post2);
		  vo.setAddr1(addr1);
		  vo.setAddr2(addr2);
		  
		  MemberDAO dao=MemberDAO.newInstance();
		  dao.memberJoinInsert(vo);
		  return "redirect:../main/main.do";
	}
	// 2. 로그인 페이지 연결
	@RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request, HttpServletResponse response)
	{
			request.setAttribute("main_jsp", "../member/login.jsp");
			return "../main/main.jsp";		
	}
	// 2-1. 로그인
	@RequestMapping("member/loginok.do")
	public String member_loginok(HttpServletRequest request, HttpServletResponse reponse)
	{
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		MemberDAO dao=MemberDAO.newInstance();
		String result=dao.isLogin(id, pwd);
		
		if(!(result.equals("NOID")||result.equals("NOPWD")))
		{
			HttpSession session=request.getSession();
			StringTokenizer st=new StringTokenizer(result,"|");
			String name=st.nextToken();
			String admin=st.nextToken();
			
			session.setAttribute("id", id);
			session.setAttribute("admin", admin);
			session.setAttribute("name", name);
			result="OK";
		}
		request.setAttribute("result", result);
		return "../member/login_result.do";
	}
	// 2-2. 로그아웃
	@RequestMapping("member/logout.do")
	  public String member_logout(HttpServletRequest request,HttpServletResponse response)
	  {
		  HttpSession session=request.getSession();
		  session.invalidate();
		  return "redirect:../main/main.do";
	  }
	// 2-3. 아이디 찾기
	@RequestMapping("member/idfind_do")
	public String member_idfind(HttpServletRequest request, HttpServletResponse response)
	{
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		MemberDAO dao=MemberDAO.newInstance();
		String id=dao.idFind(name, email);
		request.setAttribute("id", id);
		return "../member/idfind.jsp";
	}
	// 2-4. 비밀번호 찾기
	@RequestMapping("member/pwdfind_do")
	public String member_pwdfind(HttpServletRequest request, HttpServletResponse response)
	{
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		MemberDAO dao=MemberDAO.newInstance();
		String pwd=dao.pwdFind(id ,name, email);
		request.setAttribute("pwd", pwd);
		return "../member/pwdfind.jsp";
	}
	
	// 3. 마이페이지 상세보기 연결 및 데이터 출력
	@RequestMapping("member/detail.do")
	public String member_m_update1(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		MemberDAO dao=MemberDAO.newInstance();
		MemberVO vo=dao.MemberDetailData(id);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../member/detail.jsp");
		return "../main/main.jsp";
	}
	// 4. 회원정보 수정 데이터 출력
	@RequestMapping("member/update.do")
	public String member_update(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		MemberDAO dao=MemberDAO.newInstance();
		MemberVO vo=dao.MemberUpdateData(id);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../member/update.jsp");
		return "../main/main.jsp"; 
	}
	// 4-1. 회원정보 수정
	@RequestMapping("member/update_ok.do")
	public String member_update_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		// DAO로 전송
		HttpSession session=request.getSession();
		String id= (String)session.getAttribute("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String birthday=request.getParameter("birthday");
		String email=request.getParameter("email");
		String sex=request.getParameter("sex");
		String tel=request.getParameter("tel");
		String post1=request.getParameter("post1");
		String post2=request.getParameter("post2");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		
		MemberVO vo=new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setBirthday(birthday);
		vo.setEmail(email);
		vo.setSex(sex);
		vo.setTel(tel);
		vo.setPost(post1+"-"+post2);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		
		MemberDAO dao=MemberDAO.newInstance();
		boolean bCheck=dao.MemberUpdate(vo);
		request.setAttribute("bCheck", bCheck);
		request.setAttribute("id",id);
		return "../member/update_ok.jsp";
	}
	// 4-2. 회원정보 수정 우편번호 찾기
	@RequestMapping("member/postfind_update.do")
	public String member_postfind_update(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		String dong=request.getParameter("dong");
		MemberDAO dao=MemberDAO.newInstance();
		List<ZipcodeVO> list=dao.postfind(dong);
		int count=dao.postfindCount(dong);
		// 해당 페이지에만 출력
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		return "../member/postfind_result_update.jsp";
	}
	// 5. 회원탈퇴 페이지 연결
	@RequestMapping("member/delete.do")
	public String member_delete(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id= (String)session.getAttribute("id");
		request.setAttribute("main_jsp", "../member/delete.jsp");
		return "../main/main.jsp";
	}
	// 5-1. 회원탈퇴 기능
	@RequestMapping("member/delete_ok.do")
	public String member_delete_ok(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String pwd=request.getParameter("pwd");
		
		MemberDAO dao=MemberDAO.newInstance();
		boolean bCheck=dao.MemberDelete(id, pwd);
		request.setAttribute("bCheck", bCheck);
		
		session.invalidate();
		return "../member/delete_ok.jsp";
	}
	
	
}
