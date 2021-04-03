package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBClose;
import DB.DBConnection;
import Dto.BbsDto;
import Dto.UsefulDto;
import util.UtilEx;



public class UsefulDao {
	
	private static UsefulDao dao = new UsefulDao();
	
	public UsefulDao() {
		DBConnection.initConnection();
	}
	
	public static UsefulDao getInstance() {
		return dao;
	}
	
//TODO 글쓰기 	
	public boolean writeUseful(UsefulDto dto) {
		System.out.println("writeUseful 실행");
		System.out.println("writeUseful id : "+ dto.getMyid());
		
		String sql =  " INSERT INTO USEFUL (SEQ, MYID, TITLE, MYCONTENT, WDATE, LINK, DEL, VCOUNT) "
					+ " VALUES(SEQ_USEFUL.NEXTVAL, ?, ?, ?, SYSDATE, ?, 0, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;		
		int count = 0;
		
		String link = UtilEx.extracTxt(dto.getLink());
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S writeUseful");
				
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMyid());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getMycontent());
			psmt.setString(4, link);
			
			System.out.println("2/3 S writeUseful");
			
			count = psmt.executeUpdate();	
			System.out.println("3/3 S writeUseful");
			
		} catch (SQLException e) {
			System.out.println("fail writeUseful");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}

		return count>0?true:false;
	}

	
//TODO 페이징 리스트로 가져오는 함수(유용한 정보 탭에서 사용하기 위헤 한페이지당 4개 나옴)
	public List<UsefulDto> UsefulTabUsePaginList(String choice, String search, int pageNumber) {
		String sql =  " SELECT RNUM, SEQ, MYID, TITLE, MYCONTENT, WDATE, LINK, DEL, VCOUNT  "
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
		start = 1+(4*pageNumber);
		end = 4+(4*pageNumber);
		
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
			
			//System.out.println("겟페이징리스트 sql : "+sql);
			
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

//TODO 모든 useful의 숫자를 리턴 하는 메서드 
	public int getAllUseful(String choice, String search) {
		String sql =  " SELECT COUNT(*)"
					+ " FROM USEFUL"
					+ " WHERE DEL = 0 ";
		
		String sWord = "";
		if(!search.equals("")) {
			if(choice.equals("title")) {
				sWord = " AND TITLE LIKE '%" + search + "%' ";
			}else if(choice.equals("content")) {
				sWord = " AND MYCONTENT LIKE '%" + search + "%' ";
			}else if(choice.equals("writer")) {
				sWord = " AND MYID='" + search + "'";
			}
		} 
		 
		sql = sql + sWord;
		
		//System.out.println("getAllUseful sql : "+ sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int len = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 getAllBbs success");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/3 getAllBbs success");
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				len = rs.getInt(1);
			}
			
			System.out.println("3/3 getAllBbs success");
			
		} catch (SQLException e) {
			System.out.println("getAllBbs fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
		
		return len;
	}//end getAllUseful
	
//TODO 삭제
	public boolean deleteUse(int seq) {
		String sql =  " UPDATE USEFUL"
					+ " SET DEL = 1"
					+ " WHERE SEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S deleteUse");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 S deleteUse");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S deleteUse");
			
		} catch (Exception e) {		
			System.out.println("fail deleteUse");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);			
		}
		
		return count>0?true:false;
	}//end deleteUse

//TODO dto 한개만 가져오는 메서드 
	public UsefulDto getUse(int seq) {
		String sql =  " SELECT SEQ, MYID, TITLE, MYCONTENT, WDATE, LINK, DEL, VCOUNT"
					+ " FROM USEFUL"
					+ " WHERE SEQ = ? AND DEL = 0 ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		UsefulDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getBbs Success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/4 getBbs Success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getBbs Success");
			
			if(rs.next()) {
				int i = 1;				
				dto = new UsefulDto(rs.getInt(i++), 
									rs.getString(i++), 
									rs.getString(i++), 
									rs.getString(i++), 
									rs.getString(i++), 
									rs.getString(i++),
									rs.getInt(i++),
									rs.getInt(i++)
								);				
			}
			System.out.println("4/4 getBbs Success");
			
		} catch (Exception e) {		
			System.out.println("getBbs Fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);			
		}
				
		return dto;
	}//getUse

//TODO 조회수 증가	
	public void readcount(int seq) {
		int count = 0;
		
		String sql =  " UPDATE USEFUL"
					+ " SET VCOUNT = VCOUNT +1"
					+ " WHERE SEQ = ? ";
		
		Connection conn=null;
		PreparedStatement psmt=null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S  readcount");
			
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, seq );
			System.out.println("2/3 S  readcount");
			
			count=psmt.executeUpdate();
			System.out.println("3/3 S  readcount");
			
			
		} catch (Exception e) {
			System.out.println("F readcount");
		}finally{
			DBClose.close(conn, psmt, null);
		}
	}//end readcount

//TODO 업데이트
	public boolean updateUse(int seq, String title, String content, String link) {
		System.out.println("updateUse 실행");
		
		String sql =  " UPDATE USEFUL "
					+ " SET TITLE=?, MYCONTENT=?, WDATE=SYSDATE ";
		
		String sWord = "";
		
		link = UtilEx.extracTxt(link);
		
		System.out.println("link = "+link);
		System.out.println("content = "+content);
		System.out.println("title = "+title);
		
		if(link != null && !link.equals("")) {
			sWord += " , LINK = ? "; 
		}
		
		sWord += "WHERE SEQ=? ";
		
		sql = sql + sWord;
		
		System.out.println(sql);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S updateUse");
			
			psmt = conn.prepareStatement(sql);
			
			if(link != null && !link.equals("")) {
				psmt.setString(1, title);
				psmt.setString(2, content);
				psmt.setString(3, link);
				psmt.setInt(4, seq);
					
			}else{
				psmt.setString(1, title);
				psmt.setString(2, content);
				psmt.setInt(3, seq);
			}
			
			System.out.println("2/3 S updateUse");

			count = psmt.executeUpdate();			
			System.out.println("3/3 S updateUse");
			
		} catch (SQLException e) {
			System.out.println("fail updateUse");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count>0?true:false;
	}//end updateUse
}
