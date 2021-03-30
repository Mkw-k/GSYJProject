package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBClose;
import DB.DBConnection;

import Dto.UsefulDto;

public class UsefulDao {
	
	private static UsefulDao dao = new UsefulDao();
	
	public UsefulDao() {
	
	}
	
	public static UsefulDao getInstance() {
		return dao;
	}
	
	
	public boolean writeUseful(UsefulDto dto) {
		String sql =  " INSERT INTO USEFUL (SEQ, MYID, TITLE, CONTENT, WDATE, LINK, DEL) "
					+ " VALUES(SEQ_USEFUL.NEXTVAL, ?, ?, ?, SYSDATE, ?, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S writeBbs");
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMyid());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getMycontent());
			psmt.setString(4, dto.getLink());
			
			System.out.println("2/3 S writeBbs");
			
			count = psmt.executeUpdate();	
			System.out.println("3/3 S writeBbs");
			
		} catch (SQLException e) {
			System.out.println("fail writeBbs");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}

		return count>0?true:false;
	}
	
	public List<UsefulDto> getBbsPagingList(String choice, String search, int pageNumber) {
		String sql =  " SELECT RNUM, SEQ, MYID, TITLE, MYCONTENT, WDATE, LINK, VCOUNT, DEL "
					+ " FROM ";
			
			sql += " (SELECT ROW_NUMBER()OVER(ORDER BY SEQ DESC) AS RNUM, "
				+  " SEQ, MYID, TITLE, MYCONTENT, WDATE, LINK, VCOUNT, DEL "
				+  " FROM USEFUL "
				+  " WHERE DEL = 0 ";
	
		String sWord = "";
		if(!search.equals("")) {
		if(choice.equals("title")) {
			sWord = " AND TITLE LIKE '%"+ search + "%' ";
		}else if (choice.equals("content")) {
			sWord = " AND CONTENT LIKE '%"+ search + "%' ";
		}else if (choice.equals("writer")) {
			sWord = " AND MYID= '"+ search + "'";
		}
		}
		
		sql = sql +sWord;
		
		sql = sql + " ORDER BY RNUM ASC) ";
		
		sql = sql + " WHERE RNUM >= ? AND RNUM <= ? ";
		
		int start, end; 
		start = 1+10*pageNumber;
		end = 10 +10 * pageNumber;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<UsefulDto> list = new ArrayList<UsefulDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getBbsPagingList success");
				
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			System.out.println("2/4 getBbsPagingList success");
			
			System.out.println("겟페이징리스트 sql : "+sql);
			
			rs = psmt.executeQuery();			
			System.out.println("3/4 getBbsPagingList success");
			
			
			while(rs.next()) {
				UsefulDto dto = new UsefulDto(
										rs.getInt(1), 
										rs.getInt(2), 
										rs.getString(3), 
										rs.getString(4), 
										rs.getString(5), 
										rs.getString(6), 
										rs.getString(7), 
										rs.getInt(8), 
										rs.getInt(9) );
									
				list.add(dto);
			}			
			System.out.println("4/4 getBbsPagingList success");
			
		} catch (SQLException e) {	
			System.out.println("getBbsPagingList fail");
			e.printStackTrace();
		} finally {			
			DBClose.close(conn, psmt, rs);			
		}
		
		return list;
		
	}
}
