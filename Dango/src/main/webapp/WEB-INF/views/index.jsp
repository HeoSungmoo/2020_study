<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>당고</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/media.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body>
<header>
	<div class="text-center">
		<a href="${path}"><img alt="Dango" src="${path}/resources/img/Logo.png"></a>
	</div>
</header>

<div>
	<span>
	<c:choose>
		<c:when test="${sessionScope.id == null}">
			<a href="${path}/member/login.do">로그인</a>
			<a href="${path}/member/join.do">회원가입</a>
			<a href="">id/pw찾기</a>
		</c:when>
		<c:otherwise>
			<a href="">${sessionScope.id}님</a>
			<a href="">포인트</a>
			<a href="member/logout">로그아웃</a>
		</c:otherwise>
	</c:choose>
	</span>
	<span>
		<a href="">새소식</a>
		<a href="">이용안내</a>
		<a href="">경기 규칙 과 치는법</a>
		<a href="">당구장</a>
		<a href="">상대 찾기</a>
		<a href="">게시판</a>
	</span>
</div>

<footer>

</footer>
</body>
</html>