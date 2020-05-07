<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/member/member.css"  type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap" rel="stylesheet">
	<title>#회원가입</title>
</head>
<body>
	<header>
		<c:import url="../common/boardCommon.jsp"/>
		<script>
			$('#bName').text('회원') ;
			$('#bNameAfter').text('가입') ;
		</script>
	</header>
	<div class="wrapper">
		<div class="JoinSelectArea">
			<table>
				<tr>
					<td rowspan="2">
						<div id="joinBtnArea">
							<h3>일반 계정으로 가입하실래요?</h3>
							<p id="joinAreaInfo" style="width: 90%; margin-left: 5%;">
								아이디와 비밀번호, 이메일 인증을 직접 해서 가입하실 수 있습니다. 비밀번호 변경을 하실 수 있으며, 로그인하실 때도 아이디와 비밀번호를 직접 입력하셔야 되요!</p>
							<img src="${contextPath}/resources/images/Logo.png" align="middle" style="width: 70%;"><br><br>
							<c:url var="join" value="joinNormalView.me" />
							<input type="button" id="buttonB3" onclick="location.href='${join}'" value="일반 회원으로 가입하기">
						</div>
					</td>
					<td rowspan="2">
						<div id="joinBtnArea" style="margin-left: 0%;">
							<h3 style="margin-left: 5%;">구글 계정으로 가입하실래요?</h3>
							<p id="joinAreaInfo">
								구글 계정으로 가입하실 수 있습니다. 추가정보를 입력하셔야 되지만 아이디, 비밀번호, 이메일은 예외에요! (자동으로 입력됨) 또한 구글로 바로 로그인하실 수도 있어요!</p>
							<img src="${contextPath}/resources/images/google_icon.png" id="googleIcon2" align="middle" style="margin-left: 5%;"><br><br>
							<c:url var="join" value="joinGoogleView.me" />
							<input type="button" id="buttonB3" onclick="location.href='${join}'" value="구글 회원으로 가입하기" style="margin-left: 5%;">
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>