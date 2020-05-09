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
			$('#bName').text('비밀번호') ;
			$('#bNameAfter').text(' 변경') ;
		</script>
	</header>
	<div class="wrapper">
		<form id="myPwdForm" method="post">
			<script>
				$(document).ready(function() {
					$('#myPwdForm').attr('onSubmit', false) ;
					if("${loginUser.userId}" == "") {
						swal({
							title: '로그인이 필요한 페이지입니다.',
							text: '로그인 후에 이용해 주세요.',
							icon: 'error'
						}).then(function() {
							location.href="logout.me" ;
						}) ;
					}
				}) ;
			</script>
			<table id="myPwdTable">
				<tr>
					<td colspan="3">
						<br><br>
					</td>
				</tr>
				<tr>
					<th rowspan="2"><div id="buttonB_upPwd">기존 비밀번호</div></th>
					<td colspan="2">
						<input type="password" id="oldPwd" name="oldPwd" class="JoinInput" placeholder=" 비밀번호는 영어, 숫자로 구성되며, 8자 이상 16자 이내로 구성됩니다! 소문자와 대문자는 구분한답니다!" >
						<input type="hidden" id="isOldPwdUsable" value="emptyPwd">
					</td>
				</tr>
				<tr>
					<td colspan="2"><pre id="oldPwdCheck" style="text-align: right; color: red; margin-right: 8%;">기존에 사용하시던 비밀번호를 입력하세요.</pre></td>
				</tr>
				<tr>
					<th rowspan="2"><div id="buttonB_upPwd">신규 비밀번호</div></th>
					<td colspan="2">
						<input type="password" id="userPwd" name="userPwd" class="JoinInput" placeholder=" 비밀번호는 영어, 숫자로 구성되며, 8자 이상 16자 이내로 구성됩니다! 소문자와 대문자는 구분한답니다!" >
						<input type="hidden" id="isUserPwdUsable" value="emptyPwd">
					</td>
				</tr>
				<tr>
					<td colspan="2"><pre id="userPwdCheck" style="text-align: right; color: red; margin-right: 8%;">비밀번호를 입력하세요.</pre></td>
				</tr>
				<tr>
					<th rowspan="2"><div id="buttonB_upPwd">신규 비밀번호 확인</div></th>
					<td colspan="2">
						<input type="password" id="userPwd2" name="userPwd2" class="JoinInput" placeholder=" 상단의 [비밀번호]란과 동일하게 입력해 주세요!" >
						<input type="hidden" id="isUserPwd2Usable" value="emptyPwd">
					</td>
				</tr>
				<tr>
					<td colspan="2"><pre id="userPwd2Check" style="text-align: right; color: red; margin-right: 8%;">비밀번호 확인을 입력하세요.</pre></td>
				</tr>
				<tr>
					<td colspan="3">
						<br><div id="buttonG_upPwd" onclick="fn_checkWhenSubmit();">변경하기</div><br><br>
					</td>
				</tr>
			</table>
			<c:url var="logout" value="logout.me"/>
			<script>
				function fn_checkWhenSubmit() {
					checkPwd($('#oldPwd').val()) ;
					if($('#isOldPwdUsable').val()	== "truePwd" &&
					   $('#isUserPwdUsable').val()	== "truePwd" &&
					   $('#isUserPwd2Usable').val() == "truePwd") {
						var userPwd = $('#userPwd').val() ;
						$.ajax({
							url: 'changePwd.me',
							data: {userPwd:userPwd},
							success: function(data) {
								swal({
									title: '비밀번호 변경에 성공하였습니다! 😊',
									text: "다시 로그인해 주세요!",
									icon: "success"
								}).then(function() {
									location.href = "loginView.me" ;
								}) ;
							}
						}) ;
					} else {
						swal({
							title: "잘못 입력하셨습니다!",
							text:  "다시 한 번 확인하세요!",
							icon:  "error"
						}) ;
					}
				}
			</script>
			<script>
				function checkPwd(userPwd, string) {
					var reg = /[A-Za-z0-9]{8,16}/ ;
					$.ajax({
						type : "POST",
						url: 'checkPwd.me',
						data: {userPwd:userPwd},
						success: function(data) {
							if(string == "old") {
								if(data == "false") {
									$('#oldPwdCheck').html("잘못된 비밀번호입니다.") ;
			 						$('#oldPwdCheck').css('color', 'red') ;
			 						$('#isOldPwdUsable').val("falsePwd") ;
								} else {
									$('#oldPwdCheck').html("비밀번호가 일치합니다.") ;
			 						$('#oldPwdCheck').css('color', 'green') ;
			 						$('#isOldPwdUsable').val("truePwd") ;
								}
							} else {
								if(reg.test(userPwd)) {
									if(data == "false") {
										$('#userPwdCheck').html("사용 가능한 비밀번호입니다.") ;
										$('#userPwdCheck').css('color', 'green') ;
										$('#isUserPwdUsable').val("truePwd") ;
									} else {
										$('#userPwdCheck').html("잘못된 비밀번호입니다.") ;
				 						$('#userPwdCheck').css('color', 'red') ;
				 						$('#isUserPwdUsable').val("falsePwd") ;
									}
								} else {
									$('#userPwdCheck').html("잘못된 비밀번호입니다.") ;
			 						$('#userPwdCheck').css('color', 'red') ;
			 						$('#isUserPwdUsable').val("falsePwd") ;
								}
							}
						}
					}) ;
				}
				
				// 비밀번호 변경 시 검사
				$('#oldPwd').on('keyup', function() {
					$oldPwd = $('#oldPwd').val() ;
					if($oldPwd.trim().length == 0) {
						$('#oldPwdCheck').html("기존에 사용하시던 비밀번호를 입력하세요.") ;
						$('#oldPwdCheck').css('color', 'gray') ;
						$('#isOldPwdUsable').val("emptyPwd") ;
					} else {
						checkPwd($oldPwd, "old") ;
					}
				}) ;
				

				// 비밀번호 변경 시 검사
				$('#userPwd').on('keyup', function() {
					var $userPwd = $('#userPwd').val() ;
					var reg = /[A-Za-z0-9]{8,16}/ ;
					if($userPwd.trim().length == 0) {
						$('#userPwdCheck').html("비밀번호를 입력하세요.") ;
						$('#userPwdCheck').css('color', 'red') ;
						$('#isUserPwdUsable').val("emptyPwd") ;
					} else {
						checkPwd($userPwd, "asd") ;
					}
				}) ;
				
				// 비밀번호 확인란 변경 시 검사
				$('#userPwd2').on('keyup', function() {
					var $userPwd  = $('#userPwd').val() ;
					var $userPwd2 = $('#userPwd2').val() ;
					if($userPwd2.trim().length == 0) {
						$('#userPwd2Check').html("비밀번호 확인을 입력하세요.") ;
						$('#userPwd2Check').css('color', 'red') ;
						$('#isUserPwd2Usable').val("emptyPwd") ;
					} else if($userPwd2 == $userPwd) {
						$('#userPwd2Check').html("비밀번호가 일치합니다.") ;
						$('#userPwd2Check').css('color', 'green') ;
						$('#isUserPwd2Usable').val("truePwd") ;
					} else {
						$('#userPwd2Check').html("비밀번호가 다릅니다.") ;
						$('#userPwd2Check').css('color', 'red') ;
						$('#isUserPwd2Usable').val("falsePwd") ;
					}
				}) ;
				
				$('.JoinInput').keydown(function(key) {
					if(key.keyCode == 13) {
						$('#buttonG_upPwd').click() ;
					}
				}) ;
			</script>
		</form>
	</div>
</body>
</html>