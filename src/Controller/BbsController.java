package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Dto.BbsDto;
import dao.BbsDao;
import db.DBClose;
import db.DBConnection;
import util.UtilEx;

@WebServlet(urlPatterns = "/bbs")	
public class BbsController extends HttpServlet {
	
	ServletConfig mConfig = null;
	final int BUFFER_SIZE = 8192;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess( req,  resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess( req,  resp);
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		mConfig = config;	// 업로드한 경로를 취득하기 위해서
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("BbsController doProcess!");
		
		String param = req.getParameter("param");


// TODO 커뮤니티 페이지로 이동
				if (param.equals("toBbslist")) {
					
					BbsDao dao = BbsDao.getInstance();
					String choice = "";
					String search = "";
					
					
				/*	
					if(req.getParameter("choice")==null) {
						System.out.println("초이스비었음");
						choice = "";
					}else {
						choice = req.getParameter("choice");
					}
					
					
					if(req.getParameter("search")==null) {
						System.out.println("서치비었음");
						search = "";
					}else {
						search = req.getParameter("search");
					}
					
				*/	
					int len = dao.getAllBbs(choice, search);
					List<BbsDto> list = dao.getBbsPagingList(choice, search, 0);
					
					System.out.println("len : " + len);
					req.setAttribute("len", len + "");
					req.setAttribute("list", list);
					req.getRequestDispatcher("index.jsp?content=bbslist").forward(req, resp);
				
				} // end toBbslist
				
// TODO 글쓰기 탭으로 이동 
				if (param.equals("bbsWrite")) {
					System.out.println("bbsWrite 실행");
					
					resp.sendRedirect("index.jsp?content=bbswrite");
					
					
				} // end bbsWrite
		
// TODO 디테일 페이지로 이동 
				if (param.equals("bbsDetail")) {
					System.out.println("bbsDetail 실행");
					
					int seq = Integer.parseInt(req.getParameter("seq"));
					
					BbsDao dao = BbsDao.getInstance();
					BbsDto bbs = dao.getBbs(seq);
					
					//조회수 증가 
					dao.readcount(seq);
					
					req.setAttribute("bbs", bbs);
					
					req.getRequestDispatcher("index.jsp?content=bbsdetail").forward(req, resp);
					
					
				} // end bbsDetail
				
// TODO 글삭제
				if (param.equals("deleteBbs")) {
					System.out.println("deleteBbs 실행");
					
					int seq = Integer.parseInt(req.getParameter("seq"));
					
					BbsDao dao = BbsDao.getInstance();
					
					boolean b = dao.deleteBbs(seq);
					
					if(b) {
						System.out.println("삭제성공");
					}
					
					resp.sendRedirect("index.jsp");
					
				} // end deleteBbs
				
		/*
		 * // TODO 조회수 if (param.equals("readcount")) {
		 * System.out.println("readcount 실행");
		 * 
		 * 
		 * int seq = Integer.parseInt(req.getParameter("seq"));
		 * 
		 * 
		 * BbsDao dao = BbsDao.getInstance(); dao.readcount(seq);
		 * System.out.println("증가완료");
		 * 
		 * req.getRequestDispatcher("index.jsp?content=bbsdetail").forward(req, resp);
		 * 
		 * } // end readcount
		 */
				
				
// TODO 업데이트 탭으로 이동
				if (param.equals("updateBbs")) {
					System.out.println("updateBbs 실행");
					
					int seq = Integer.parseInt(req.getParameter("seq"));
					
					BbsDao dao = BbsDao.getInstance();
					
					BbsDto bbs = dao.getBbs(seq);
					
					req.setAttribute("bbs", bbs);
					
					req.getRequestDispatcher("index.jsp?content=bbsupdate").forward(req, resp);
					
				} // end updateBbs
				
// TODO 업데이트 (수정) AF
				if (param.equals("updateBbsAf")) {
					System.out.println("updateBbsAf 실행");
					
					int seq = Integer.parseInt(req.getParameter("seq"));
					String title = req.getParameter("title");
					String content = req.getParameter("content");
					
					BbsDao dao = BbsDao.getInstance();
					
					boolean b = dao.updateBbs(seq, title, content);
					
					if(b) {
						System.out.println("변경성공");
					}
					
					resp.sendRedirect("index.jsp?content=bbslist");
				} // end updateBbs
				
// TODO 검색기능 
				if (param.equals("searchBbsList")) {
					System.out.println("searchBbsList 실행");
					
					String choice = req.getParameter("choice");
					String keword = req.getParameter("search");
					
					BbsDao dao = BbsDao.getInstance();
					
					List<BbsDto> list = dao.searchBbsList(choice, keword);
					
					req.setAttribute("list", list);
					
					req.getRequestDispatcher("index.jsp?content=bbslist").forward(req, resp);
					
					
					
					
				} // end searchBbsList
				
// TODO 페이징으로 리스트 가져가기  
				if (param.equals("getPagingBbsList")) {
					System.out.println("getPagingBbsList 실행");
					
					String choice = req.getParameter("choice");
					String keyword = req.getParameter("search");
					
					int pageNum;
					
									
					if(req.getParameter("pageNumber") != null) {
					pageNum = Integer.parseInt(req.getParameter("pageNumber"));
					}else {
					pageNum = 0;
					}
					
					System.out.println("pageNum : "+pageNum);
					BbsDao dao = BbsDao.getInstance();
					
					int len = dao.getAllBbs(choice, keyword);
					
					List<BbsDto> list = dao.getBbsPagingList(choice, keyword, pageNum);
					
					System.out.println("변환전 page : " + pageNum);
					System.out.println("변환전 len : " + len);
					
					req.setAttribute("pageNumber", pageNum+"");
					
					req.setAttribute("변환 후 len", len+"");
					
					req.setAttribute("변환 후 list", list);
					
					req.getRequestDispatcher("index.jsp?content=bbslist").forward(req, resp);
					
					
				} // end searchBbsList
				
// TODO 글쓰기 완료후 등록
		/*
		 * if (param.equals("bbsWriteAf")) { System.out.println("bbsWriteAf 실행");
		 * ServletConfig mConfig = null;
		 * 
		 * 
		 * String myid = req.getParameter("id"); String title =
		 * req.getParameter("title"); String mycontent = req.getParameter("content");
		 * String filename = ""; // tomcat 배포 - server String fupload =
		 * mConfig.getServletContext().getRealPath("/upload");
		 * 
		 * 
		 * // 지정 폴더 - client // String fupload = "d:\\tmp";
		 * 
		 * System.out.println("업로드 폴더:" + fupload);
		 * 
		 * String yourTempDir = fupload;
		 * 
		 * int yourMaxRequestSize = 100 * 1024 * 1024; // 1 Mbyte int yourMaxMemorySize
		 * = 100 * 1024; // 1 Kbyte
		 * 
		 * // form field의 데이터를 저장할 변수
		 * 
		 * 
		 * // file명 저장 String newfilename = "";
		 * 
		 * boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		 * if(isMultipart == true){
		 * 
		 * // FileItem 생성 DiskFileItemFactory factory = new DiskFileItemFactory();
		 * 
		 * //맥스 사이즈 지정 factory.setSizeThreshold(yourMaxMemorySize); //저장소 지정 :
		 * yourTempDir -> 업로드 폴더는 서버의 /upload factory.setRepository(new
		 * File(yourTempDir));
		 * 
		 * //팩토리???? ServletFileUpload upload = new ServletFileUpload(factory); //업로드 맥스
		 * 사이즈 책정 upload.setSizeMax(yourMaxRequestSize);
		 * 
		 * 
		 * List<FileItem> items= null;
		 * 
		 * try {
		 * 
		 * items = upload.parseRequest(req);
		 * 
		 * } catch (FileUploadException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 * 
		 * Iterator<FileItem> it = items.iterator();
		 * 
		 * while(it.hasNext()){
		 * 
		 * FileItem item = it.next();
		 * 
		 * if(item.isFormField()){ // id, title, content
		 * if(item.getFieldName().equals("id")){ myid = item.getString("utf-8"); } else
		 * if(item.getFieldName().equals("title")){ title = item.getString("utf-8"); }
		 * else if(item.getFieldName().equals("content")){ mycontent =
		 * item.getString("utf-8"); } } else{ // file
		 * if(item.getFieldName().equals("fileload")){ // 확장자 명 String fileName =
		 * item.getName(); int lastInNum = fileName.lastIndexOf("."); String exName =
		 * fileName.substring(lastInNum);
		 * 
		 * // 새로운 파일명 // 시스템 타임을 새로운 파일네임으로 사용 newfilename = (new Date().getTime()) +
		 * ""; newfilename = newfilename + exName; System.out.println(newfilename);
		 * 
		 * filename = UtilEx.processUploadFile(item, newfilename, yourTempDir); } } } }
		 * 
		 * // DB에 저장 BbsDao dao = BbsDao.getInstance(); BbsDto bbs = new BbsDto(0, myid,
		 * title, mycontent, "0", newfilename, 0); boolean b = dao.writeBbs(bbs);
		 * 
		 * if(b) { System.out.println("등록성공"); }else { System.out.println("등록실패"); }
		 * 
		 * 
		 * 
		 * } // end toIndex
		 */				
	
	
}
}

























