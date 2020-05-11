<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/member/member.css"  type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap" rel="stylesheet">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<title>#취미텃밭</title>
	<meta name="google-signin-client_id" content="1039608716257-rpi2mbri0nh18klpqq0r99ar6g0gh719.apps.googleusercontent.com">
	<style>
		.checkRule {
			width: 50%;
			height: 150px;
			margin-left: 22.5%;
			margin-right: 22.5%;
			line-height: 200%;
			font-size: 75%;
			text-align: left;
			padding: 0% 5%;
			overflow: auto;
			background-color: #EDEDED;
			border: 2px solid black;
			border-radius: 5px;
		}
		
		.checkRuleIndex {
			margin-left: 22%;
			margin-bottom: 2%;
		}
		
		.checkBox {
			margin-left: 23%;
		}
		
		.hr2 {
			width: 55%;
			margin-left: 25%;
		}
		
		.ruleH3 {
			color: #6359DD;
			text-align: center;
		}
	</style>
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
		<form id="JoinForm" action="joinGoogle.me" method="post" enctype="Multipart/form-data">
			<br><br><br>
			<div>
				<table id="JoinTable" style="width: 100%;">
					<tr>
						<td colspan="3">
							<img src="${contextPath}/resources/images/default_member_icon.png" id="userImg">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="imgBtn">
								<input type="file" id="imgAddInput" name="uploadFiles" style="display: none;" accept="image/*" onchange="whenFileInput(this);">
								<div id="buttonB_join" onclick="addImg();">사진 등록</div><br>
								<b style="font-size: 0.8rem;">사진은 최대 </b><b style="color: red; font-size: 0.8rem;">5MB</b><b style="font-size: 0.8rem;">까지만 가능합니다.</b><br>
								<b style="text-align: center; color: red; font-size: 0.7rem;">프로필 사진을 입력하세요.</b><br><br><br><br>
								<input type="hidden" id="imgUsable" value="noImg">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3"><br><hr><br><br></td>
					</tr>
					<tr>
						<td colspan="3">
							<img src="${contextPath}/resources/images/google_icon.png" id="googleIcon" align="middle">
							<h3>계정을 이용하여 로그인</h3>
							<h5 style="color:gray">구글 계정으로 로그인하신 뒤 추가정보를 입력하세요! 😊</h5><br>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<div align="center">
								<div class="google-btn- gh">
									<div id="googleLogin" class="g-signin2" data-onsuccess="onSignIn"></div>
								</div>
							</div>
							<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
							<p>입력된 구글 이메일 : <pre id="googleEmail">[입력되지 않음]</pre>
							<a id="signOutGoogle" onclick="signOut();">다른 아이디 입력하기</a>
							<input type="hidden" id="googleId" name="googleId" value="#none"><!-- 값이 없을 때는 #none이 입력됨 -->
						</td>
					</tr>
					<tr>
						<td colspan="3"><br><br><hr><br><br></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB2">닉네임</div></th>
						<td colspan="2">
							<input type="text" id="nickName" name="nickName" class="JoinInput" placeholder=" 닉네임은 한글, 영어, 숫자, 특수문자(_, *, !)로 구성되며, 2자 이상 10자 이내로 구성된답니다!">
							<input type="hidden" id="isNickNameUsable" value="emptyNick">
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre id="nickNameCheck" class="joinCheck"  style="text-align: right; color: red;">닉네임을 입력하세요.</pre></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB2">이름</div></th>
						<td colspan="2">
							<input type="text" id="userName" name="userName" class="JoinInput" placeholder=" 이름에는 한글만 입력하실 수 있습니다!">
							<input type="hidden" id="isUserNameUsable" value="emptyName">
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre id="userNameCheck" class="joinCheck"  style="text-align: right; color: red;">이름을 입력하세요.</pre></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB2">전화번호</div></th>
						<td colspan="2"><input type="text" id="phone" name="phone" class="JoinInput" placeholder=" 전화번호를 입력하세요! '-' 기호는 빼구요! 꼭 입력하실 필요는 없습니다!"></td>
					</tr>
					<tr>
						<td colspan="2"><pre id="phoneCheck" class="joinCheck"  style="text-align: right; color:#5E5E5E;">전화번호를 입력하지 않으셨네요! 괜찮으시겠어요?</pre></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB2">성별</div></th>
						<td colspan="2" style="display: inline;" style="display: inline-block;">
							<select id="gender" name="gender" class="JoinInput" >
								<option value="M">남자</option>
								<option value="W">여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre id="genderCheck" class="joinCheck"  style="text-align: right; color: green;">입력하신 성별은 [남자]에요! 계속하시죠!</pre></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB2">생년월일</div></th>
						<td colspan="2" style="display: inline;" style="display: inline-block;">
							<select id="year" name="year" class="JoinInputSelect" >
								<c:forEach begin="<%= new GregorianCalendar().get(Calendar.YEAR) - 100 %>" end="<%= new GregorianCalendar().get(Calendar.YEAR) %>" var="i">
									<option value="${ i }">${ i }</option>
								</c:forEach>	
							</select>
							<select id="month" name="month" class="JoinInputSelect" >
								<c:forEach begin="1" end="12" var="i">
									<option value="${ i }">${ i }</option>
								</c:forEach>
							</select>
							<select id="date" name="date" class="JoinInputSelect" >
								<c:forEach begin="1" end="31" var="i">
									<option value="${ i }">${ i }</option>
								</c:forEach>
							</select>
							<script>
								$(document).ready(function() {
									$('#year option[value=2020]').attr('selected', 'selected') ;									
								}) ;
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre id="birthCheck" class="joinCheck"  style="text-align: right; color: green;">1920년 1월 1일 생이시군요! 알겠습니다!</pre></td>
					</tr>
					<tr>
						<th rowspan="4"><div id="addressBtn">주소</div></th>
						<td colspan="2">
							<input type="text" id="post" name="post" class="postcodify_postcode5 JoinInput" size="6" placeholder="&nbsp;우편번호" readonly>
							<button type="button" id="postcodify_search_button" class="buttonG2">검색</button>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" id="address1" name="address1" class="postcodify_address JoinInput" placeholder="&nbsp;주소" readonly></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" id="address2" name="address2" class="postcodify_extra_info JoinInput" placeholder="&nbsp;상세 주소(직접 입력 가능)"></td>
					</tr>
					<tr>
						<td colspan="2"><pre id="addressCheck" class="joinCheck"  style="text-align: right; color: #5E5E5E;">주소를 입력하지 않으셨네요! 괜찮으시겠어요?</pre></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB2">회원종류</div></th>
						<td colspan="2">
							<select id="mKind" name="mKind" style="height: 35px;" class="JoinInput">
								<option value="0" selected disabled>&nbsp;회원 종류 선택</option>
								<option value="1">&nbsp;일반회원</option>
								<option value="2">&nbsp;강사</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre id="mKindCheck" class="joinCheck" style="text-align: right; color: red;">회원종류를 입력하세요.</pre><br></td>
					</tr>
					<tr>
						<td colspan="3"><hr><br><br></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: left;">
							<h2 class="checkRuleIndex">&nbsp;>&nbsp; 회원약관</h2>
							<div tabindex="0" id="checkRule01" class="checkRule">
								<h3 class="ruleH3">제 1 장 총칙<br></h3>
								<h4>제 1 조 (목적)<br></h4>
								1. 본 약관은 #취미텃밭 사이트가 제공하는 모든 서비스의 이용조건 및 절차, 이용자와 #취미텃밭 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
								<h4>제 2 조 (약관의 효력과 변경)<br></h4>
								1. #취미텃밭 사이트는 귀하가 본 약관 내용에 동의하는 경우 #취미텃밭 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.<br>
								2. #취미텃밭 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 #취미텃밭 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.<br>
								이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.<br>
								<h4>제 3 조 (약관 외 준칙)<br></h4>
								1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.<br>
								<h4>제 4 조 (용어의 정의)<br></h4>
								본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
								<p>1. 이용자 : 본 약관에 따라 #취미텃밭 사이트가 제공하는 서비스를 받는 자.<br>
								2. 가입 : #취미텃밭 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위.<br>
								3. 회원 : #취미텃밭 사이트에 개인 정보를 제공하여 회원 등록을 한 자로서 #취미텃밭 사이트가 제공하는 서비스를 이용할 수 있는 자.<br>
								4. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.<br>
								5. 탈퇴 : 회원이 이용계약을 종료시키는 행위.<br></p>
								<h3 class="ruleH3">제 2 장 서비스 제공 및 이용<br></h3>
								<h4>제 5 조 (이용계약의 성립)<br></h4>
								1. 이용계약은 신청자가 온라인으로 #취미텃밭 사이트에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.<br>
								2. #취미텃밭 사이트는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.<br>
								<p>① 다른 사람의 명의를 사용하여 신청하였을 때<br>
								② 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때<br>
								③ 다른 사람의 #취미텃밭 사이트 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때<br>
								④ #취미텃밭 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우<br>
								⑤ 기타 #취미텃밭 사이트가 정한 이용신청요건이 미비 되었을 때<br></p>
								<h4>제 6 조 (회원정보 사용에 대한 동의)<br></h4>
								1. 회원의 개인정보는 공공기관의 개인정보보호에 관한 법률에 의해 보호됩니다.<br>
								2. #취미텃밭 사이트의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.<br>
								<p>① 개인정보의 사용 : #취미텃밭 사이트는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다.<br>
								단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 #취미텃밭 사이트에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.<br>
								② 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다.<br>
								따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 안되며, 작업 종료 시에는 반드시 로그아웃 해 주시기 바랍니다.<br></p>
								3. 회원이 본 약관에 따라 이용신청을 하는 것은, #취미텃밭 사이트가 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.<br>
								<h4>제 7 조 (사용자의 정보 보안)<br></h4>
								1. 가입 신청자가 #취미텃밭 사이트 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.<br>
								2. ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용 되었다는 사실을 발견한 경우에는 즉시 #취미텃밭 사이트에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다. 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 #취미텃밭 사이트는 책임을 부담하지 아니합니다.<br>
								<h4>제 8 조 (서비스의 중지)<br></h4>
								1. #취미텃밭 사이트는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다.<br>
								<h4>제 9 조 (서비스의 변경 및 해지)<br></h4>
								1. #취미텃밭 사이트는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다. 의한 손해에 대하여 책임을 부담하지 아니합니다.<br>
								<h4>제 10 조 (게시물의 저작권)<br></h4>
								1. 귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.<br>
								2. #취미텃밭 사이트는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며, 게시판운영 원칙에 따라 사전 통지 없이 삭제할 수 있습니다.<br>
								3. 귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.<br>
								<h3 class="ruleH3">제 3 장 의무 및 책임<br></h3>
								<h4>제 11 조 (#취미텃밭 사이트의 의무)<br></h4>
								1. #취미텃밭 사이트는 회원의 개인 신상 정보를 본인의 승낙없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.<br>
								<h4>제 12 조 (회원의 의무)<br></h4>
								1. 회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br>
								2. 회원은 #취미텃밭 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.<br>
								<h3>제 4 장 기타<br></h3>
								<h4>제 13 조 (양도금지)<br></h4>
								1. 회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.<br>
								<h4>제 14 조 (손해배상)<br></h4>
								1. #취미텃밭 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 #취미텃밭 사이트가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.<br>
								<h4>제 15 조 (면책조항)<br></h4>
								1. #취미텃밭 사이트는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. #취미텃밭 사이트는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다. 금전적 거래등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.<br>
								<h4>제 16 조 (재판관할)<br></h4>
								1. #취미텃밭 사이트와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.<br>
							</div><br><br>
							<input id="joinCheck1" class="checkBox" type="checkbox">&nbsp;<b>이용약관</b>에 동의합니다.<br><br><hr class="hr2">
							<h2 class="checkRuleIndex">&nbsp;>&nbsp; 개인정보 수집 및 이용 동의</h2>
							<div tabindex="0" id="checkRule02" class="checkRule">
								<b>#취미텃밭은 「개인정보보호법」 제15조제1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항 제1호에 따라<br></b>
								<b>아래와 같이 개인정보의 수집. 이용에 관하여 귀하의 동의를 얻고자 합니다.<br></b>
								<b>#취미텃밭은 이용자의 사전 동의 없이는 이용자의 개인정보를 함부로 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다.<br></b>
								<b>이용자가 제공한 모든 정보는 아래의 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 이를 알리고 동의를 구할 것입니다.<br></b>
								<h3 class="ruleH3">개인정보의 수집 및 이용 동의</h3>
								<h4>1. 개인정보의 수집 및 이용 목적</h4>
								<b>가. 서비스 제공에 관한 업무 이행</b><br>
								<b>나. 회원관리</b>
								<p>- 회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 가입 및 가입횟수 제한, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 공지사항 전달 등</p>
								<h4>2. 수집하는 개인정보의 항목</h4>
								<b>[일반회원 가입]</b><br>
								필수항목 : 아이디, 닉네임, 이름, 비밀번호, 이메일(인증 필수), 성별, 생년월일, 회원종류, 프로필 사진<br>
								선택항목 : 전화번호, 주소<br>
								<b>[Google 가입]</b><br>
								필수항목 : 구글 아이디, 닉네임, 이름, 성별, 생년월일, 회원종류<br>
								선택항목 : 전화번호, 주소<br>
								<b>* #취미텃밭에서는 가입한 구글 계정의 비밀번호를 수집하지 않고, 단순히 API를 이용한 인증에만 값을 사용하며 back-end로 비밀번호를 전달하지 않음을 알립니다.</b><br>
								<b>[강사회원 가입]</b><br>
								일반/Google과 동일 + 결제 회원(vip 여부), 활동 지역, 주요 강의<br>
								<b>[자동수집]</b><br>
								IP주소, 쿠키, 서비스 이용기록, 방문기록 등<br>
								<h4>3. 개인정보의 보유 및 이용기간</h4>
								<b>#취미텃밭은 탈퇴한 회원 등의 정보도 분쟁 여부를 위해 보관합니다. 허나 탈퇴한 회원의 정보는 서비스에 일절 활용하지 않음을 알립니다.</b><br>
								<h4>4. 동의거부권 및 불이익</h4>
								<p>정보주체는 개인정보 수집에 동의를 거부할 권리가 있습니다. 다만 필수 항목에 대한 동의 거부 시 저희가 제공하는 서비스를 이용할 수 없습니다.</p>
							</div><br><br>
							<input id="joinCheck2" class="checkBox" type="checkbox">&nbsp;<b>개인정보 수집 및 이용</b>에 동의합니다.<br><br><hr class="hr2">
						</td>
					</tr>
					<tr>
						<td colspan="3"><br><br><hr><br><br></td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="button" id="joinSubmitBtn" class="buttonP" value="회원가입" onclick="joinSubmit();"><input type="reset" id="resetBtn" class="buttonP" value="초기화">
						</td>
					</tr>
				</table>
			</div><br><br>
		</form>
		<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
		<script>
			// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
			$(function() {
				$("#postcodify_search_button").postcodifyPopUp() ;
			}) ;
		</script>
		<script>
			// submit 시 체크
			function joinSubmit() {
				var isUsable = 1 ;
				if($('#imgUsable').val() == "noImg") {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "프로필 사진을 입력하지 않으셨어요!",
							icon: "error"
						}) ;
					}, 1000) ;
					isUsable = 0 ;
				} else if($('#googleId').val() == "#none") {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "구글 계정에 로그인하지 않으셨어요!",
							icon: "error"
						}) ;
					}, 1000) ;
					isUsable = 0 ;
				} else if($('#isNickNameUsable').val() != "trueNick") {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "닉네임을 잘못 입력하셨어요!",
							icon: "error"
						}) ;
					}, 1000) ;
					$('#nickName').focus() ;
					isUsable = 0 ;
				} else if($('#isUserNameUsable').val() != "trueName") {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "잘못된 이름을 입력하셨어요!",
							icon: "error"
						}) ;
					}, 1000) ;
					$('#userName').focus() ;
					isUsable = 0 ;
				} else if($('#isPhoneUsable').val() == "falsePhone") {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "전화번호가 잘못된 것 같아요!",
							icon: "error"
						}) ;
					}, 1000) ;
					$('#phone').focus() ;
					isUsable = 0 ;
				} else if($('#mKind').val() == "0") {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "회원종류를 입력하지 않으셨어요!",
							icon: "error"
						}) ;
					}, 1000) ;
					isUsable = 0 ;
				} else if($('input:checkbox:checked').length < 2) {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "동의사항에 동의하지 않으셨어요!",
							icon: "error"
						}) ;
					}, 1000) ;
					isUsable = 0 ;
				}
				
				if(isUsable == 1) {
					if(!$('#phone').val())
						$('#phone').val("#empty") ;
					if(!$('#address1').val()) {
						$('#post').val("0") ;
						$('#address1').val("#empty") ;
						$('#address2').val("#empty") ;
					} $("#JoinForm").submit() ;
				}
			}
		</script>
		
		<script>
			// 닉네임 변경 시 검사
			$('#nickName').on('keyup', function() {
				var $nickName = $('#nickName').val() ;
				var reg = /^[A-Za-zㄱ-ㅎ가-힣0-9_*!]{2,10}$/ ;
				
				if($nickName.trim().length == 0) {
					$('#nickNameCheck').html("닉네임을 입력하세요.") ;
					$('#nickNameCheck').css('color', 'red') ;
					$('#isNickNameUsable').val("emptyNick") ;
					isUsable = 0 ;
				} else {
					if(!reg.test($nickName)) {
						$('#nickNameCheck').html("잘못된 닉네임입니다.") ;
						$('#nickNameCheck').css('color', 'red') ;
						$('#isNickNameUsable').val("falseNick") ;
					} else {
						checkDupNick($nickName) ;
					}
				}
			}) ;
			
			function checkDupNick($nickName) {
				var nickName = $('#nickName').val() ;
				$.ajax({
					url: 'dupnick.me',
					data: {nickName:nickName},
					success: function(data) {
						if(data == 'true') {
							$('#nickNameCheck').html("사용 가능한 닉네임입니다.") ;
							$('#nickNameCheck').css('color', 'green') ;
							$('#isNickNameUsable').val("trueNick") ;
						} else {
							$('#nickNameCheck').html("중복된 닉네임입니다.") ;
							$('#nickNameCheck').css('color', 'red') ;
							$('#isNickNameUsable').val("dupNick") ;
						}
					}
				}) ;
			}
			
			// 이름 변경 시 검사
			$('#userName').on('keyup', function() {
				var $userName = $('#userName').val() ;
				var reg = /[가-힣]/ ;
				var isUsable = 1 ;
				
				if($userName.trim().length == 0) {
					$('#userNameCheck').html("이름을 입력하세요.") ;
					$('#userNameCheck').css('color', 'red') ;
					$('#isUserNameUsable').val("emptyName") ;
					isUsable = 0 ;
				} else if(reg.test($userName)) {
					$('#userNameCheck').html("사용 가능한 이름입니다.") ;
					$('#userNameCheck').css('color', 'green') ;
					$('#isUserNameUsable').val("trueName") ;
					isUsable = 0 ;
				} else {
					$('#userNameCheck').html("잘못된 이름입니다.") ;
					$('#userNameCheck').css('color', 'red') ;
					$('#isUserNameUsable').val("falseName") ;
				}
			}) ;
			
			// 전화번호 변경 시 검사
			$('#phone').on('keyup', function() {
				var $phone = $('#phone').val() ;
				var reg = /[0-9]{11}/ ;
				var isUsable = 1 ;
				
				if($phone.trim().length == 0) {
					$('#phoneCheck').html("전화번호를 입력하지 않으셨네요! 괜찮으시겠어요?            ") ;
					$('#phoneCheck').css('color', '#5E5E5E') ;
					$('#isPhoneUsable').val("emptyPhone") ;
					isUsable = 0 ;
				} else if(reg.test($phone)) {
					$('#phoneCheck').html("사용 가능한 전화번호입니다!") ;
					$('#phoneCheck').css('color', 'green') ;
					$('#isPhoneUsable').val("truePhone") ;
					isUsable = 0 ;
				} else {
					$('#phoneCheck').html("잘못된 전화번호입니다.") ;
					$('#phoneCheck').css('color', 'red') ;
					$('#isPhoneUsable').val("falsePhone") ;
				}
			}) ;
			
			// 성별 변경 시 표시
			$('#gender').on('change', function() {
				var $gender = $('#gender').val() ;
				var Ngender = ($gender == "M") ? "남자" : "여자" ;
				$('#genderCheck').html("입력하신 성별은 ["+Ngender+"]네요! 계속하시죠!") ;
			}) ;
			
			// 생년월일 변경 시 표시
			$('#year, #month, #date').on('change', function() {
				var $year  = $('#year' ).val() ;
				var $month = $('#month').val() ;
				var $date  = $('#date' ).val() ;
				$('#birthCheck').html($year+"년 "+$month+"월 "+$date+"일 생이시군요! 알겠습니다!") ;
			}) ;
			
			// 주소 변경 시 표시
			$('#address2').on('keyup', function() {
				if($('#post').val() != "") {
					$('#addressCheck').html("주소를 입력하셨네요!") ;
					$('#addressCheck').css('color', 'green') ;
				} else {
					$('#addressCheck').html("주소를 입력하지 않으셨네요! 괜찮으시겠어요?") ;
					$('#addressCheck').css('color', '#5E5E5E') ;
				}
			}) ;
			
			// 회원 종류 변경 시 표시
			$('#mKind').on('change', function() {
				if($('#mKind').val() == "0") {
					$('#mKindCheck').html("회원종류를 입력하세요.") ;
					$('#mKindCheck').css('color', 'red') ;
				} else if($('#mKind').val() == "1") {
					$('#mKindCheck').html("일반회원으로 입력하셨네요!") ;
					$('#mKindCheck').css('color', 'green') ;
				} else if($('#mKind').val() == "2") {
					$('#mKindCheck').html("강사회원으로 입력하셨네요!") ;
					$('#mKindCheck').css('color', 'green') ;
				}
			}) ;
		</script>
		<script>
			var check = 1 ;
			
			// Google Login 시
			async function onSignIn(googleUser) {
				var profile = googleUser.getBasicProfile() ;
				gEmail = profile.getEmail() ;
				$('#googleId').val(gEmail) ;
				check = await checkIsNewGoogleId(gEmail) ;
				
				if(check == 1) {
					$('#googleEmail').html(gEmail) ;
					$('#googleEmail').css('font-weight', 'bold') ;
					$('#signOutGoogle').css('display', 'block') ;
				} else {
					var bool = confirm('이미 가입된 아이디입니다. 해당 아이디로 로그인 하시겠습니까? (취소 시 현재 아이디는 로그아웃됩니다.)') ;
					if(bool) {
						signOut() ;
						location.href = "loginView.me" ;
					} else {
						$('#googleId').val("#none") ;
						signOut() ;
					}
				}
			}
			
			function checkIsNewGoogleId(googleEmail) {
				var googleId = googleEmail ;
				return new Promise(function(resolve, reject) {
					$.ajax({
						url: 'dupGoogle.me',
						data: {googleId:googleId},
						success: function(data) {
							if(data == 'true') {
								resolve(1) ;
							} else {
								resolve(0) ;
							}
						}
					}) ;
				})
			}
			
			function signOut() {
				var auth2 = gapi.auth2.getAuthInstance() ;
				auth2.signOut() ;
				auth2.disconnect();
				$('#googleEmail').html("[입력되지 않음]") ;
				$('#googleEmail').css('font-weight', 'normal') ;
				$('#googleId').html("#none") ;
				$('#signOutGoogle').css('display', 'none') ;
			}
		</script>
		<script>
			function addImg() {
				$('#imgAddInput').click() ;
			}
			
			function whenFileInput(input) {
				if(checkSize(input) == "1") {
					var reader = new FileReader() ;
					reader.onload = function(e) {
						$("#userImg").attr("src", e.target.result) ;
						$('#imgUsable').attr('value', 'newImg') ;
					}
					reader.readAsDataURL(input.files[0]) ;
				}
			}
			
			function checkSize(input) {
			    if (input.files[0].size>(5 * 1024 * 1024)) {
			    	setTimeout(function() {
			    		swal({
			    			title: "다시 시도해 주세요! 😒",
			    			text: "파일 사이즈가 5MB를 초과합니다!",
			    			icon: "error"
			    		}) ;
			    	}, 1000) ;
			        input.value = null ;
			        return "0" ;
			    } else {
			    	return "1" ;
			    }
			}
		</script>
	</div>
</body>
</html>