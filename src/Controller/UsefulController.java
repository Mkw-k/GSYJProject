package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BbsDao;
import Dao.UsefulDao;
import Dto.BbsDto;
import Dto.UsefulDto;

@WebServlet(urlPatterns = "/use")	
public class UsefulController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("UsefulController doProcess");
		
		String param = req.getParameter("param");
		
		if(param.equals("getPagingList")) {
			System.out.println("getPagingList 실행");
			
			resp.sendRedirect("usefulwrite.jsp");
			
		}
		

//TODO 글쓰기		
		else if(param.equals("writeUse")) {
			System.out.println("writeUse 실행");
			
			resp.sendRedirect("usefulwrite.jsp");
			
		}

//TODO 글등록 		
		else if(param.equals("writeUseAf")) {
			System.out.println("writeUse 실행");
			
			String myid = req.getParameter("myid");
			String title = req.getParameter("title");
			String mycontent = req.getParameter("content");
			String link = req.getParameter("link");
			
			UsefulDto dto = new UsefulDto(myid, title, mycontent, link);
			
			UsefulDao dao = UsefulDao.getInstance();
			
			boolean b = dao.writeUseful(dto);
			
			if(b) {
				System.out.println("글쓰기 성공");
				resp.sendRedirect("use?param=UsefulTabPagingList");
			}else {
				System.out.println("글쓰기실패");
				resp.sendRedirect("use?param=UsefulTabPagingList");
			}
			
			
		}
		
//TODO 페이징 리스트 가져오기 
		else if(param.equals("getPagingBbsList")) {
			System.out.println("getPagingBbsList 실행");
			System.out.println("getPagingBbsList 1/7");
			//BbsDao 싱글턴 인스턴스 생성 
			UsefulDao dao = UsefulDao.getInstance();
			
			//choice와 search 넘어옴 
			String choice = req.getParameter("choice");
			String search = req.getParameter("search");
			
			//만약에 choice와 search가 값이 넘어오지 않는다면 
			if(choice == null){
				choice = "";
			}
			if(search == null){
				search = "";
			}
			
			System.out.println("choice : "+ choice);
			System.out.println("search : "+ search);
			
			//pageNumber 넘어옴  (spageNumber에 일단 받아둠)
			String spageNumber =req.getParameter("pageNumber");
			System.out.println("getPagingBbsList 2/7");
			
			//pageNumber는 0으로 설정, 만약에 spageNumber에 값이 들어가 있다면 pageNumber는 spageNumber로 변경 
			int pageNumber = 0;
			if(spageNumber != null && !spageNumber.equals("")){
				pageNumber = Integer.parseInt(spageNumber);
			}
			System.out.println("pageNumber : "+ pageNumber);
			System.out.println("getPagingBbsList 3/7");
			
			//list 설정 
			List<UsefulDto> list = dao.getBbsPagingList(choice, search, pageNumber);
			System.out.println("listsize : "+ list.size());
			System.out.println("getPagingBbsList 4/7");
			
			//가져올 데이터의 길이 len을 설정함 
			int len = dao.getAllUseful(choice, search);
			System.out.println("len : "+ len);
			System.out.println("getPagingBbsList 5/7");
			
			//bbspage 설정 
			int bbspage = len/10;
			if((len%10) > 0){
				bbspage = bbspage +1;
			}
			
			System.out.println("bbspage : "+ bbspage);
			System.out.println("getPagingBbsList 6/7");
			
			//모든 데이터 싸서 보내기 
			req.setAttribute("choice", choice);
			req.setAttribute("search", search);
			req.setAttribute("pageNumber", pageNumber+"");
			req.setAttribute("len", len+"");
			req.setAttribute("bbspage", bbspage+"");
			req.setAttribute("list", list);
			
			System.out.println("getPagingBbsList 7/7");
			req.getRequestDispatcher("index.jsp?content=./useful/usefullist").forward(req, resp);
			
			
		}
		
