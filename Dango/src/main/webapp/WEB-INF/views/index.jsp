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
<link rel="stylesheet" href="${path}/resources/css/dango.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/bootstrap.js"></script>
</head>
<body class="container">
<header>
	<div class="text-center">
		<a href="${path}"><img alt="Dango" src="${path}/resources/img/Logo.png"></a>
	</div>
</header>
<div class="form-group">
	<div class="col-lg-10">
		<span>
			<c:choose>
				<c:when test="${sessionScope.id == null}">
					<a href="${path}/member/login.do">로그인</a>
					<a href="${path}/member/join.do">회원가입</a>
					<a href="${path}/member/findId.do">아이디 찾기</a>
					<a href="${path}/member/findPw.do">비밀번호 찾기</a>
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
</div>

<footer>

</footer>
</body>
</html>