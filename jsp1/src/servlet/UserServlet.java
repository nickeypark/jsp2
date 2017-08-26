package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import common.DBconnector;
import service.UserService;
import service.impl.UserServiceImpl;

public class UserServlet extends HttpServlet{
	
	private UserService us = new UserServiceImpl();	
	
	public void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
	
	String command = request.getParameter("command");
	if(command==null) {
		doProcess(resp,"잘못된 요청 입니다.");
	}else if(command.equals("signin")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String[] hobbies = request.getParameterValues("hobby");
			String hobby ="";
				for(String h:hobbies){ 
					hobby += h + ",";	
				}
			hobby = hobby.substring(0,hobby.length()-1);
			Map<String, String> hm = new HashMap<String, String>();
			hm.put("id", id);
			hm.put("pwd", pwd);
			hm.put("name", name);
			hm.put("hobby", hobby);
			String result = us.insertUser(hm);
			doProcess(resp,result);		
		}else if(command.equals("login")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			Map<String, String> hm = new HashMap<String, String>();
			hm.put("id", id);
			hm.put("pwd", pwd);
			Map<String, String> resultMap = us.selectUser(hm);
			if (resultMap.get("id")!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", resultMap);	
			}
		doProcess(resp,resultMap.get("result"));
		}else if(command.equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			resp.sendRedirect("/login.jsp");
		}else if(command.equals("delete")) {
			String user_no = request.getParameter("user_no");
			Map<String, String> hm = new HashMap<String, String>();
			hm.put("user_no", user_no);
			int rCnt = us.deleteUser(hm);
			String result = "회원탈퇴에 실패 하셨습니다.";
			if(rCnt==1) {
				result="회원탈퇴에 성공 하셨습니다.";
				result +="<script>";
				result +="alert('회원 탈퇴에 성공 하셨습니다.');";
				result +="</script>";
			}
		}
	}	
	
	public void doGet(HttpServletRequest request, HttpServletResponse resp) 
			throws ServletException, IOException {
		Map<String, String[]> m = request.getParameterMap();
		Iterator<String> it = m.keySet().iterator();
		String result = "두겟 호툴 했습니다.~~~";
			while(it.hasNext() ) {
				String key = it.next();
				result += key + ":" + request.getParameter(key);
			}		

		}
	
	public void doProcess(HttpServletResponse resq, String writeStr)
			throws IOException {
		resq.setContentType("text/html; charset = UTF-8");
		PrintWriter out = resq.getWriter();
		out.println(writeStr);
	}
}	
	
	
	
	

	
