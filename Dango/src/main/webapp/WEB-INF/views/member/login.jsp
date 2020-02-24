<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>당고 : 로그인</title>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/media.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script>
$(function(){
	$("#loginBtn").click(function(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		
		if(id == ""){
			alert("아이디를 입력해주세요");
			$("#id").focus();
			return;
		} else if(pw == ""){
			alert("패스워드를 입력해주세요");
			$("#pw").focus();
			return;
		}
		$.ajax({
			url : '${path}/member/loginCheck',
			type : 'post',
			data : 'id='+id+'&pw='+pw,
			success : function(data){
				if(data == "O"){
					location.href='${path}';
				} else if(data == "X"){
					alert("아이디 혹은 패스워드가 틀립니다.");
					location.reload();
				} else{
					alert("로그인 에러 관리자에게 문의.")
				}
			}
		});
	});	
});
</script>
</head>
<body class="container">
<header>
	<div class="text-center">
		<a href="${path}"><img alt="Dango" src="${path}/resources/img/Logo.png"></a>
	</div>
</header>

<form class="form-horizontal">
	<div class="form-group">
		<input type="text" class="form-control form-control-lg" id="id" placeholder="아이디">
	</div>
	<div class="form-group">
		<input type="password" class="form-control form-control-lg" id="pw" placeholder="비밀번호">
	</div>
	<div class="form-group">
		<input type="button" class="btn btn-primary btn-lg btn-block" id="loginBtn" value="로그인">
	</div>
	<hr>
	<div class="form-group text-right">
		<a href="">ID/PW 찾기</a>
		<a href="${path}/member/join.do">회원가입</a>
	</div>
</form>

<footer>
</footer>

</body>
</html>