<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당고 : 회원가입</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
</head>
<body>

<header>
	<a href="${path}"><img alt="Dango" src="${path}/img/Logo.png"></a>
</header>

	<input type="text" id="id" name="id" placeholder="아이디">
	<input type="password" id="pw" name="pw" placeholder="비밀번호">
	<input type="text" id="name" name="name" placeholder="이름">
	<input type="text" id="phone" name="phone" placeholder="휴대폰">
	<input type="text" id="mail" name="mail" placeholder="메일">
	<input type="text" id="address" name="address" placeholder="주소">
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
	
	<input type="button" id="joinBtn" name="joinBtn" value="회원가입">
	<input type="button" id="cencleBtn" name="cencleBtn" value="취소">
	 
<footer>

</footer>
</body>
</html>