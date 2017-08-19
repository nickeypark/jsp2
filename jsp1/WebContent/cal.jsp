<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int num1 = Integer.parseInt(request.getParameter("num1"));
String op = request.getParameter("op");
int num2 = Integer.parseInt(request.getParameter("num2"));
int totalnum = 0 ;

if(op.equals("+")){
	totalnum = num1 + num2 ; 
}else if(op.equals("-")){
	totalnum = num1 - num2 ;
}else if(op.equals("*")){
	totalnum = num1 * num2 ;
}else if(op.equals("/")){
	totalnum = num1 / num2 ;
}
List<String> list = new ArrayList<String>();
list.add("1");
for(int i=1, max=10; i<=max; i++){
	list.add("" + (i*10));
}
for(String str : list){
	out.println(str + "<br>");
}
Integer[] a = new Integer[5];
out.write(num1 + " " + op + " " + num2 + " = " + totalnum);
%>
</body>
</html>