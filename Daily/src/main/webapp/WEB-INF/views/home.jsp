<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>daily - 오늘의 쇼핑</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>
<header><%@ include file="include/header.jsp" %></header>
<div>
	<a href="${path}/member/login.do">로그인</a>
</div>
<footer><%@ include file="include/footer.jsp" %></footer>
</body>
</html>