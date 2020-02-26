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
<link rel="stylesheet" href="${path}/resources/css/dango.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/bootstrap.js"></script>
<script>

$(function(){
	$("#inputId").hide();
	$("#inputPw").hide();
	$("#inputIdPw").hide();
	
	// 로그인
	$("#loginBtn").click(function(){
		$("#inputId").hide();
		$("#inputPw").hide();
		$("#inputIdPw").hide();
		
		var id = $("#id").val();
		var pw = $("#pw").val();
		
		if(id == ""){
			$("#inputId").show();
			return;
		} else if(pw == ""){
			$("#inputPw").show();
			return;
		}
		
		$.ajax({
			url : '${path}/member/loginCheck',
			type : 'post',
			data : 'id='+id+'&pw='+pw,
			success : function(data){
				if(data == "1"){
					location.href='${path}';
				} else if(data == "0"){
					$("#inputIdPw").show();
				} else{
					alert("로그인 에러 관리자에게 문의.");
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
		<div class="col-lg-10">
			<input type="text" class="form-control form-control-lg" id="id" maxlength="15" placeholder="아이디">
			<p id="inputId" style="color:red">아이디를 입력해주세요.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="password" class="form-control form-control-lg" id="pw" maxlength="15" placeholder="비밀번호">
			<p id="inputPw" style="color:red">비밀번호를 입력해주세요.</p>
			<p id="inputIdPw" style="color:red">아이디 또는 비밀번호가 틀렸습니다.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="button" class="btn btn-primary btn-lg btn-block" id="loginBtn" value="로그인">
		</div>
	</div>
	<hr>
	<div class="form-group text-right">
		<div class="col-lg-10">
			<a href="${path}/member/findId.do">아이디 찾기</a>
			<a href="">비밀번호 찾기</a>
			<a href="${path}/member/join.do">회원가입</a>
		</div>
	</div>
</form>

<footer>
</footer>

</body>
</html>