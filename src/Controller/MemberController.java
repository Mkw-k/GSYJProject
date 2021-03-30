package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import Dao.MemberDao;
import Dto.MemberDto;
import net.sf.json.JSONObject;

@WebServlet(urlPatterns = "/mem")		// namespace
public class MemberController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		System.out.println("Member Controller doProcess!");
		
		String param = req.getParameter("param");

// TODO 메인페이지로 이동
		if (param.equals("toIndex")) {

			resp.sendRedirect("index.jsp");

		} // end toIndex
				
// TODO 회원가입뷰(regi.jsp)로 이동
		if (param.equals("toAddMember")) {
			
				resp.sendRedirect("index.jsp?content=regi");
			
		} // end toAddMember
				

//TODO 회원가입 작성완료 후 작업 (DB등록)
		if(param.equals("addMemberAf")) {
			System.out.println("addMember process!");
			MemberDao dao = MemberDao.getInstance();
			String myid = req.getParameter("myid");
			String pwd = req.getParameter("pwd");
			String email = req.getParameter("email");
			String myname = req.getParameter("myname");
			String phonenum1 = req.getParameter("phonenum1");
			String phonenum2 = req.getParameter("phonenum2");
			String phonenum3 = req.getParameter("phonenum3");
			
			String phonenum = phonenum1+phonenum2+phonenum3;
			
			MemberDto dto = new MemberDto(0, myid, pwd, email, myname, phonenum, 0);
			boolean b = dao.addMember(dto);
			
			if(b) {
				System.out.println("회원가입 성공");
				resp.sendRedirect("index.jsp");
			}else {
				System.out.println("회원가입 실패");
				resp.sendRedirect("index.jsp?content=regi");
			}
			
		}//end addMemberAf
		
//TODO 아이디가져오기 
		if(param.equals("idCheck")) {
			System.out.println("MemberController idCheck");
			
			String Id = req.getParameter("id");
			System.out.println("id = "+Id);
			
			MemberDao dao = MemberDao.getInstance();
			boolean b = dao.getId(Id);
			
			String str = "NO";
			if(b == false) {
				str = "YES";
			}
			
			JSONObject jObj = new JSONObject();
			jObj.put("msg", str);
			
			resp.setContentType("application/x-json; charset=UTF-8");
			resp.getWriter().print(jObj);
		}//end getId

//TODO 아이디가져오기 
		if(param.equals("getId")) {
			
		}//end getId
		
//TODO 로그인뷰(login.jsp)로 이동 
		if(param.equals("login")) {
			resp.sendRedirect("index.jsp?content=login");
		}//end login
		
// TODO 로그인 After 작업
		if (param.equals("loginAf")) {
			System.out.println("MemberController loginAf");
			
			String Id = req.getParameter("id");
			String pwd = req.getParameter("password");
			
			MemberDao dao = MemberDao.getInstance();
			MemberDto mem = dao.login(Id, pwd);
			
			req.getSession().setAttribute("login", mem);
			
			if(mem != null) {
				req.setAttribute("inb", "success");
				req.getRequestDispatcher("index.jsp").forward(req, resp);
			}else {
				System.out.println("login 정보 확인");
				req.setAttribute("logChk", "fail");
				req.getRequestDispatcher("index.jsp?content=login").forward(req, resp);
			}
		} // end loginAf
		
//TODO 로그인뷰(login.jsp)로 이동 
			if(param.equals("kakaoLog")) {
				System.out.println("카카오로 로그인 프로세스 실행");
				
				String email = req.getParameter("email");
				String name = req.getParameter("name");
				
				req.setAttribute("email", email);
				req.setAttribute("name", name);
				
				req.getRequestDispatcher("index.jsp?content=regi").forward(req, resp);
				
			}//end login

		//TODO 이메일 가져오기
		if(param.equals("getEmail")) {
		
		}//end getEmail
		
//TODO 아이디 가져오기(아이디체크용)
		if(param.equals("getFindID")) {
			
		}//end getFindID
		
//TODO 업데이트 
		if(param.equals("update")) {
			
		}//end update
		
//TODO 로그아웃
		if(param.equals("logout")) {
			boolean b = false;
			
			HttpSession session = req.getSession();
			MemberDto mem = (MemberDto) session.getAttribute("login");
			System.out.println("아이디1 : "+ mem.getMyid());
			
			session.invalidate();
			
			session = req.getSession();
			
			
			if((MemberDto)session.getAttribute("login") != mem) {
				System.out.println("로그아웃완료");
				b = true;
			}
			
			req.setAttribute("outb", b);
			req.getRequestDispatcher("index.jsp").forward(req, resp);;
			
		}//end logout
		
		
		
		
	}

	
}
