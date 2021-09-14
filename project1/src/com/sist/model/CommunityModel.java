package com.sist.model;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.*;
import com.oreilly.*;
import com.oreilly.servlet.multipart.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;



@Controller
public class CommunityModel {
	@RequestMapping("community/list.do")
	public String community_list(HttpServletRequest request,HttpServletResponse response)
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
		CommunityDAO dao = CommunityDAO.newInstance();
		
		List<CommunityVO> list= dao.communityListData(curpage);
		int totalpage=dao.communityTotalPage();

		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../community/list.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("community/insert.do")
	public String community_insert(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../community/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("community/insert_ok.do")
	public String community_insert_ok(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		String path="C:\\download"; // 업로드된 파일 저장위치
		int size=1024*1024*100;// 업로드할 수 있는 파일 크기 (100메가)
		String enctype="UTF-8";// 한글 파일명 
		// 2008 => 버전상의 문제 
		MultipartRequest mr=
				new MultipartRequest(request, path,size,enctype,new DefaultFileRenamePolicy());
		String name = mr.getParameter("name");
		String subject = mr.getParameter("subject");
		String content = mr.getParameter("content");
		String pwd = mr.getParameter("pwd");
		String filename = mr.getOriginalFileName("upload");
		
	
		CommunityVO vo = new CommunityVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		if(filename==null)
		{
			// 업로드가 없는 상태
			vo.setFilename("");
			vo.setFilesize(0);
		}
		else
		{
			// 업로드가 된 상태
			File file=new File("c:\\download\\"+filename);
			vo.setFilename(filename);
			vo.setFilesize((int)file.length()); // file크기 long
		}
		
		CommunityDAO dao = CommunityDAO.newInstance();
		
		dao.communityInsert(vo);
		
		return "redirect:../community/list.do";
	}
	
	@RequestMapping("community/detail.do")
	  public String communityDetail(HttpServletRequest request,HttpServletResponse response)
	  {
		  // 요청한 데이터 받기 (no)
		  String no=request.getParameter("no");
		  // FreeBoardDAO연결 => 데이터 얻기를 한다 
		  CommunityDAO dao=CommunityDAO.newInstance();
		  // 메소드 호출 
		  CommunityVO vo=dao.communityDetailData(Integer.parseInt(no));
		  List<CommunityReplyVO> list=dao.replyListData(Integer.parseInt(no), 1);
		  request.setAttribute("list", list);
		  
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../community/detail.jsp");

		  return "../main/main.jsp";
	  }
	
	 @RequestMapping("community/update.do")
	  public String community_update(HttpServletRequest request,HttpServletResponse response)
	  {
		  // Model => Model(요청 => 응답:비지니스로직) => DAO,VO,Manager(포함) 
		  // 자바 코딩은 모두 Model이다 
		  // 데이터 읽기
		  String no=request.getParameter("no");
		  // DAO=>연결 
		  CommunityDAO dao=CommunityDAO.newInstance();
		  // FreeBoardVO값을 얻어온다 
		  CommunityVO vo=dao.communityUpdateData(Integer.parseInt(no));
		  // update.jsp전송 
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../community/update.jsp");
		  return "../main/main.jsp";
	  }
	 
	 @RequestMapping("community/update_ok.do")
	  public String community_update_ok(HttpServletRequest request,HttpServletResponse response)
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
		  
		  CommunityVO vo=new CommunityVO();
		  vo.setNo(Integer.parseInt(no));
		  vo.setName(name);
		  vo.setSubject(subject);
		  vo.setContent(content);
		  vo.setPwd(pwd);
		  
		  CommunityDAO dao=CommunityDAO.newInstance();
		  // 메소드 호출 
		  boolean bCheck=dao.communityUpdate(vo);
		  // 답변 , 수정 , 추가 => 오라클에 있는 데이터 조절 
		  request.setAttribute("bCheck", bCheck);
		  request.setAttribute("no", no);
		  return "../community/update_ok.jsp";//이동 2개 (비밀번호 틀릴경우/비밀번호 맞는 경우) 
	  }
}
