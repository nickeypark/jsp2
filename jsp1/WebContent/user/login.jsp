<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<title>Insert title here</title>
</head>
<script src="/js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("input[type=button]").click(function(){
		var value = this.value;
		if(value=="회원탈퇴"){
			$("#command").val("delete");
		}else if(value=="회원정보수정"){
			location.href ="/user/updateUser.jsp";
			return;
		}else if(value=="회원리스트"){
			location.href ="/user/list.jsp";
		}
		this.form.submit();
		//alert(this.value); //this부터는 자바스크립트 입니다.
	})
})
</script>



<body>
<%=request.getParameter("id")%>
<%
Map<String,String> user =null;
if (session.getAttribute("user")!=null){
	user =(Map<String,String>)session.getAttribute("user");
}
if (user == null){
%>
			<form action="/login.user" method="post">
				아이디 : <input type="text" name="id" id="id" ><br/>
				비밀번호 : <input type="password" name="pwd" id="pwd" ><br/>
				<input type="hidden" name="command" value="login">
				<input type="submit" value="로그인">		
			</form>
<%
}else {
	String id = user.get("id");
	String userNo = user.get("user_no");
	String name = user.get("name");
	String hobby = user.get("hobby");
	String result = "<table border=1><tr><td>"+userNo + "번째로 가입하신</td></tr><tr><td>" + name + "님 반갑습니다. </td></tr> ";
	result += "<tr><td>" +name + "님의  id는 " + id + "이며 취미는 아래와 같습니다. </td></tr> ";
	result += "<tr><td>취미 : "+ hobby + "</td></tr></table>";
	out.println(result);
%>
<form action="some.user" method="post">
<input type="button" value="로그아웃">
<input type="button" value="회원탈퇴">
<input type="button" value="회원정보수정">
<input type="button" value="회원리스트">
<input type="hidden" name="command" id="command" value="logout" >
<input type="hidden" name="userNo" value="<%=userNo %>">
</form>
<%
}
%>
	</body>
</html>