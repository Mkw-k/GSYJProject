package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import Dao.AdoptDogDao;
import Dao.RescuedDogDao;
import Dto.AdoptDogDto;
import Dto.RescuedDogDto;
import net.sf.json.JSONObject;

@WebServlet(urlPatterns = "/adopt")
public class AdoptDogController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		System.out.println("AdoptController doProcess");
		
		req.setCharacterEncoding("utf-8");
		
		String param = req.getParameter("param");
		
		// 입양신청입력 폼
		if(param.equals("writeAdopt")) {
			System.out.println("In WriteAdopt Param!");
			String seq = req.getParameter("seq");
			
			req.setAttribute("seq", seq);
			req.setAttribute("content", "./adopt/writeAdopt");
			forward("index.jsp", req, resp);
		}
		// 입양신청 폼 입력 후 리스트로 이동
		else if(param.equals("writeAdoptAf")) {
			String myid = req.getParameter("myid");
			String ryear = req.getParameter("ryear");
			String rmonth = req.getParameter("rmonth");
			String rdate = req.getParameter("rdate");
			String rday = ryear + rmonth + rdate;
			String mycontent = req.getParameter("mycontent");
			String phoneNum1 = req.getParameter("phoneNum1");
			String phoneNum2 = req.getParameter("phoneNum2");
			String phoneNum3 = req.getParameter("phoneNum3");
			String phoneNum = phoneNum1 + phoneNum2 + phoneNum3;
			String title = req.getParameter("title");
			int seq = Integer.parseInt(req.getParameter("seq"));
			
			RescuedDogDao d= RescuedDogDao.getInstance();
			RescuedDogDto dto = d.rescuedDetail(seq);
			
			AdoptDogDao dao = AdoptDogDao.getInstance();
			boolean isS = dao.writeAdopt(new AdoptDogDto(myid, rday, mycontent, phoneNum, title));
			if(isS) {
				d.conditionChange1(seq, dto.getTitle());
				resp.sendRedirect("rescued?param=list");				
			}
			
		
		
		}
		// 입양신청 목록
		else if(param.equals("adoptList")) {
			String choice = req.getParameter("choice");
			String search = req.getParameter("search");
			String spage = req.getParameter("pageNumber");
			
			int page = 0;
			if(spage != null && !spage.equals("")) {
				page = Integer.parseInt(spage);
			}
			if(choice == null) {
				choice = "";
			}
			if(search == null) {
				search = "";
			}
			
			
			AdoptDogDao dao = AdoptDogDao.getInstance();
			List<AdoptDogDto> list = dao.adoptPagingList(choice, search, page);
			req.setAttribute("list", list);
			System.out.println(list);
			
			int len = dao.getAllAdoptDog(choice, search);
			int addPage = len / 10;
			if((len % 10) > 0) {
				addPage = addPage +1;
			}
			
			System.out.println("컨트롤러 총 글자 길이 : "+len);
			System.out.println("컨트롤러 표시되는 페이지 수  : "+addPage);

			
			req.setAttribute("addPage", addPage + "");
			req.setAttribute("pageNumber", page + "");
			
			req.setAttribute("content", "./adopt/adoptList");

			
			forward("index.jsp", req, resp);
			
		}
		// 입양신청 리스트에서 글 클릭시 Detail 화면
		else if(param.equals("adoptDetail")) {
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq.trim());
			
			AdoptDogDao dao = AdoptDogDao.getInstance();
			
			AdoptDogDto dto = dao.getAdopt(seq);
			
			req.setAttribute("adopt", dto);			
			req.setAttribute("content", "./adopt/adoptDetail");			
			
			forward("index.jsp", req, resp);
			
		}
		// Detail에서 글 수정 클릭 시 Update
		else if(param.equals("adoptUpdate")) {
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq.trim());
			
			AdoptDogDao dao = AdoptDogDao.getInstance();
			AdoptDogDto dto = dao.getAdopt(seq);
			
			req.setAttribute("adopt", dto);
			
			forward("adoptUpdate.jsp", req, resp);
		}
		// 수정 후 등록 -> 리스트 이동
		else if(param.equals("adoptUpdateAf")) {
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq.trim());
			
			String title = req.getParameter("title");
			String mycontent = req.getParameter("mycontent");
			String ryear = req.getParameter("ryear");
			String rmonth = req.getParameter("rmonth");
			String rday = req.getParameter("rday");
			String rdate = ryear + rmonth + rday;
			String phoneNum = req.getParameter("phoneNum");
			
			AdoptDogDao dao = AdoptDogDao.getInstance();
			boolean isS = dao.updateAdopt(seq, title, mycontent, rdate, phoneNum);
			
			
			
			if(!isS) {
				resp.sendRedirect("adopt?param=adoptUpdate&seq=" + sseq);
			}
			resp.sendRedirect("adopt?param=adoptList");
			
		}
		// 글 삭제 버튼 누를 시
		else if(param.equals("adoptDelete")) {
			int seq = Integer.parseInt(req.getParameter("seq"));
			System.out.println("seq: " + seq);
			
			AdoptDogDao dao = AdoptDogDao.getInstance();
			dao.deleteAdopt(seq);
			
			resp.sendRedirect("adopt?param=adoptList");

			
		}
		

		
		

		
	
	}
		
	

	private void forward(String arg, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		// TODO Auto-generated method stub
		RequestDispatcher dispatch = req.getRequestDispatcher(arg);
		dispatch.forward(req, resp);		
	}
}
