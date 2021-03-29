package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import Dto.MemberDto;
import db.DBClose;
import db.DBConnection;


public class MemberDao {

private static MemberDao dao = new MemberDao();
	
	private MemberDao() {
		DBConnection.initConnection();
	}
	
	public static MemberDao getInstance() {		
		return dao;
	}
	
	public boolean addMember(MemberDto dto) {
		String sql =  " INSERT INTO MYMEMBER "
					+ " (SEQ, MYID, PWD, MYNAME,"
					+ " PHONENUM, EMAIL, MYMANAGER)"
					+ " VALUES( SEQ_MYMEMBER.NEXTVAL, ?, ?, ?, ?, ?, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addMember success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("2/3 addMember success");
			
			psmt.setString(1, dto.getMyid());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getMyname());
			psmt.setString(4, dto.getPhonenum());
			psmt.setString(5, dto.getEmail());
			
			count = psmt.executeUpdate();
			System.out.println("3/3 addMember success");
			
		} catch (SQLException e) {			
			e.printStackTrace();
			System.out.println("addMember fail");
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
		return count>0?true:false;
	}
	
	  public MemberDto login(String Id, String pwd) {
		
		String sql =  " SELECT MYID, MYNAME, EMAIL, MYMANAGER "
					+ " FROM MYMEMBER "
					+ " WHERE MYID=? AND PWD=? ";  
		  
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		
		MemberDto mem = null; 
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("1/3 login suc");
			
			psmt.setString(1, Id);
			psmt.setString(2, pwd);
			
			System.out.println("2/3 login suc");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String myid = rs.getString(1);
				String myname = rs.getString(2);
				String email = rs.getString(3);
				int mymanager = rs.getInt(4);
				
				mem = new MemberDto(myid, email, myname, mymanager);
			}
			
			System.out.println("3/3 login suc");
			
		} catch (Exception e) {
			System.out.println("login fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
				
		return mem;
		}
	
	  
	  public boolean getId(String Id) {
		String sql =  " SELECT MYID"
					+ " FROM MYMEMBER"
					+ " WHERE MYID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		boolean b = false;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getId success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, Id.trim());
			System.out.println("2/3 getId success");
			
			rs = psmt.executeQuery();
			System.out.println("3/3 getId success");
			
			if(rs.next()) {
				b = true;
			}			
			
		} catch (SQLException e) {
			System.out.println("getId fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
		
		return b;
	  }
	  
	/*
	 * 
	 * public boolean getEmail(String email) {
	 * 
	 * }
	 * 
	 * public String getFindId(String email) {
	 * 
	 * }
	 * 
	 * public boolean update(String email, MemberDto dto) {
	 * 
	 * }
	 */
	
	
}
