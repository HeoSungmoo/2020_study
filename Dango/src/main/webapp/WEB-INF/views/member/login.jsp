<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당고 : 로그인</title>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"> </script>
<script>
$(function(){
	$("#loginBtn").click(function(){
		var memberId = $("#id").val();
		var memberPw = $("#pw").val();
		
		if(memberId == ""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return;
		} else if(memberPw == ""){
			alert("패스워드를 입력해주세요");
			$("#pw").focus();
			return;
		}
		$.ajax({
			url : '${path}/member/loginCheck',
			type : 'post',
			data : 'memberId='+memberId+'&MemberPw='+memberPw,
			success : function(data){
				if(data == "O"){
					alert("로그인 성공");
				} else if(data == "X"){
					alert("아이디 혹은 패스워드가 틀립니다.");
				} else{
					alert("로그인 에러 관리자에게 문의.")
				}
			}
		});
	});	
});
</script>
</head>
<body>
<header>
	<a href="${path}"><img alt="Dango" src="${path}/img/Logo.png"></a>
</header>

<input type="text" id="id" name="id">
<input type="password" id="pw" name="pw">
<input type="button" id="loginBtn" name="loginBtn" value="로그인">
<a href="">ID/PW 찾기</a>

<footer>
</footer>

</body>
</html>