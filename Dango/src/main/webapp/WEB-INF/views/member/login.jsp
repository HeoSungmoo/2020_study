<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<%@ include file="../include/header.jsp" %>
</header>

<form method="post" action="/member/login">
<input type="text" id="id" name="id">
<input type="password" id="pw" name="pw">
<input type="submit" id="loginBtn" name="loginBtn">
<a href="">ID/PW 찾기</a>
</form>
<footer>
	<%@ include file="../include/footer.jsp" %>
</footer>
</body>
</html>