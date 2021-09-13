package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.BookVO;

public class SearchDAO {
		private Connection conn;
		private PreparedStatement ps;
		private static SearchDAO dao;

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

		public static SearchDAO newInstance() {
			if (dao == null)
				dao = new SearchDAO();
			return dao;
		}
		
		//검색 리스트 가지고 오기
		public List<BookVO> SearchListData(String opt,String search,int page) {
			List<BookVO> list = new ArrayList<BookVO>();
			try {
					getConnection();
					if(opt.equals("title"))
					{						
						String sql = "SELECT isbn,poster,title,score,price,discount,num FROM (SELECT isbn,poster,title,score,price,discount,rownum as num FROM (SELECT isbn,poster,title,score,price,discount FROM book_info WHERE title LIKE ? ORDER BY isbn)) WHERE num BETWEEN ? AND ?";
						ps = conn.prepareStatement(sql);
						int n=12;
						int end = n*page;
						int start = end-n+1;
						//ps.setString(1, opt);
						ps.setString(1, "%"+search+"%");
						ps.setInt(2, start);
						ps.setInt(3, end);
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
					}
					else if(opt.equals("writer"))
					{
						String sql = "SELECT isbn,poster,title,score,price,discount,num FROM (SELECT isbn,poster,title,score,price,discount,rownum as num FROM (SELECT isbn,poster,title,score,price,discount FROM book_info WHERE writer LIKE ? ORDER BY isbn)) WHERE num BETWEEN ? AND ?";
						ps = conn.prepareStatement(sql);
						int n=12;
						int end = n*page;
						int start = end-n+1;
						//ps.setString(1, opt);
						ps.setString(1, "%"+search+"%");
						ps.setInt(2, start);
						ps.setInt(3, end);
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
					}
					else if(opt.equals("tag"))
					{
						String sql = "SELECT isbn,poster,title,score,price,discount,num FROM (SELECT isbn,poster,title,score,price,discount,rownum as num FROM (SELECT isbn,poster,title,score,price,discount FROM book_info WHERE tags LIKE ? ORDER BY isbn)) WHERE num BETWEEN ? AND ?";
						ps = conn.prepareStatement(sql);
						int n=12;
						int end = n*page;
						int start = end-n+1;
						//ps.setString(1, opt);
						ps.setString(1, "%"+search+"%");
						ps.setInt(2, start);
						ps.setInt(3, end);
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
					}
					
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			finally {
				disConnection();
			}
			return list;
		}
		//총 페이지 구하기
		public int totalPage(String opt,String search) {
			int t=0;
			try {
				getConnection();
				if(opt.equals("title"))	
				{
					String sql="SELECT CEIL(COUNT(*)/12.0) FROM book_info WHERE title LIKE ?";
					ps=conn.prepareStatement(sql);
					//ps.setString(1, opt);
					ps.setString(1, "%"+search+"%");
					ResultSet rs=ps.executeQuery();
					rs.next();
					t=rs.getInt(1);
					rs.close();	
				}
				else if(opt.equals("writer"))
				{
					String sql="SELECT CEIL(COUNT(*)/12.0) FROM book_info WHERE writer LIKE ?";
					ps=conn.prepareStatement(sql);
					//ps.setString(1, opt);
					ps.setString(1, "%"+search+"%");
					ResultSet rs=ps.executeQuery();
					rs.next();
					t=rs.getInt(1);
					rs.close();	
				}
				else if(opt.equals("tag"))
				{
					String sql="SELECT CEIL(COUNT(*)/12.0) FROM book_info WHERE tags LIKE ?";
					ps=conn.prepareStatement(sql);
					//ps.setString(1, opt);
					ps.setString(1, "%"+search+"%");
					ResultSet rs=ps.executeQuery();
					rs.next();
					t=rs.getInt(1);
					rs.close();	
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				disConnection();
			}
			return t;
		}
		public BookVO searchDetailData(String opt,String search) {
			BookVO vo = new BookVO();
			try {
				getConnection();
				if(opt.equals("title"))	
				{
					String sql = "SELECT category,subCategory,poster,title,subtitle,writer,publisher,etcInfo,price,discount,infotext,imgs,contentsTable,tags,publicationDay,score "
							+ "FROM book_info " + "WHERE title LIKE ?";
					ps = conn.prepareStatement(sql);
					//ps.setString(1, opt);
					ps.setString(1, "%"+search+"%");
					ResultSet rs = ps.executeQuery();
					rs.next();
					vo.setCategory(rs.getString(1));
					vo.setSubCategory(rs.getString(2));
					vo.setPoster(rs.getString(3));
					vo.setTitle(rs.getString(4));
					vo.setSubtitle(rs.getString(5));
					vo.setWriter(rs.getString(6));
					vo.setPublisher(rs.getString(7));
					vo.setEtcInfo(rs.getString(8));
					vo.setPrice(rs.getString(9));
					vo.setDiscount(rs.getString(10));
					vo.setText(rs.getString(11));
					vo.setImgs(rs.getString(12));
					vo.setContentsTable(rs.getString(13));
					vo.setTags(rs.getString(14));
					vo.setPublicationDay(rs.getString(15));
					vo.setScore(rs.getDouble(16));
					rs.close();					
				}
				else if(opt.equals("writer"))
				{
					String sql = "SELECT category,subCategory,poster,title,subtitle,writer,publisher,etcInfo,price,discount,infotext,imgs,contentsTable,tags,publicationDay,score "
							+ "FROM book_info " + "WHERE writer LIKE ?";
					ps = conn.prepareStatement(sql);
					//ps.setString(1, opt);
					ps.setString(1, "%"+search+"%");
					ResultSet rs = ps.executeQuery();
					rs.next();
					vo.setCategory(rs.getString(1));
					vo.setSubCategory(rs.getString(2));
					vo.setPoster(rs.getString(3));
					vo.setTitle(rs.getString(4));
					vo.setSubtitle(rs.getString(5));
					vo.setWriter(rs.getString(6));
					vo.setPublisher(rs.getString(7));
					vo.setEtcInfo(rs.getString(8));
					vo.setPrice(rs.getString(9));
					vo.setDiscount(rs.getString(10));
					vo.setText(rs.getString(11));
					vo.setImgs(rs.getString(12));
					vo.setContentsTable(rs.getString(13));
					vo.setTags(rs.getString(14));
					vo.setPublicationDay(rs.getString(15));
					vo.setScore(rs.getDouble(16));
					rs.close();
				}
				else if(opt.equals("tag"))
				{
					String sql = "SELECT category,subCategory,poster,title,subtitle,writer,publisher,etcInfo,price,discount,infotext,imgs,contentsTable,tags,publicationDay,score "
							+ "FROM book_info " + "WHERE tags LIKE ?";
					ps = conn.prepareStatement(sql);
					//ps.setString(1, opt);
					ps.setString(1, "%"+search+"%");
					ResultSet rs = ps.executeQuery();
					rs.next();
					vo.setCategory(rs.getString(1));
					vo.setSubCategory(rs.getString(2));
					vo.setPoster(rs.getString(3));
					vo.setTitle(rs.getString(4));
					vo.setSubtitle(rs.getString(5));
					vo.setWriter(rs.getString(6));
					vo.setPublisher(rs.getString(7));
					vo.setEtcInfo(rs.getString(8));
					vo.setPrice(rs.getString(9));
					vo.setDiscount(rs.getString(10));
					vo.setText(rs.getString(11));
					vo.setImgs(rs.getString(12));
					vo.setContentsTable(rs.getString(13));
					vo.setTags(rs.getString(14));
					vo.setPublicationDay(rs.getString(15));
					vo.setScore(rs.getDouble(16));
					rs.close();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				disConnection();
			}
			return vo;
		}
	}

