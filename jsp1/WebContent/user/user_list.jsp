<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%

	String url = "jdbc:mysql://localhost:3306/jsp_study";
	String id = "root";
	String pwd = "0lrjsahfmrpTwl";
	Connection con;
	Statement st;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection(url,id,pwd);
		System.out.println("연결성공");
		st = con.createStatement();
		ResultSet rs= st.executeQuery("select * from user");
		out.println("<table border='1'>");		
		while(rs.next()) {
			String user_no = rs.getString("user_no");
			String user_id = rs.getString("id");
			String name = rs.getString("name");
			out.println("<td>번호 : "+ user_no +"</td><td> 아이디 : "+ user_id +"</td><td> 이름 : "+name+"</td><tr>" );
		}
		out.println("</table>");
	} catch (ClassNotFoundException e){
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}





 %>
