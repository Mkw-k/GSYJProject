package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UsefulDao;
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
		
		
		else if(param.equals("writeUse")) {
			System.out.println("writeUse 실행");
			
			resp.sendRedirect("usefulwrite.jsp");
			
		}
		
		else if(param.equals("writeUseAf")) {
			System.out.println("writeUse 실행");
			
			String myid = req.getParameter("myid");
			String title = req.getParameter("title");
			String mycontent = req.getParameter("mycontent");
			String link = req.getParameter("link");
			
			UsefulDto dto = new UsefulDto(myid, title, mycontent, link);
			
			UsefulDao dao = UsefulDao.getInstance();
			
			boolean b = dao.writeUseful(dto);
			
			if(b) {
				System.out.println("글쓰기 성공");
				resp.sendRedirect("usefullist.jsp");
			}else {
				System.out.println("글쓰기실패");
				resp.sendRedirect("usefullist.jsp");
			}
			
		}
		
		else if(param.equals("")) {
			
		}
		
	}
	
	
}
