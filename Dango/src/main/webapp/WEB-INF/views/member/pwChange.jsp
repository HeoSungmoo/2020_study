<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>당고 : 비밀번호 변경</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/dango.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/bootstrap.js"></script>
</head>
<body>
<header>
	<div class="text-center">
		<a href="${path}"><img alt="Dango" src="${path}/resources/img/Logo.png"></a>
	</div>
</header>
<input type="text" value="<% session.getAttribute("id"); %>">
<footer>

</footer>
</body>
</html>