//TODO 메인에 있는 유용한 정보 태에 페이징 리스트 가져오기 
		else if(param.equals("UsefulTabPagingList")) {
			System.out.println("UsefulTabPagingList 실행");
			System.out.println("UsefulTabPagingList 1/7");
			//BbsDao 싱글턴 인스턴스 생성 
			UsefulDao dao = UsefulDao.getInstance();
			
			//choice와 search 넘어옴 
			String choice = req.getParameter("choice");
			String search = req.getParameter("search");
			
			//만약에 choice와 search가 값이 넘어오지 않는다면 
			if(choice == null){
				choice = "";
			}
			if(search == null){
				search = "";
			}
			
			System.out.println("choice : "+ choice);
			System.out.println("search : "+ search);
			
			//pageNumber 넘어옴  (spageNumber에 일단 받아둠)
			String spageNumber =req.getParameter("pageNumber");
			System.out.println("UsefulTabPagingList 2/7");
			
			//pageNumber는 0으로 설정, 만약에 spageNumber에 값이 들어가 있다면 pageNumber는 spageNumber로 변경 
			int pageNumber = 0;
			if(spageNumber != null && !spageNumber.equals("")){
				pageNumber = Integer.parseInt(spageNumber);
			}
			System.out.println("pageNumber : "+ pageNumber);
			System.out.println("UsefulTabPagingList 3/7");
			
			//list 설정 
			List<UsefulDto> list = dao.UsefulTabUsePaginList(choice, search, pageNumber);
			System.out.println("listsize : "+ list.size());
			System.out.println("UsefulTabPagingList 4/7");
			
			//가져올 데이터의 길이 len을 설정함 
			int len = dao.getAllUseful(choice, search);
			System.out.println("len : "+ len);
			System.out.println("UsefulTabPagingList 5/7");
			
			//bbspage 설정 
			int bbspage = len/4;
			if((len%4) > 0){
				bbspage = bbspage +1;
			}
			
			System.out.println("bbspage : "+ bbspage);
			System.out.println("UsefulTabPagingList 6/7");
			
			//모든 데이터 싸서 보내기 
			req.setAttribute("choice", choice);
			req.setAttribute("search", search);
			req.setAttribute("pageNumber", pageNumber+"");
			req.setAttribute("len", len+"");
			req.setAttribute("bbspage", bbspage+"");
			req.setAttribute("list", list);
			
			System.out.println("UsefulTabPagingList 7/7");
			req.getRequestDispatcher("./useful/usefullist.jsp").forward(req, resp);
			
			
		}
		
//TODO 삭제 
		else if(param.equals("deleteUse")) {
			System.out.println("deleteUse 실행");
		
			int seq = Integer.parseInt(req.getParameter("seq"));
			
			UsefulDao dao = UsefulDao.getInstance();
			
			boolean b = dao.deleteUse(seq);
			
			if(b) {
				System.out.println("삭제성공");
			}
			
			resp.sendRedirect("use?param=UsefulTabPagingList");
			
		} // end deleteBbs
	
//TODO 디테일 페이지로 이동
		else if(param.equals("useDetail")) {
			System.out.println("useDetail 실행");
			
			int seq = Integer.parseInt(req.getParameter("seq"));
			
			UsefulDao dao = UsefulDao.getInstance();
			UsefulDto dto = dao.getUse(seq);
			
			//조회수 증가 
			dao.readcount(seq);
			
			req.setAttribute("dto", dto);
			
			req.getRequestDispatcher("./useful/usefuldetail.jsp").forward(req, resp);
		
		}//end useDetail
		
//TODO 업데이트 
else if(param.equals("useUpdate")) {
			System.out.println("useUpdate 실행");
			int seq = Integer.parseInt(req.getParameter("seq"));
			
			UsefulDao dao = UsefulDao.getInstance();
			UsefulDto dto = dao.getUse(seq);
			
			req.setAttribute("dto", dto);
			
			req.getRequestDispatcher("./useful/usefulupdate.jsp").forward(req, resp);;
			
		}//end useUpdate
		
//TODO 업데이트 Af
		else if(param.equals("useUpdateAf")) {
			System.out.println("useUpdate 실행");
			
			int seq = Integer.parseInt(req.getParameter("seq"));
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String link = req.getParameter("link");
			
			UsefulDao dao = UsefulDao.getInstance();
			
			boolean b  = dao.updateUse(seq, title, content, link);
			
			if(b) {
				System.out.println("수정 성공");
			}else {
				System.out.println("수정 실패");
			}
			
			resp.sendRedirect("use?param=UsefulTabPagingList");
	}//end useUpdate
	
	
}
	
}
