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
<script>
$(function(){
	$("#inputId").hide();
	$("#idCheck").hide();
	$("#idCheck2").hide();
	$("#idCheck3").hide();
	$("#inputPw").hide();
	$("#pwCheck").hide();
	$("#inputName").hide();
	$("#inputPhone").hide();
	$("#phoneCheck").hide();
	$("#inputMail").hide();
	$("#mailCheck").hide();
	$("#mailCheck2").hide();
	$("#mailSend").hide();
	$("#inputMailNum").hide();
	$("#mailNumCheck").hide();
	$("#inputAddress").hide();
	
	var idCheck;	// 중복확인한 아이디
	var pwCheck;	// 유효성 검사가 된 패스워드
	var phoneCheck; // 유효성 검사가 된 전화번호
	var mailCheck;  // 중복확인 및 인증 메일
	var mailNumCheck// 메일 인증번호
	
	// 아이디 중복확인 및 유효성 검사
	$("#id").keyup(function(){
		var id = $("#id").val();
		
		if(id == ""){
			$("#inputId").show();
			$("#idCheck").hide();
			$("#idCheck2").hide();
			$("#idCheck3").hide();
			return;
		}
		
		$.ajax({
			url : '${path}/member/idCheck',
			type : 'post',
			data : 'id='+id,
			success : function(data){
				if(data == "0"){
					idCheck = id;
					$("#inputId").hide();
					$("#idCheck").show();
					$("#idCheck2").hide();
					$("#idCheck3").hide();
					return;
				} else if(data == "1"){
					$("#inputId").hide();
					$("#idCheck").hide();
					$("#idCheck2").show();
					$("#idCheck3").hide();
					return;
				} else if(data == "X"){
					$("#inputId").hide();
					$("#idCheck").hide();
					$("#idCheck2").hide();
					$("#idCheck3").show();
					return;
				}
			}
		});
	});
	
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
	
	
	// 휴대폰번호 유효성 검사
	$("#phone").keyup(function(){
		var phone = $("#phone").val();
		
		if(phone == ""){
			$("#inputPhone").show();
			$("#phoneCheck").hide();
			return;
		}
		
		$.ajax({
			url : '${path}/member/phoneCheck',
			type : 'post',
			data : 'phone='+phone,
			success : function(data){
				if(data == "O"){
					phoneCheck = phone;
					$("#inputPhone").hide();
					$("#phoneCheck").hide();
					return;
				} else if(data == "X"){
					$("#inputPhone").hide();
					$("#phoneCheck").show();
					return;
				}
			}
		});
	});
	
	// 메일 중복확인 및 유효성 검사 후 인증번호 보내기
	$("#mailSendBtn").click(function(){
		var mail = $("#mail").val();
		
		if(mail == ""){
			$("#inputMail").show();
			$("#mailCheck").hide();
			$("#mailCheck2").hide();
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
					// 메일 인증번호 보내기
					$("#inputMail").hide();
					$("#mailCheck").hide();
					$("#mailCheck2").hide();
					$("#mailSend").show();
					$.ajax({
						url : '${path}/member/mailSend',
						type : 'post',
						data : 'mail='+mail,
						success : function(data){
							mailCheck = mail;
							mailNumCheck = data;
						}
					});
				} else if(data == "1"){
					$("#inputMail").hide();
					$("#mailCheck").show();
					$("#mailCheck2").hide();
					$("#mailSend").hide();
					return;
				} else if(data == "X"){
					$("#inputMail").hide();
					$("#mailCheck").hide();
					$("#mailCheck2").show();
					$("#mailSend").hide();
					return;
				}
			}
		});
	});
	
	// 인증번호 입력
	$("#mailNum").keyup(function(){
		var mailNum = $("#mailNum").val();
		
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
	
	// 주소 입력
	$("#address").keyup(function(){
		var name = $("#address").val();
		
		if(name == ""){
			$("#inputAddress").show();
			return;
		} else{
			$("#inputAddress").hide();
			return;
		}
	});

	// 회원가입
	$("#joinBtn").click(function(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		var name = $("#name").val();
		var phone = $("#phone").val();
		var mail = $("#mail").val();
		var mailNum = $("#mailNum").val();
		var address = $("#address").val();
		var bp = $("#bigpoint").val();
		var mp = $("#middlepoint").val();
		
		if(id == "" || id != idCheck){
			$("#id").focus();
			return;
		} else if(pw == "" || pw != pwCheck){
			$("#pw").focus();
			return;
		} else if(name == ""){
			$("#name").focus();
			$("#inputName").show();
			return;
		} else if(phone == "" || phone != phoneCheck){
			$("#phone").focus();
			return;
		} else if(mail == "" || mail != mailCheck){
			$("#mail").focus();
			return;
		} else if(mailNum == ""){
			$("#mailNum").focus();
			$("#inputMailNum").show();
			return;
		} else if(mailNum != mailNumCheck){
			$("#mailNum").focus();
			$("#mailNumCheck").show();
			return;
		} else if(address == ""){
			$("#address").focus();
			$("#inputAddress").show();
			return;
		}
		
		$.ajax({
			url : '${path}/member/join',
			type : 'post',
			data : 'id='+id+'&pw='+pw+'&name='+name+'&phone='+phone+'&mail='+mail+'&address='+address+'&bp='+bp+'&mp='+mp,
			success : function(data){
				location.href="${path}/member/joinSuccess.do";
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
			<p id="idCheck" style="color:blue">사용 가능한 아이디입니다.</p>
			<p id="idCheck2" style="color:red">이미 존재하는 아이디입니다.</p>
			<p id="idCheck3" style="color:red">5~15자의 영문 소문자, 숫자만 입력이 가능합니다.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="password" class="form-control form-control-lg" id="pw" maxlength="15" placeholder="비밀번호">
			<p id="inputPw" style="color:red">비밀번호를 입력해주세요.</p>
			<p id="pwCheck" style="color:red">8~15자의 대소문자, 숫자, 특수문자를 하나 이상씩 사용하세요.</p>
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
			<input type="text" class="form-control form-control-lg" id="phone" maxlength="11" placeholder="휴대폰 번호">
			<p id="inputPhone" style="color:red">휴대폰 번호 입력해주세요.</p>
			<p id="phoneCheck" style="color:red">하이픈('-')을 제외한 11개의 숫자만 입력해주세요.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="text" class="form-control form-control-lg" id="mail" maxlength="50" placeholder="메일">
			<p id="inputMail" style="color:red">메일 아이디를 입력해주세요.</p>
			<p id="mailCheck" style="color:red">이미 가입한 메일입니다.</p>
			<p id="mailCheck2" style="color:red">메일 형식이 잘못되었습니다.<br>소문자, 숫자, 특수문자('-','_') 가능.</p>
			<p id="mailSend" style="color:blue">인증번호가 전송되었습니다.</p>
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="button" class="btn btn-primary btn-block btn-lg" id="mailSendBtn" value="인증번호 받기">
		</div>
	</div>
	<div class="form-group">
		<div class="col-lg-10">
			<input type="text" class="form-control form-control-lg" id="mailNum" maxlength="4" placeholder="인증번호 입력">
			<p id="inputMailNum" style="color:red">인증번호를 입력해주세요.</p>
			<p id="mailNumCheck" style="color:red">인증번호가 틀렸습니다.</p>
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
	<div class="form-group text-center">
		<div class="col-lg-10">
			<input type="button" class="btn btn-primary btn-lg" id="joinBtn" value="회원가입">
		</div>
	</div>
</form>

<footer>

</footer>
</body>
</html>