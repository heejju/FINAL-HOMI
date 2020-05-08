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
	<meta name="google-signin-client_id" content="1039608716257-rpi2mbri0nh18klpqq0r99ar6g0gh719.apps.googleusercontent.com">
</head>
<body>
	<header>
		<c:import url="../common/boardCommon.jsp"/>
		<script>
			$('#bName').text('로그인') ;
			$('#bNameAfter').css('display','none') ;
		</script>
	</header>
	<div class="wrapper">		
		<form id="loginForm" method="post">
			<div>
				<br><br><h2>일반 정보로 로그인</h2>
				<table id="loginTable">
					<tr>
						<th><div id="buttonB1">아이디</div></th>
						<td><input type="text" id="userId" name="userId" class="loginInput"></td>
					</tr>
					<tr>
						<th><div id="buttonB1">비밀번호</div></th>
						<td><input type="password" id="userPwd" name="userPwd" class="loginInput"></td>
					</tr>
				</table>
				<img src="${contextPath}/resources/images/login_icon.png" id="submitBtn">
			</div><br><hr><br><br>
			<div align="center">
				<h2>연결된 구글 계정으로 로그인</h2><span>Google 계정으로 가입한 분만 사용하실 수 있습니다.</span><br><br>
				<div class="google-btn-gh">
					<div id="googleLogin" class="g-signin2" data-onsuccess="onSignIn"></div>
				</div>
				<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
				<input type="hidden" id="googleId" name="googleId" value="#none"><!-- 값이 없을 때는 #none이 입력됨 -->
			</div><br><hr><br><br>
			<div align="center">
				<h2>어라... 정보가 기억이 나지 않나요?</h2>
				<div class="findingBox">
					<c:url var="findId"  value="findId.me" />
					<c:url var="findPwd" value="findPwd.me"/>
					<input type="button" id="buttonB" value="ID찾기" onclick="location.href='${findId}'" style="font-weight: bold;">
					<input type="button" id="buttonB" value="비밀번호 찾기" onclick="location.href='${findPwd}'" style="font-weight: bold;">
				</div>
			</div><br><hr><br><br>
			<div align="center">
				<h2>새로 가입하고 싶으시다구요?</h2>
				<c:url var="join" value="joinViewSelect.me"/>
				<input type="button" id="buttonB" onclick="location.href='${join}'" value="회원가입" style="font-weight: bold;">
			</div><br><hr>
		</form>
	</div>
	<script>
		$(function() {
			$('#submitBtn').mouseenter(function() {
				$(this).css('cursor','pointer') ;
			}).mouseout(function() {
				$(this).css('cursor','normal') ;
			}).click(function() {
				submitCheck() ;
			}) ;
		}) ;
		
		function submitCheck() {
			var userId  = $('#userId' ).val() ;
			var userPwd = $('#userPwd').val() ;
			$.ajax({
				type : "POST",
				url: 'login.me',
				data: {userId:userId, userPwd:userPwd},
				success: function(data) {
					console.log(data) ;
					if(data == "true") {
						location.href="${contextPath}" ;
					} else {
						swal({
							title: "잘못 입력하신 것 같은데요?",
							text: "다시 시도해 주세요!",
							icon: "warning",
							buttons: {confirm: true}
						}) ;
					}
				},
				error: function() {
					swal({
						title: "에러가 발생했어요!",
						text: "계속 이 문제가 발생한다면, 관리자에게 문의해 주세요!",
						icon: "error"
					}) ;
				}
			}) ;
		}
	</script>
	<script>
		var check = 1 ;
		
		// Google Login 시
		async function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile() ;
			gEmail = profile.getEmail() ;
			$('#googleId').val(gEmail) ;
			check = await checkIsNewGoogleId(gEmail) ;
			if(check == 0) {
			swal({
				title: "처음보는 분이시네요?",
				text: "해당 아이디로 가입하신 후에 이용하실 수 있어요! 가입하실래요?",
				icon: "warning",
				buttons: {
					cancel : "아니요!",
					defeat : {text:"네!", value:true},
				}
			}).then((value) => {
				if(value == true) {
					location.href = "joinGoogleView.me" ;
				} else {
					$('#googleId').val("#none") ;
					signOut() ;
				}
			})
			} else {
				swal({
					title: "해당 아이디로 로그인하시겠어요? 😊",
					text: "[네!] 버튼을 누르면 로그인하실 수 있어요!",
					buttons: {
						cancel : "아니요!",
						defeat : {text:"네!", value:true},
					}
				}).then((value) => {
					if(value == true) {
						$('#loginForm').attr('action', 'loginGoogle.me') ;
						$('#loginForm').submit() ;
					} else {
						signOut() ;
					}
				})
			}
		}
		
		function checkIsNewGoogleId(googleEmail) {
			var googleId = googleEmail ;
			return new Promise(function(resolve, reject) {
				$.ajax({
					url: 'dupGoogle.me',
					data: {googleId:googleId},
					success: function(data) {
						if(data == 'false') {
							resolve(1) ;
						} else {
							resolve(0) ;
						}
					}
				}) ;
			})
		}
		
		$('.loginInput').keydown(function(key) {
			if(key.keyCode == 13) {
				$('#submitBtn').click() ;
			}
		}) ;
		
		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance() ;
			auth2.signOut() ;
			auth2.disconnect();
		}
	</script>
</body>
</html>