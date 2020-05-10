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
			$('#bName').text('내 정보') ;
			$('#bNameAfter').text(' 보기') ;
		</script>
	</header>
	<div class="wrapper">
		<form id="myInfoForm" method="post">
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
			<table id="myInfoTable">
				<tr>
					<td rowspan="4" style="border-right: 1px solid; width: 30%;">
						<script>
							$(document).ready(function() {
								if("${loginUser.introduction}" == "")
									$('#introduction').text("자기소개가 비었습니다.") ;
							}) ;
						</script>
						<img src="${contextPath}/resources/uploadFiles/${loginUser.changeName}" id="userImg_info1"><br>
						<h1>${loginUser.nickName}</h1><br>
						<input type="hidden" id="userId" name="userId" value="${loginUser.nickName}"><br>
						<textarea id="introduction" class="infoTextarea1" readonly>${loginUser.introduction}</textarea>
					</td>
					<td>
						<hr id="hr1">
						<h1>내 정보 확인</h1><br>
						<p>
							회원가입 때 입력하셨던 정보들을 확인하세요. 😊<br><br>
							<b style="background-color:#fff6f0; color: black; font-size: 15px; padding: 2px 0; border-radius: 5px;">&nbsp;수정하기&nbsp;</b> 버튼을 누르시면 수정하실 수도 있습니다!<br>
						</p>
						<input type="button" class="buttonG3" onclick="checkInfo();" value="졍보 확인하기">
						<br><hr id="hr1">
					</td>
				</tr>
				<tr>
					<td>
						<h1>비밀번호 변경하기</h1><br>
						<p>
							비밀번호를 변경하여 회원님의 계정을 지키세요! 😎<br><br>
							너무 쉬운 비밀번호를 사용하시면 계정이 위험할 수도 있어요!<br>
						</p>
						<input type="button" class="buttonG3" onclick="checkPwd();" value="비밀번호 변경하기">
						<br><hr id="hr1">
					</td>
				</tr>
				<tr>
					<td>
						<h1>회원 탈퇴하기</h1><br>
						<p>
							회원을 탈퇴하시려면 아래의 버튼을 눌러주세요... 😥<br><br>
							꼭 본인인 경우에만 사용해주세요! <b style="color: red;">한 번 탈퇴하시면 되돌리실 수 없어요!</b><br>
						</p>
						<input type="button" class="buttonGr" onclick="deleteMember();" value="회원 탈퇴하기"><hr id="hr1">
					</td>
				</tr>
			</table>
			<script>
				var chkData = "false" ;
				function checkPwd2(userPwd) {
					$.ajax({
						type : "POST",
						url: 'checkPwd.me',
						data: {userPwd:userPwd},
						success: function(data) {
							if(data == "false")	chkData = "false" ;
							else				chkData = "true"  ;
						}
					}) ;
				}
				
				function deleteMember() {
					swal({
						title: "정말 탈퇴하시겠어요...? 😥",
						text: "삭제하신 뒤에는 되돌릴 수 없으니 조심하세요!",
						icon: "warning",
						content: {
							element: "input",
							attributes: {
								placeholder: "비밀번호를 입력하세요.",
								type: "password",
							},
						},
						buttons: {
							cancel : "취소",
							defeat : {text:"확인", value:true},
						},
						dangerMode: true
					}).then(password => {
						if(!password)
							throw null ;
						checkPwd2(password) ;
						if(chkData == "true") {
							var userId = "${loginUser.userId}" ;
							$.ajax({
								url: 'delete.me',
								data: {userId:userId},
								success: function(data) {
									if(data == "true") {
										swal({
											title: "회원삭제에 성공하였습니다! 😊",
											text: "지금 로그인 중인 아이디는 로그아웃됩니다.",
											icon: "success"
										}).then(function() {
											location.href="logout.me" ;
										}) ;
									} else {
										swal({
											title: "회원삭제에 실패하였습니다!",
											text: "회원 삭제에 실패했습니다. 관리자에게 문의해 주세요.",
											icon: "error"
										}) ;
									}
								}
							}) ;
						} else {
							swal({
								title: "비밀번호가 일치하지 않습니다..! 😥",
								text: "비밀번호가 일치하지 않습니다. 다시 시도해 주세요!!",
								icon: "error"
							}) ;
						}
					}) ;
				}
			</script>
			<script>
				function checkPwd() {
					if(!checkGoogle()) {
						location.href = 'changePwdView.me' ;
					} else {
						swal({
							title: "에러!",
							text: "구글 계정으로 가입한 회원은 비밀번호를 변경하실 수 없습니다.",
							icon: "error"
						}) ;
					}
				}
				
				function checkInfo() {
					if(!checkGoogle()) {
						location.href = 'infoN.me' ;
					} else {
						location.href = 'infoG.me' ;
					}
				}
				
				function checkGoogle() {
					if("${loginUser.userPwd}" == "")	return true  ;
					else								return false ;
				}
			</script>
		</form>
	</div>
</body>
</html>