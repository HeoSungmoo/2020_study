<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당고</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>

<header>
	<a href="${path}"><img alt="Dango" src="${path}/img/Logo.png"></a>
</header>

<P>  The time on the server is ${serverTime}. </P>
<a href="member/login.do">로그인</a>
<a href="member/join.do">회원가입</a>

<footer>

</footer>
</body>
</html>