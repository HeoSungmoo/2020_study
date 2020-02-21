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

<table>
	<tr><td>아이디 : <input type="text" id="id" name="id"></td></tr>
	<tr><td>비밀번호 : <input type="password" id="pw" name="pw"></td></tr>
	<tr><td>이름 : <input type="text" id="name" name="name"></td></tr>
	<tr><td>휴대폰 번호 : <input type="text" id="phone" name="phone"></td></tr>
	<tr><td>이메일 : <input type="text" id="mail" name="mail"></td></tr>
	<tr><td>주소 : <input type="text" id="address" name="address"></td></tr>
	<tr><td>대대 점수 <input type="text" id="bigpoint" name="mail"></td></tr>
	<tr><td>중대 점수 <input type="text" id="id" name="mail"></td></tr>
</table>

<footer>

</footer>
</body>
</html>