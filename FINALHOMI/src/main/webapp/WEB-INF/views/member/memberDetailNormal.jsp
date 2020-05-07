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
	<title>#내 정보 보기</title>
</head>
<body>
	<header>
		<c:import url="../common/boardCommon.jsp"/>
		<script>
			$('#bName').text('내 정보') ;
			$('#bNameAfter').text(' 보기') ;
		</script>
	</header>
	<div class="wrapper">
		<form id="myInfoForm">
			<script>
				$(document).ready(function() {
					if("${loginUser.userId}" == "") {
						swal({
							title: '로그인이 필요한 페이지입니다.',
							text: '로그인 후에 이용해 주세요.',
							icon: 'error'
						}).then(function() {							
							location.href="loginView.me" ;
						}) ;
					}
				}) ;
			</script>
			<table id="myInfoGTable">
				<tr><td><br><br></td></tr>
				<tr>
					<td rowspan="12">
						<img src="${contextPath}/resources/uploadFiles/${loginUser.changeName}" id="userImg_info1"><br>
						<h1>${loginUser.nickName}</h1><br>
						<input type="hidden" id="userId" name="userId" value="${loginUser.nickName}"><br>
						<textarea id="introduction" class="infoTextarea1" readonly>${loginUser.introduction}</textarea>	
					</td>
				</tr>
				<tr>
					<td colspan="3">asdasd</td>
				</tr>	
				<tr>
					<td colspan="3">asdasd</td>
				</tr>
				<tr>
					<td colspan="3">asdasd</td>
				</tr>
				<tr>
					<td colspan="3">asdasd</td>
				</tr>
			</table>
			<script>
				$(document).ready(function() {
					if("${loginUser.vipYn}" == "N")
						$('.vipTr').css('display', "none") ;
				})
			</script>
		</form>
	</div>
</body>
</html>