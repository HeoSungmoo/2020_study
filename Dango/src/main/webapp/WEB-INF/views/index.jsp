<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dango</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<header>
	<img alt="Dango" src="${path}/img/Logo.png">
</header>
<P>  The time on the server is ${serverTime}. </P>
<a href="member/login">로그인</a>
<input type="text" value="">
<footer>

</footer>
</body>
</html>