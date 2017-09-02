<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<%
Map<String,String> user =null;
if (session.getAttribute("user")!=null){
	user =(Map<String,String>)session.getAttribute("user");
}
%>
<script>
function check(){
	var nameValue = $("#name").val().trim();
	var pwdValue = $("#pwd").val().trim();
	if(nameValue==""){
		alert("이름 좀 적자!!");
		$("#name").focus();
		return false;
	}
	
	if(pwdValue==""){
		alert("비밀번호 좀 적자!!");
		$("#pwd").val("");
		$("#pwd").focus();
		return false;
	}	
	return true;
}
</script>
		<form action="sigin.user" method="post" onsubmit="return check()">
			<table border="1">
				<tr>
					<td colspan="2" align="center">회원정보 수정</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" id="id" readonly value="<%=user.get("id")%>" ></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" name="pwd" id="pwd" value="<%=user.get("pwd")%>"></td>
				</tr>	
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name" value="<%=user.get("name")%>" ></td>
				</tr>			
				<tr>
					<td>취미</td>
					<td>
						수면<input type="checkbox" name="hobby" value="수면" <%=user.get("hobby").indexOf("수면")!=-1? "checked":"" %>>
						음악<input type="checkbox" name="hobby" value="음악" <%=user.get("hobby").indexOf("음악")!=-1? "checked":"" %>>
						영화<input type="checkbox" name="hobby" value="영화" <%=user.get("hobby").indexOf("영화")!=-1? "checked":"" %>>
						게임<input type="checkbox" name="hobby" value="게임" <%=user.get("hobby").indexOf("게임")!=-1? "checked":"" %>>
						요리<input type="checkbox" name="hobby" value="요리" <%=user.get("hobby").indexOf("요리")!=-1? "checked":"" %>>
						여행<input type="checkbox" name="hobby" value="여행" <%=user.get("hobby").indexOf("여행")!=-1? "checked":"" %>>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="회원 정보 수정">	</td>
				</tr>								
			</table>
			<input type="hidden" name="command" value="update">
			<input type="hidden" name="userNo" value="<%=user.get("user_no")%>">
		</form>
</body>
</html>