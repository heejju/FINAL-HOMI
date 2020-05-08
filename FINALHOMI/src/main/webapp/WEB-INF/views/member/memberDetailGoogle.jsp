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
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<td rowspan="2">
						<img src="${contextPath}/resources/uploadFiles/${loginUser.changeName}" id="userImg_infoG">
					</td>
					<td colspan="2">
						<input type="text" id="nickName_infoG" name="nickName" class="infoInput" value="${loginUser.nickName}" readonly>
						<input type="hidden" id="userId" name="userId" value="${loginUser.nickName}"><br>
					</td></tr><tr>
					<td>
						<script>
							$(document).ready(function() {
								if("${loginUser.introduction}" == "") {
									$('#introduction').text("자기소개가 비었습니다.") ;
									$('#introduction').css("color", "gray") ;
								}
							}) ;
						</script>
						<textarea id="introduction" name="introduction" class="infoTextareaG" readonly>${loginUser.introduction}</textarea>
						<input type="hidden" id="introduction" name="introduction" value="${loginUser.introduction}"><br>
					</td>
				</tr>
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<th>
						<div id="buttonB_infoG_thG">
							<b id="infoGbB">G</b><b id="infoGbR">o</b><b id="infoGbY">o</b><b id="infoGbB">g</b><b id="infoGbG">l</b><b id="infoGbR">e</b>
						</div>
					</th>
					<td class="myInfo_td" colspan="2">
						<input type="text" id="userId" name="userId" class="infoInputG" value="${loginUser.userId}" readonly>
						<input type="hidden" id="userId" name="userId" value="${loginUser.userId}"><br>
					</td>
				</tr>
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<th><div id="buttonB_infoG_th">이름</div></th>
					<td class="myInfo_td" colspan="2">
						<input type="text" id="userId" name="userId" class="infoInputG" value="${loginUser.userName}" readonly>
						<input type="hidden" id="userId" name="userId" value="${loginUser.userName}"><br>
					</td>
				</tr>
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<th><div id="buttonB_infoG_th" style="background-color: #888c43;">생년월일</div></th>
					<td class="myInfo_td" colspan="2">
						<input type="text" id="birthDate" name="birthDate" class="infoInputG" value="${loginUser.birthDate}" readonly>
						<input type="hidden" id="birthDate" name="birthDate" value="${loginUser.birthDate}"><br>
					</td>
				</tr>
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<th><div id="buttonB_infoG_th">성별</div></th>
					<td class="myInfo_td" colspan="2">
						<input type="text" id="gender" name="gender" class="infoInputG" value="" readonly>
						<input type="hidden" id="gender" name="gender" value="${loginUser.gender}"><br>
						<script>
							$(document).ready(function() {
								if("${loginUser.gender}" == "M")
									$('#gender').val("남자") ;
								else
									$('#gender').val("여자") ;
							}) ;
						</script>
					</td>
				</tr>
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<th><div id="buttonB_infoG_th" style="background-color: #888c43;">전화번호</div></th>
					<td class="myInfo_td" colspan="2">
						<script>
							$(document).ready(function() {
								if("${loginUser.phone}" == "") {
									$('#phone').val("전화번호가 비었습니다.") ;
									$('#phone').css("color", "gray") ;
								}
							}) ;
						</script>
						<input type="text" id="phone" name="phone" class="infoInputG" value="${loginUser.phone}" readonly>
						<input type="hidden" id="phone" name="phone" value="${loginUser.gender}"><br>
					</td>
				</tr>
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<th><div id="buttonB_infoG_th" style="margin-bottom: 25%;">기본 주소</div></th>
					<td class="myInfo_td" colspan="2">
						<script>
							$(document).ready(function() {
								if("${loginUser.postalCode}" == "0" || "${loginUser.postalCode}" == "") {
									$('#address1').val("주소가 비었습니다.")  ;
									$('#address1').css("color", "gray") ;
									$('#address2').val("주소가 비었습니다.")  ;
									$('#address2').css("color", "gray") ;
								}
							}) ;
						</script>
						<input type="text" id="address1" name="address1" class="infoInputG" value="[${loginUser.postalCode}] ${loginUser.bAddress}" readonly>
						<input type="text" id="address2" name="address2" class="infoInputG" value=" ${loginUser.lAddress}" readonly>
						<input type="hidden" id="address1" name="address1" value="[${loginUser.postalCode}] ${loginUser.bAddress}">
						<input type="hidden" id="address2" name="address2" value=" ${loginUser.lAddress}">
					</td>
				</tr>
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<th><div id="buttonB_infoG_th" style="background-color: #888c43;">가입일자</div></th>
					<td class="myInfo_td" colspan="2">
						<input type="text" id="createDate" name="createDate" class="infoInputG" value="${loginUser.createDate}" readonly>
						<input type="hidden" id="createDate" name="createDate" value="${loginUser.createDate}"><br>
					</td>
				</tr>
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<th><div id="buttonB_infoG_th">회원종류</div></th>
					<td class="myInfo_td" colspan="2">
						<script>
							$(document).ready(function() {
								if("${loginUser.mKind}" == "1")
									$('#mKind').val("일반회원")  ;
								else if("${loginUser.mKind}" == "2")
									$('#mKind').val("강사")  ;
								else if("${loginUser.mKind}" == "0")
									$('#mKind').val("운영자")  ;
							}) ;
						</script>
						<input type="text" id="mKind" name="mKind" class="infoInputG" value="${loginUser.mKind}" readonly>
						<input type="hidden" id="mKind" name="mKind" value="${loginUser.mKind}"><br>
					</td>
				</tr>
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<td colspan="3">
						<script>
							$(document).ready(function() {
								if("${loginUser.mKind}" == "2") {
									$('.teacherTr').css('display', "") ;
								} else if("${loginUser.mKind}" == "1") {
									$('.teacherTr').css('display', "none") ;
								}
							}) ;
						</script>
					</td>
				</tr>
				<tr class="teacherTr">
					<th><div id="buttonB_infoG_th">활동 지역</div></th>
					<td class="myInfo_id" colspan="2">
						<input type="text" id="activeLoc" name="activeLoc" class="infoInputG" value="${loginUser.activeLoc}" readonly>
						<input type="hidden" id="activeLoc" name="activeLoc" value="${loginUser.activeLoc}">
					</td>
				</tr>
				<tr class="teacherTr"><td class="myInfo_td"><br><br></td></tr>
				<tr class="teacherTr">
					<th><div id="buttonB_infoG_th" style="background-color: #888c43;">주요 강의</div></th>
					<td class="myInfo_id" colspan="2">
						<input type="text" id="hobbyName" name="hobbyName" class="infoInputG" value="${loginUser.hobbyName}" readonly>
						<input type="hidden" id="hobbyName" name="hobbyName" value="${loginUser.hobbyName}">
					</td>
				</tr>
				<tr class="teacherTr"><td class="myInfo_td"><br><br></td></tr>
				<tr class="teacherTr">
					<th><div id="buttonB_infoG_th">결제 회원 여부</div></th>
					<td class="myInfo_td" colspan="2">
						<input type="text" id="vipYn" name="vipYn" class="infoInputG" value="${loginUser.vipYn}" readonly>
						<input type="hidden" id="vipYn" name="vipYn" value="${loginUser.vipYn}"><br>
					</td>
				</tr>
				<tr class="teacherTr"><td class="myInfo_td"><br><br></td></tr>
				<tr><td class="myInfo_td"><br><br></td></tr>
				<tr>
					<td colspan="3">
						<b id="buttonP_info"  onclick="location.href='updateNView.me'">수정하기</b>&nbsp;&nbsp;&nbsp;
						<b id="buttonGr_info" onclick="location.href='myinfoView.me'" style="border: 1px solid black;">돌아가기</b>
					</td>
				</tr>
				<tr><td class="myInfo_td"><br><br><br></td></tr>
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