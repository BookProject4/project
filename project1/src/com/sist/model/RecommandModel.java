package com.sist.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;

@Controller
public class RecommandModel {
	@RequestMapping("recommand/book_recommand.do")
	public String book_recommand(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../recommand/book_recommand.jsp");
		return"../main/main.jsp";
		
	}
	@RequestMapping("recommand/book_menu.do")
	public String book_menu(HttpServletRequest request, HttpServletResponse response)
	{
		//A.jax
		
		String[] menu1= {"봄", "여름", "가을", "겨울"};
		String[] menu2= {"자전거", "런닝", "운동", "헬스", "새벽운동", "트레이닝"};
		String[] menu3= {"화남", "행복", "슬픔", "외로움", "기쁨", "우울함", "센치하다"};
		String[] menu4= {"산타", "크리스마스", "순록", "12월", "12월25일"};
		
		String no=request.getParameter("no");
		List<String> list = new ArrayList<String>();
		
		if(no.equals("1"))
		{
			list.clear();
			for(String m:menu1)
			{
				list.add(m);
			}
		}
		else if (no.equals("2"))
		{
			list.clear();
			for(String m:menu2)
			{
				list.add(m);
			}
		}
		else if (no.equals("3"))
		{
			list.clear();
			for(String m:menu3)
			{
				list.add(m);
			}
		}
		else if (no.equals("4"))
		{
			list.clear();
			for(String m:menu4)
			{
				list.add(m);
			}
		}
		request.setAttribute("list", list);
		
		
		return "../recommand/book_menu.jsp";
		
	}
}
