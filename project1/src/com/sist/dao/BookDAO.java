package com.sist.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.BookVO;

public class BookDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BookDAO dao;

	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java://comp//env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// 사용후 반환 -> 다른사람이 재사용이 가능하게 만든다
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// 싱글턴 패턴
	public static BookDAO newInstance() {
		if (dao == null)
			dao = new BookDAO();
		return dao;
	}
	
	//서브카테고리 가져오기
	public List<String> bookCateList(String cate1){
		List<String> list = new ArrayList<String>();
		try {
			getConnection();
			String sql="SELECT subCategory FROM cate where category=? ORDER BY subCategory";
			ps=conn.prepareStatement(sql);
			ps.setString(1, cate1);
			ResultSet rs = ps.executeQuery();
			System.out.println(cate1+"의 하위 카테고리");
			while(rs.next()) {
				list.add(rs.getString(1));
				System.out.println(rs.getString(1));
			}
			System.out.println();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return list;
	}
	
	//목록(2차 카테고리별) -> 페이지당 몇개 가져올건지 모델에서 매개변수로 넘기기
	public List<BookVO> bookListData(String cate1,String cate2,int page) {
		List<BookVO> list = new ArrayList<BookVO>();
		try {
			getConnection();
			String sql = "SELECT isbn,poster,title,score,price,discount,num "
					+ "FROM (SELECT isbn,poster,title,score,price,discount,rownum as num "
					+ "FROM (SELECT isbn,poster,title,score,price,discount FROM book_info "
					+ "WHERE category=? AND subCategory=? ORDER BY isbn)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, cate1);
			ps.setString(2, cate2);
			int n=12;
			int end = n*page;
			int start = end-n+1;
			ps.setInt(3, start);
			ps.setInt(4, end);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookVO vo = new BookVO();
				vo.setIsbn(rs.getLong(1));
				vo.setPoster(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setScore(rs.getDouble(4));
				vo.setPrice(rs.getString(5));
				vo.setDiscount(rs.getString(6));
				list.add(vo);
			}
			rs.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
	//총 페이지 구하기
	public int totalPage(String cate1,String cate2) {
		int t=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM book_info WHERE category=? AND subCategory=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, cate1);
			ps.setString(2, cate2);
			ResultSet rs=ps.executeQuery();
			rs.next();
			t=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return t;
	}

	//상세보기
	public BookVO bookDetailData(long isbn) {
		BookVO vo = new BookVO();
		try {
			getConnection();
			String sql = "SELECT isbn,category,subCategory,poster,title,subtitle,writer,publisher,etcInfo,price,discount,infoText,imgs,contentsTable,tags,publicationDay,score "
					+ "FROM book_info " + "WHERE isbn=?";
			ps = conn.prepareStatement(sql);
			ps.setLong(1, isbn);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setIsbn(rs.getLong(1));
			vo.setCategory(rs.getString(2));
			vo.setSubCategory(rs.getString(3));
			vo.setPoster(rs.getString(4));
			vo.setTitle(rs.getString(5));
			vo.setSubtitle(rs.getString(6));
			vo.setWriter(rs.getString(7));
			vo.setPublisher(rs.getString(8));
			vo.setEtcInfo(rs.getString(9));
			vo.setPrice(rs.getString(10));
			vo.setDiscount(rs.getString(11));
			vo.setText(rs.getString(12).trim());
			vo.setImgs(rs.getString(13).trim());
			vo.setContentsTable(rs.getString(14).trim());
			vo.setTags(rs.getString(15));
			vo.setPublicationDay(rs.getString(16));
			vo.setScore(rs.getDouble(17));
			rs.close();
			System.out.println(vo.getTags());
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
}
