<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
	<link rel="stylesheet" href="${contextPath}/resources/css/member/member.css"  type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap" rel="stylesheet">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<title>#취미텃밭</title>
</head>
<body>
	<header>
		<c:import url="../common/boardCommon.jsp"/>
		<script>
			$('#bName').text('비밀번호 ') ;
			$('#bNameAfter').text('찾기') ;
		</script>
	</header>
	<div class="wrapper">
		<c:url var="login" value="loginView.me" />
		<form id="pwdFindForm" method="post">
			<br><br><h2>비밀번호 찾기</h2><span>가입할 때 입력하셨던 아이디와 이메일을 입력하시면 이메일로 임시 비밀번호를 보내드립니다!</span><br><br><br>
			<table style="margin-left: 20%;">
				<tr>
					<th><div id="buttonB1" style="margin-left: 20%;">아이디</div></th>
					<td><input type="text" id="userId" name="userId" class="findInput" placeholder="&nbsp;&nbsp;아이디 입력"></td>
				</tr>
				<tr>
					<th><div id="buttonB1" style="margin-left: 20%;">이름</div></th>
					<td><input type="text" id="userName" name="userName" class="findInput" placeholder="&nbsp;&nbsp;이름 입력"></td>
				</tr>
				<tr>
					<th><div id="buttonB1" style="margin-left: 20%;">이메일</div></th>
					<td><input type="email" id="email" name="email" class="findInput" placeholder="&nbsp;&nbsp;이메일 입력"></td>
				</tr>
				<tr>
					<td colspan="2"><br><input type="button" id="buttonB" value="비밀번호 찾기" onclick="pwdFindFormSubmit();" style="margin-left: -1.5%; font-weight: bold; width: 13%;"></td>
				</tr>
			</table>
		</form>
		<script>
			function pwdFindFormSubmit() {
				var userId = $('#userId').val() ;
				var userName = $('#userName').val() ;
				var email = $('#email').val() ;
				$.ajax({
					url: 'findPwdVal.me',
					data: {userId:userId, userName:userName, email:email},
					success: function(data) {
						if(data != "0") {
							swal({
								title: "성공하였습니다!! 😊",
								text: "임시 비밀번호를 메일로 전송했습니다. 로그인을 진행해 주세요.",
								icon: "success"
							}).then(function() {
								location.href = "${login}" ;
							}) ;
						} else {
							swal({
								title: "실패..! 😥",
								text: "존재하지 않는 회원입니다. 다시 시도해 주세요!",
								icon: "error"
							}) ;
						}
					}
				}) ;
			}
			
			$('#userName').keydown(function(key) {
				if(key.keyCode == 13) {
					$('#buttonB').click() ;
				}
			}) ;
			
			$('#email').keydown(function(key) {
				if(key.keyCode == 13) {
					$('#buttonB').click() ;
				}
			}) ;
		</script>
	</div>
</body>
</html>