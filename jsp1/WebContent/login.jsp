<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
</head>
	<script>
	function login(){
		var idObj = document.getElementById("id");
		alert(idObj.value);
		var pwdObj = document.getElementById("pwd");
		alert(pwdObj.value);
	}
	</script>
	<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="wbs-example-navbar-collapse-1" aria-expanded="false">
			<span class="icon-bar">111</span>
			<span class="icon-bar">222</span>
			<span class="icon-bar">333</span>
		</button>
		<a class="navbar-brand" href=""> JSP 게시판 웹 사이트</a>
		</div>
	</nav>
		안녕하세요!<br/> 처음 만나서 반갑습니다.<br/> 처음 만든 프로젝트 index.html 파일 입니다.<br/>
			<form action="/login_proc.jsp">
				아이디 : <input type="text" name="id1" id="id" ><br/>
				비밀번호 : <input type="password" name="pwd1" id="pwd" ><br/>
				<input type="submit" value="로그인">		
			</form>

	</body>
</html>