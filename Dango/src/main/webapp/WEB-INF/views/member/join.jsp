<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>당고 : 회원가입</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/media.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</head>
<body class="container">
<script>
$(function(){
	$("#cencleBtn").click(function(){
		location.href="${path}";
	});
});
</script>
<header>
	<div class="text-center">
		<a href="${path}"><img alt="Dango" src="${path}/resources/img/Logo.png"></a>
	</div>
</header>

<form class="form-horizonatal">
	<div class="form-group">
		<input type="text" class="form-control form-control-lg" id="id" placeholder="아이디">
		<input type="button" class="btn btn-primary" id="idCheck" value="중복확인">
	</div>
	<div class="form-group">
		<input type="password" class="form-control form-control-lg" id="pw" placeholder="비밀번호">
	</div>
	<div class="form-group">
		<input type="text" class="form-control form-control-lg" id="name" placeholder="이름">
	</div>
	<div class="form-group">
		<input type="text" class="form-control form-control-lg" id="phone" placeholder="휴대폰">
	</div>
	<div class="form-group">
		<input type="text" class="form-control form-control-lg" id="mail" placeholder="메일">
		<input type="button" class="btn btn-primary" id="mailSend" value="인증번호 받기">
	</div>
	<div class="form-group">
		<input type="text" class="form-control form-control-lg" id="mailCheck" placeholder="인증번호 입력">
	</div>
	<div class="form-group">
		<input type="text" class="form-control form-control-lg" id="address" placeholder="주소">
	</div>
	<div class="form-group">
	대대 <select id="bigpoint" name="bigpoint">
			<option value="0">0</option>
			<option value="5">5</option>
			<option value="8">8</option>
			<option value="10">10</option>
			<option value="12">12</option>
			<option value="15">15</option>
			<option value="18">18</option>
			<option value="20">20</option>
			<option value="22">22</option>
			<option value="25">25</option>
			<option value="28">28</option>
			<option value="30">30</option>
	</select>
	</div>
	<div class="form-group">
	중대 <select id="bigpoint" name="bigpoint">
			<option value="0">0</option>
			<option value="50">50</option>
			<option value="80">80</option>
			<option value="100">100</option>
			<option value="120">120</option>
			<option value="150">150</option>
			<option value="180">180</option>
			<option value="200">200</option>
			<option value="220">220</option>
			<option value="250">250</option>
			<option value="280">280</option>
			<option value="300">300</option>
	</select>
	</div>
	<div class="form-group">
		<input type="button" class="btn btn-primary btn-lg" id="joinBtn" value="회원가입">
		<input type="button" class="btn btn-primary btn-lg" id="cencleBtn" value="취소">
	</div>
</form>

<footer>

</footer>
</body>
</html>