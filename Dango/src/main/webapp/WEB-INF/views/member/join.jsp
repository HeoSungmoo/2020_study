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
<link rel="stylesheet" href="${path}/resources/css/dango.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/bootstrap.js"></script>
</head>
<body class="container">
<script>
$(function(){
	$("#inputId").hide();
	$("#idCheck").hide();
	$("#idCheck2").hide();
	$("#inputPw").hide();
	$("#inputName").hide();
	$("#inputPhone").hide();
	$("#phoneCheck").hide();
	$("#inputMail").hide();
	$("#inputMailCheck").hide();
	$("#inputAddress").hide();
	
	var idCheck;	// 중복확인한 아이디
	var mailCheck;  // 중복확인 및 인증된 메일
	
	$("#cencleBtn").click(function(){
		location.href="${path}";
	});
	
	// 아이디 체크
	$("#idCheckBtn").click(function(){
		$("#inputId").hide();
		$("#idCheck").hide();
		$("#idCheck2").hide();
		
		var id = $("#id").val();
		
		if(id == ""){
			$("#inputId").show();
			$("#id").focus();
			return;
		}
		
		$.ajax({
			url : '${path}/member/join/idCheck',
			type : 'post',
			data : 'id='+id,
			success : function(data){
				if(data == "O"){
					idCheck = id;		// 중복확인한 아이디값 저장
					$("#idCheck").show();
				} else if(data == "X"){
					$("#idCheck2").show();
					$("#id").focus();
				}
			}
		});
	});
	
	// 휴대폰번호 입력 하이픈('-') 제외 도움말
	$("#phone").focus(function(){
		$("#phoneCheck").show();
	});
	$("#phone").blur(function(){
		$("#phoneCheck").hide();
	});
	
	// 회원가입
	$("#joinBtn").click(function(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		var name = $("#name").val();
		var phone = $("#phone").val();
		var mail = $("#mail").val();
		var address = $("#address").val();
		var bigpoint = $("#bigpoint").val();
		var middlepoint = $("#middlepoint").val();
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
		<div class="col-lg-10">
			<input type="text" class="form-control form-control-lg" id="id" maxlength="15" placeholder="아이디">
			<p id="inputId" style="color:red">아이디를 입력해주세요.</p>
			<p id="idCheck" style="color:blue">사용 가능한 아이디입니다.</p>
			<p id="idCheck2" style="color:red">이미 존재하는 아이디입니다.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="button" class="btn btn-primary btn-block btn-lg" id="idCheckBtn" value="중복확인">
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="password" class="form-control form-control-lg" id="pw" maxlength="15" placeholder="비밀번호">
			<p id="inputPw" style="color:red">비밀번호를 입력해주세요.</p>
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
			<input type="text" class="form-control form-control-lg" id="phone" maxlength="11" placeholder="휴대폰">
			<p id="inputPhone" style="color:red">휴대폰 번호 입력해주세요.</p>
			<p id="phoneCheck" style="color:blue">하이픈('-')을 제외한 숫자만 입력해주세요.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="text" class="form-control form-control-lg" id="mail" maxlength="50" placeholder="메일">
			<p id="inputMail" style="color:red">메일 아이디를 입력해주세요.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="button" class="btn btn-primary btn-block btn-lg" id="mailSendBtn" value="인증번호 받기">
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="text" class="form-control form-control-lg" id="mailCheck" maxlength="4" placeholder="인증번호 입력">
			<p id="inputMailCheck" style="color:red">인증번호를 입력해주세요.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="text" class="form-control form-control-lg" id="address" maxlength="50" placeholder="주소">
			<p id="inputAddress" style="color:red">주소를 입력해주세요.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
		대대 <select id="bigpoint">
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
	</div>
	<div class="form-group">
		<div class="col-lg-10">
		중대 <select id="middlepoint">
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
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="button" class="btn btn-primary btn-lg" id="joinBtn" value="회원가입">
			<input type="button" class="btn btn-primary btn-lg" id="cencleBtn" value="취소">
		</div>
	</div>
</form>

<footer>

</footer>
</body>
</html>