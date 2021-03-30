package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
}
