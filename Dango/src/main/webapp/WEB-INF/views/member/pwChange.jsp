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
<script>

$(function(){
	$("#inputPw").hide();
	$("#pwCheck").hide();
	$("#inputPw2").hide();
	$("#pw2Check").hide();
	
	var pwCheck; // 비밀번호 확인
	
	// 비밀번호 유효성 검사
	$("#pw").keyup(function(){
		var pw = $("#pw").val();
		
		if(pw == ""){
			$("#inputPw").show();
			$("#pwCheck").hide();
			return;
		}
		
		$.ajax({
			url : '${path}/member/pwCheck',
			type : 'post',
			data : 'pw='+pw,
			success : function(data){
				if(data == "O"){
					pwCheck = pw;	
					$("#pwCheck").hide();
					$("#inputPw").hide();
					return;
				} else if(data == "X"){
					$("#pwCheck").show();
					$("#inputPw").hide();
					return;
				}
			}
		});
	});
	
	// 비밀번호 확인 체크
	$("#pw2").keyup(function(){
		var pw2 = $("#pw2").val();
		
		if(pw2 == ""){
			$("#inputPw2").show();
			$("#pw2Check").hide();
			return;
		} else if(pw2 != pwCheck){
			$("#inputPw2").hide();
			$("#pw2Check").show();
			return;
		} else {
			$("#inputPw2").hide();
			$("#pw2Check").hide();
			return;
		}
	});
	
	$("#pwChangeBtn").click(function(){
		var pw = $("#pw").val();
		var pw2 = $("#pw2").val();
		
		if(pw == ""){
			$("#pw").focus();
			$("#inputPw").show();
			$("#pwCheck").hide();
			return;
		} else if(pw != pwCheck){
			$("#pw").focus();
			$("#pwCheck").show();
			$("#inputPw").hide();
			return;
		} else if(pw2 == ""){
			$("#pw2").focus();
			$("#inputPw2").show();
			$("#pw2Check").hide();
			return;
		} else if(pw2 != pw){
			$("#pw2").focus();
			$("#inputPw2").hide();
			$("#pw2Check").show();
			return;
		}
		
		$.ajax({
			url : '${path}/member/pwChange',
			type : 'post',
			data : 'pw='+pw,
			success : function(data){
				location.href = "${path}/member/pwChangeSuccess.do";
			}
		});
	});
});
</script> 
</head>
<body>
<header>
	<div class="text-center">
		<a href="${path}"><img alt="Dango" src="${path}/resources/img/Logo.png"></a>
	</div>
</header>
<form class="form-horizontal">
	<div class="form-group">
		<div class="col-lg-10">
			<input type="password" class="form-control form-control-lg" id="pw" placeholder="변경할 비밀번호">
			<p id="inputPw" style="color:red">비밀번호를 입력해주세요.</p>
			<p id="pwCheck" style="color:red">8~15자의 대소문자, 숫자, 특수문자를 하나 이상씩 사용하세요.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="password" class="form-control form-control-lg" id="pw2" placeholder="비밀번호 확인">
			<p id="inputPw2" style="color:red">비밀번호를 입력해주세요.</p>
			<p id="pw2Check" style="color:red">비밀번호가 다릅니다.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="button" class="btn btn-primary btn-lg btn-block" id="pwChangeBtn" value="변경">
		</div>
	</div>
</form>
<footer>

</footer>
</body>
</html>