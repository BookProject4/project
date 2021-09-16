package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.vo.*;

public class NoticeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static NoticeDAO dao;

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
	public static NoticeDAO newInstance() {
		if (dao == null)
			dao = new NoticeDAO();
		return dao;
	}
	
	public List<NoticeVO> noticeListData(int page)
	{
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		try {
			getConnection();
			String sql="SELECT no,subject,name,regdate,hit,num "
					+ "FROM (SELECT no,subject,name,regdate,hit,rownum as num "
					+ "FROM (SELECT no,subject,name,regdate,hit "
					+ "FROM notice ORDER BY no DESC))"
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			int rowSize=10;
			int start = (rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs= ps.executeQuery();
			
			while(rs.next())
			{
				NoticeVO vo = new NoticeVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		
		return list;
	}	
	public int noticeTotalPage()
	{
		int total=0;
		
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/10.0) FROM notice";
			ps=conn.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
		
		return total;
	}
	
	public void noticeInsert(NoticeVO vo)
	{
		try {
			getConnection();
			String sql="INSERT INTO notice (no,name,subject,content,pwd) "
					+ "VALUES (pf_no_seq.nextval,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
	   public NoticeVO noticeDetailData(int no)
	   {
		   NoticeVO vo=new NoticeVO();
		   try
		   {
			   getConnection();
			   // 조회수 증가 
			   String sql="UPDATE notice SET "
					     +"hit=hit+1 "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ps.executeUpdate(); 
			   
			   // 상세볼 게시물 읽기
			   sql="SELECT no,name,subject,content,regdate,hit "
				  +"FROM notice "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNo(rs.getInt(1));
			   vo.setSubject(rs.getString(3));
			   vo.setName(rs.getString(2));
			   vo.setContent(rs.getString(4));
			   vo.setRegdate(rs.getDate(5));
			   vo.setHit(rs.getInt(6));
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return vo;
	   }

	   public NoticeVO noticeUpdateData(int no)
	   {
		   NoticeVO vo=new NoticeVO();
		   try
		   {
			   getConnection();
			   // 조회수 증가 
			   String sql="SELECT no,name,subject,content "
				  +"FROM notice "
				  +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   vo.setNo(rs.getInt(1));
			   vo.setSubject(rs.getString(3));
			   vo.setName(rs.getString(2));
			   vo.setContent(rs.getString(4));
			   rs.close();
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return vo;
	   }
	   // 실제 수정 
	   public boolean noticeUpdate(NoticeVO vo)
	   {
		   boolean bCheck=false;// 비밀번호 체크 (true/수정,false/다시 입력)
		   try
		   {
			   getConnection();
			   // 비밀번호 확인 
			   String sql="SELECT pwd FROM notice "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, vo.getNo());
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   rs.close();
			   
			   if(db_pwd.equals(vo.getPwd())) 
			   {
				   bCheck=true;
				   // 실제 수정 
				   sql="UPDATE community SET "
					  +"name=?,subject=?,content=? "
					  +"WHERE no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setString(1, vo.getName());
				   ps.setString(2, vo.getSubject());
				   ps.setString(3, vo.getContent());
				   ps.setInt(4, vo.getNo());
				   ps.executeUpdate();
			   }
			   else
			   {
				   bCheck=false;
			   }
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   disConnection();
		   }
		   return bCheck;
	   }
	   
	   public boolean noticeDelete(int no,String pwd)
	   {
		   boolean bCheck=false;
		   try
		   {
			   getConnection();
			   conn.setAutoCommit(false);
			   // 비밀번호 체크 
			   String sql="SELECT pwd FROM notice "
					     +"WHERE no=?";
			   ps=conn.prepareStatement(sql);
			   ps.setInt(1, no);
			   ResultSet rs=ps.executeQuery();
			   rs.next();
			   String db_pwd=rs.getString(1);
			   rs.close();
			   if(pwd.equals(db_pwd)) 
			   {
				   bCheck=true;//

				   sql="DELETE FROM notice "
					  +"WHERE no=?";
				   ps=conn.prepareStatement(sql);
				   ps.setInt(1, no);
				   ps.executeUpdate();
				   conn.commit();
			   }
			   else
			   {
				   bCheck=false;// history.back()
			   }
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
			   try
			   {
				   conn.rollback();
			   }catch(Exception e)
			   {
				   e.printStackTrace();
				   
			   }
		   }
		   finally
		   {
			   try
			   {
				   conn.setAutoCommit(true);
			   }catch(Exception ex) {}
			   disConnection();
		   }
		   return bCheck;
	   }
}
