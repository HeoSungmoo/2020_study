<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당고 : 로그인</title>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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