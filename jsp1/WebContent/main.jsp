<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<title>Insert title here</title>
</head>
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
			return;
		}
		this.form.submit();
		//alert(this.value); //this부터는 자바스크립트 입니다.
	})
})
</script>
<body>
<% 
if(user!=null){	
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