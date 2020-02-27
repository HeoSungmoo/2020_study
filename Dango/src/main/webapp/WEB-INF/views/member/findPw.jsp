<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>당고 : 비밀번호 찾기</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${path}/resources/css/dango.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/bootstrap.js"></script>
<script>
$(function(){
	$("#inputId").hide();
	$("#idCheck").hide();
	$("#inputName").hide();	
	$("#inputMail").hide();
	$("#mailCheck").hide();
	$("#mailCheck2").hide();
	$("#mailCheck3").hide();
	$("#mailSend").hide();
	$("#inputMailNum").hide();
	$("#mailNumCheck").hide();
	$("#findPwCheck").hide();
	
	var mailCheck;
	var mailNumCheck;
	
	// 아이디 입력
	$("#id").keyup(function(){
		var id = $("#id").val();
		
		if(id == ""){
			$("#inputId").show();
			return;
		} else{
			$("#inputId").hide();
			return;
		}
	});
	
	// 이름 입력
	$("#name").keyup(function(){
		var name = $("#name").val();
		
		if(name == ""){
			$("#inputName").show();
			return;
		} else{
			$("#inputName").hide();
			return;
		}
	});
	
	// 이메일 유효성 검사 및 존재 여부 후 인증번호 보내기
	$("#mailNumSendBtn").click(function(){
		var mail = $("#mail").val();
		
		if(mail == ""){
			$("#inputMail").show();
			$("#mailCheck").hide();
			$("#mailCheck2").hide();
			$("#mailCheck3").hide();
			$("#mailSend").hide();
			$("#mail").focus();
			return;
		}
		
		$.ajax({
			url : '${path}/member/mailCheck',
			type : 'post',
			data : 'mail='+mail,
			success : function(data){
				if(data == "0"){
					$("#inputMail").hide();
					$("#mailCheck").show();
					$("#mailCheck2").hide();
					$("#mailCheck3").hide();
					$("#mailSend").hide();
					return;
				} else if(data == "1"){
					$("#inputMail").hide();
					$("#mailCheck").hide();
					$("#mailCheck2").hide();
					$("#mailCheck3").hide();
					$("#mailSend").show();
					mailCheck = mail;
					$.ajax({
						url : '${path}/member/mailNumSend',
						type : 'post',
						data : 'mail='+mail,
						success : function(data){
							mailNumCheck = data;
						}
					});
				} else if(data == "X"){
					$("#inputMail").hide();
					$("#mailCheck").hide();
					$("#mailCheck2").show();
					$("#mailCheck3").hide();
					$("#mailSend").hide();
					return;
				}
			}
		});
	});
	
	// 인증번호 입력
	$("#mailNum").keyup(function(){
		var mailNum = $("#mailNum");
		
		if(mailNum == ""){
			$("#inputMailNum").show();
			$("#mailNumCheck").hide();
			return;
		} else{
			$("#inputMailNum").hide();
			$("#mailNumCheck").hide();
			return;
		}
	});
	
	// 비밀번호 찾기
	$("#findPwBtn").click(function(){
		var id = $("#id").val();
		var name = $("#name").val();
		var mail = $("#mail").val();
		var mailNum = $("#mailNum").val();
		
		if(id == ""){
			$("#id").focus();
			$("#inputId").show();
			return;
		} else if(name == ""){
			$("#name").focus();
			$("#inputName").show();
			return;
		} else if(mail == ""){
			$("#mail").focus();
			$("#inputMail").show();
			$("#mailCheck").hide();
			$("#mailCheck2").hide();
			$("#mailCheck3").hide();
			$("#mailSend").hide();
			return;
		} else if(mail != mailCheck){
			$("#mail").focus();
			$("#inputMail").hide();
			$("#mailCheck").hide();
			$("#mailCheck2").hide();
			$("#mailCheck3").show();
			$("#mailSend").hide();
			return;
		} else if(mailNum == ""){
			$("#mailNum").focus();
			$("#inputMailNum").show();
			return;
		} else if(mailNum != mailNumCheck){
			$("#mailNum").focus();
			$("#mailNumCheck").show();
			return;
		}
		
		$.ajax({
			url : '${path}/member/findPw',
			type : 'post',
			data : 'id='+id+'&name='+name+'&mail='+mail,
			success : function(data){
				if(data == "X"){
					$("#findPwCheck").show();
				} else if(data == "O"){
					
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
			<p id="idCheck" style="color:red">5~15자의 영문 소문자, 숫자만 입력이 가능합니다.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="text" class="form-control form-control-lg" id="name" maxlength="7" placeholder="이름">
			<p id="inputName" style="color:red">이름를 입력해주세요.</p>
		</div>
	</div>
	
	<div class="form-group">
		<div class="col-lg-10">
			<input type="text" class="form-control form-control-lg" id="mail" maxlength="50" placeholder="메일">
			<p id="inputMail" style="color:red">메일 아이디를 입력해주세요.</p>
			<p id="mailCheck" style="color:red">아이디가 존재하지 않는 메일입니다.</p>
			<p id="mailCheck2" style="color:red">메일 형식이 잘못되었습니다.<br>소문자, 숫자, 특수문자('-','_') 가능.</p>
			<p id="mailCheck3" style="color:red">메일인증을 하십시오.</p>
			<p id="mailSend" style="color:blue">인증번호가 전송되었습니다.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="button" class="btn btn-primary btn-block btn-lg" id="mailNumSendBtn" value="인증번호 받기">
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="text" class="form-control form-control-lg" id="mailNum" maxlength="4" placeholder="인증번호">
			<p id="inputMailNum" style="color:red">인증번호를 입력해주세요.</p>
			<p id="mailNumCheck" style="color:red">인증번호가 틀렸습니다.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="button" class="btn btn-primary btn-block btn-lg" id="findPwBtn" value="찾기">
			<p id="findPwCheck" style="color:red">입력하신 정보가 틀립니다.</p>
		</div>
	</div>
</form>

<footer>
</footer>
</body>
</html>