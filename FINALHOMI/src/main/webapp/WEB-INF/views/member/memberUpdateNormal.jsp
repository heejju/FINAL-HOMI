<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
			$('#bNameAfter').text(" 수정") ;
		</script>
	</header>
	<div class="wrapper">
		<form id="JoinForm" action="updateN.me" method="post" enctype="Multipart/form-data">
			<br><br><br>
			<script>
				$(document).ready(function() {
					if("${loginUser.mKind}" == "2")
						$('.teacherTr').css('display', "") ;
					else
						$('.teacherTr').css('display', "none") ;
				}) ;
			</script>
			<div>
				<table id="JoinTable" style="width: 100%;">
					<tr>
						<td colspan="3">
							<img src="${contextPath}/resources/uploadFiles/${loginUser.changeName}" id="userImg">
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="imgBtn">
								<input type="file" id="imgAddInput" name="uploadFiles" style="display: none;" accept="image/*" onchange="whenFileInput(this);">
								<div id="buttonB_join" onclick="addImg();">사진 등록</div><br>
								<b style="font-size: 0.8rem;">사진은 최대 </b><b style="color: red; font-size: 0.8rem;">5MB</b><b style="font-size: 0.8rem;">까지만 가능합니다.</b><br>
								<!-- <b style="text-align: center; color: red; font-size: 0.7rem;">사진을 입력하세요. (기본 이미지 : default_member_icon.png)</b><br><br><br><br> -->
								<!-- <input type="hidden" id="imgSrc" value="default_member_icon.png"> --> <!-- 기본 사진 넣었다가 없앰 -->
								<b style="text-align: center; color: green; font-size: 0.7rem;">사용 가능한 사진입니다.</b><br><br><br><br>
								<input type="hidden" id="imgUsable" name="imgUsable" value="oldImg">
								<input type="hidden" id="userId" name="userId" value="${loginUser.userId}">
								<input type="hidden" id="mKind"  name="mKind"  value="${loginUser.mKind}" >
							</div>
						</td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB_update">닉네임</div></th>
						<td colspan="2">
							<input type="text" id="nickName" name="nickName" class="JoinInput" placeholder=" 닉네임은 한글, 영어, 숫자, 특수문자(_, *, !)로 구성되며, 2자 이상 10자 이내로 구성된답니다!" value="${loginUser.nickName}">
							<input type="hidden" id="isNickNameUsable" value="trueNick">
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre id="nickNameCheck" class="joinCheck" style="text-align: right; color: green;">기존과 동일한 닉네임입니다..</pre></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB_update">이름</div></th>
						<td colspan="2">
							<input type="text" id="userName" name="userName" class="JoinInput" placeholder=" 이름에는 한글만 입력하실 수 있습니다!" value="${loginUser.userName}">
							<input type="hidden" id="isUserNameUsable" value="trueName">
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre id="userNameCheck" class="joinCheck" style="text-align: right; color: green;">사용 가능한 이름입니다.</pre></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB_update">이메일</div></th>
						<td colspan="2">
							<input type="email" id="joinEmail" name="joinEmail" class="JoinInput" placeholder=" 실제로 사용하는 이메일을 입력해 주세요!" value="${loginUser.email}">
							<input type="hidden" id="isEmailUsable" value="trueEmail"><!-- value : falseEmail(인증번호X), trueEmail(인증번호O), uncheckEmail(인증버튼 안누름) -->
							<input type="button" class="buttonG2" value="인증하기" onclick="checkEmail();"><br>
							<input type="text" id="emailConfirm" name="emailConfirm" class="JoinInput" placeholder=" 이메일 인증번호를 입력하세요." readonly>
							<input type="hidden" id="emailConfirmAnswer" name="emailConfirmAnswer" value="">
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre id="emailCheck" class="joinCheck" style="text-align: right; color: green;">사용 가능한 이메일입니다.</pre></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB_update">전화번호</div></th>
						<td colspan="2"><input type="text" id="phone" name="phone" class="JoinInput" placeholder=" 전화번호를 입력하세요! '-' 기호는 빼구요! 꼭 입력하실 필요는 없습니다!" value="${loginUser.phone}"></td>
					</tr>
					<tr>
						<td colspan="2"><pre id="phoneCheck" class="joinCheck" style="text-align: right; color:green;">사용 가능한 전화번호입니다.</pre></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB_update">성별</div></th>
						<td colspan="2" style="display: inline;" style="display: inline-block;">
							<script>
								$(document).ready(function() {
									if("${loginUser.gender}" == "M")
										$('#male').prop('selected', 'true') ;
									else
										$('#female').prop('selected', 'true') ;
								}) ;
							</script>
							<select id="gender" name="gender" class="JoinInput" >
								<option id="male" value="M">남자</option>
								<option id="female" value="W">여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre id="genderCheck" class="joinCheck" style="text-align: right; color: green;">입력하신 성별은 [남자]에요! 계속하시죠!</pre></td>
					</tr>
					<tr>
						<th rowspan="2"><div id="buttonB_update">생년월일</div></th>
						<td colspan="2" style="display: inline;" style="display: inline-block;">
							<select id="year" name="year" class="JoinInputSelect" >
								<c:forEach begin="<%= new GregorianCalendar().get(Calendar.YEAR) - 100 %>" end="<%= new GregorianCalendar().get(Calendar.YEAR) %>" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							<select id="month" name="month" class="JoinInputSelect" >
								<c:forEach begin="1" end="12" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							<select id="date" name="date" class="JoinInputSelect" >
								<c:forEach begin="1" end="31" var="i">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							<script>
								$(document).ready(function() {
									$('#year option[value=2020]').attr('selected', 'selected') ;
									$('#month option[value='+("${loginUser.birthDate}".substring(5,7))+']').attr('selected', 'selected') ;
									$('#date option[value='+("${loginUser.birthDate}".substring(8,10))+']').attr('selected', 'selected') ;
								}) ;
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="2"><pre id="birthCheck" class="joinCheck" style="text-align: right; color: green;">1920년 1월 1일 생이시군요! 알겠습니다!</pre></td>
					</tr>
					<tr>
						<th rowspan="4"><div id="addressBtn">주소</div></th>
						<td colspan="2">
							<script>
								$(document).ready(function() {
									if("${loginUser.postalCode}" == "0") {
										$('#post').val("") ;
										$('#address1').val("") ;
										$('#address2').val("") ;
									} else {
										$('#post').val("${loginUser.postalCode}") ;
										$('#address1').val("${loginUser.bAddress}") ;
										$('#address2').val("${loginUser.lAddress}") ;
									}
								}) ;
							</script>
							<input  type="text" id="post" name="post" class="postcodify_postcode5 JoinInput" size="6" value="${loginUser.postalCode}" placeholder="&nbsp;우편번호" readonly>
							<button type="button" id="postcodify_search_button" class="buttonG2">검색</button>
						</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" id="address1" name="address1" class="postcodify_address JoinInput" value="${loginUser.bAddress}" placeholder="&nbsp;주소" readonly></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" id="address2" name="address2" class="postcodify_extra_info JoinInput" value="${loginUser.lAddress}" placeholder="&nbsp;상세 주소(직접 입력 가능)"></td>
					</tr>
					<tr>
						<td colspan="2"><pre id="addressCheck" class="joinCheck" style="text-align: right; color: green;">사용 가능한 주소입니다!</pre></td>
					</tr>
					<tr>
						<th rowspan="1"><div id="buttonB_update" style="margin-bottom: 80px;">자기 소개</div></th>
						<td colspan="2"><textarea id="introduction" name="introduction" class="UpdateInputTxtArea">${loginUser.introduction}</textarea><br><br></td>
					</tr>
					<tr><td colspan="3"><br><br></td></tr>
					<tr class="teacherTr">
						<th rowspan="1"><div id="buttonB_update" style="margin-bottom: 60px;">활동 지역</div></th>
						<td colspan="2">
							<select id="sido" name="sido" class="selectLocation" onchange="categoryChange();" style="margin-left: 3%; margin-top: -05%;">
								<option value=''>시/도 선택</option>
								<option value='서울특별시'>서울특별시</option>
								<option value='경기도'>경기도</option>
								<option value='인천광역시'>인천광역시</option>
								<option value='강원도'>강원도</option>
								<option value='충청북도'>충청북도</option>
								<option value='충청남도'>충청남도</option>
								<option value='대전광역시'>대전광역시</option>
								<option value='세종특별자치시'>세종특별자치시</option>
								<option value='대구광역시'>대구광역시</option>
								<option value='경상북도'>경상북도</option>
								<option value='경상남도'>경상남도</option>
								<option value='광주광역시'>광주광역시</option>
								<option value='전라북도'>전라북도</option>
								<option value='전라남도'>전라남도</option>
								<option value='울산광역시'>울산광역시</option>
								<option value='부산광역시'>부산광역시</option>
								<option value='제주특별자치도'>제주특별자치도</option>
							</select>
							<select name="gugun" class="selectLocation" id="gugun" style="margin-left: 2px; margin-top: -05%;">
								<option value=''>시/군 을 선택하세요</option>
							</select>
							<script>
								function categoryChange() {		 
									var sido = $("#sido").val() ;
									var gugun ;
									var seoul = ['강남구','강동구','강북구','강서구','관악구','광진구',
												 '구로구','금천구','노원구','도봉구','동대문구','동작구',
												 '마포구','서대문구','서초구','성동구','성북구','송파구',
												 '양천구','영등포구','용산구','은평구','종로구','중구','중랑구'] ;
									var gyeonggi = ['고양시 덕양구','고양시 일산동구','고양시 일산서구','과천시','광명시',
											 		'광주시','구리시','군포시','김포시','남양주시','동두천시',
											 		'부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구',
											 		'성남시 수정구','성남시 중원구','수원시 권선구','수원시 영통구',
											 		'수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구',
											 		'안성시','안양시 동안구','안양시 만안구','양주시','오산시','용인시 기흥구',
											 		'용인시 수지구','용인시 처인구','의왕시','의정부시','이천시','파주시',
											 		'평택시','포천시','하남시','화성시','가평군','양평군','여주군','연천군'] ;
									var incheon = ['계양구','남구','남동구','동구','부평구','서구', '연수구','중구','강화군','옹진군'] ;
									var gangwon = ['강릉시','동해시','삼척시','속초시','원주시','춘천시',
												   '태백시','고성군','양구군','양양군','영월군','인제군',
												   '정선군','철원군','평창군','홍천군','화천군','횡성군'] ;
									var chungcheong_b = ['제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군',
														 '영동군','옥천군','음성군','증평군','진천군','청원군'] ;
									var chungcheong_n = ['계룡시','공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군',
														 '부여군','서천군','연기군','예산군','청양군','태안군','홍성군'] ;
									var daejeon = ['대덕구','동구','서구','유성구','중구'] ;
									var sejong = ['조치원읍', '연기면', '연동면', '부강면', '금남면', '장군면', '연서면', '전의면', 
												  '전동면', '소정면', '한솔동', '반곡동', '소담동', '보람동', '대평동', '가람동', 
											 	   '나성동', '새롬동', '다정동', '어진동', '종촌동', '고운동', '아름동', '도담동'] ;
									var jeolla_b = ['군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군',
													'무주군','부안군','순창군','완주군','임실군','장수군','진안군'] ;
									var jeolla_n = ['광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군',
													'담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군',
													'진도군','함평군','해남군','화순군'] ;
									var gwangju = ['광산구','남구','동구','북구','서구'] ;
									var daegu = ['남구','달서구','동구','북구','서구','수성구','중구','달성군'] ;
									var gyeongsang_b = ['경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시',
														'영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군',
														'영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군'] ;
									var gyeongsang_n = ['거제시','김해시','마산시','밀양시','사천시','양산시','진주시',
														'진해시','창원시','통영시','거창군','고성군','남해군','산청군',
														'의령군','창녕군','하동군','함안군','함양군','합천군'] ;
									var ulsan = ['남구','동구','북구','중구','울주군'] ;
									var busan = ['강서구','금정구','남구','동구','동래구','부산진구',
												 '북구','사상구','사하구','서구','수영구','연제구',
												 '영도구','중구','해운대구','기장군'] ;
									var jeju = ['제주시','서귀포시'] ;
									
									switch(sido) {
									 case "" : gugun = gugun ; break ;
									 case "서울특별시" : gugun = seoul ; break ;
									 case "경기도" : gugun = gyeonggi ; break ;
									 case "인천광역시" : gugun = incheon ; break ;
									 case "강원도" : gugun=gangwon ; break ;
									 case "충청북도" : gugun=chungcheong_b ; break ;
									 case "충청남도" : gugun=chungcheong_n ; break ;
									 case "대전광역시" : gugun=daejeon ; break ;
									 case "세종특별자치시" : gugun=sejong ; break ;
									 case "전라북도" : gugun=jeolla_b ; break ;
									 case "전라남도" : gugun=jeolla_n ; break ;
									 case "광주광역시" : gugun=gwangju ; break ;
									 case "대구광역시" : gugun=daegu ; break ;
									 case "경상북도" : gugun=gyeongsang_b ; break ;
									 case "경상남도" : gugun=gyeongsang_n ; break ;
									 case "울산광역시" : gugun=ulsan ; break ;
									 case "부산광역시" : gugun=busan ; break ;
									 case "제주특별자치도" : gugun=jeju ; break ;
									}
									
									$('#gugun').empty() ;
										
									for(var i = 0 ; i < gugun.length ; i++) {			 
										 var option = $("<option value='"+gugun[i]+"'>"+gugun[i]+"</option>") ;
										$('#gugun').append(option) ;
									}
								}
							</script>
						</td>
					</tr>
					<tr class="teacherTr">
						<th rowspan="1"><div id="buttonB_update" style="margin-bottom: 60px;">주요 강의</div></th>
						<td colspan="2">
							<div id="hobbyArea">
								<select name="hobby" id="hobby" style="height: 35px; width: 80.5%; margin-left: 3%; text-indent: 10px; margin-bottom: 60px;">
									<option value="">취미를 선택하세요</option>
									<c:forEach var="h" items="${ hlist }"> <!-- 정의 안될 경우 begin=0 / end=items-1 -->
										<c:if test="${ h.hobbyNo == selectedHobby }">
											<option value="${ h.hobbyNo }" id="${ h.hobbyName }" selected>${ h.hobbyName }</option>
										</c:if>
										<c:if test="${ h.hobbyNo != selectedHobby }">
											<option value="${ h.hobbyNo }" id="${ h.hobbyName }">${ h.hobbyName }</option>
										</c:if>
									</c:forEach>
								</select>
								<script>
									$(document).ready(function() {
										$("#${loginUser.hobbyName}").prop("selected", true) ;
									}) ;
								</script>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3"><hr><br><br></td>
					</tr>
					<tr>
						<td colspan="3">
							<input type="button" id="joinSubmitBtn" class="buttonP" value="수정하기" onclick="joinSubmit();"><input type="reset" id="resetBtn" class="buttonP" value="초기화">
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
				} else if($('#isNickNameUsable').val() != "trueNick") {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "닉네임이 잘못되었어요!",
							icon: "error"
						}) ;
					}, 1000) ;
					$('#nickName').focus() ;
					isUsable = 0 ;
				} else if($('#isUserNameUsable').val() != "trueName") {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "이름이 잘못되었어요!",
							icon: "error"
						}) ;
					}, 1000) ;
					$('#userName').focus() ;
					isUsable = 0 ;
				} else if($('#isEmailUsable').val() != "trueEmail") {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "이메일을 입력하지 않으셨어요!",
							icon: "error"
						}) ;
					}, 1000) ;
					$('#joinEmail').focus() ;
					isUsable = 0 ;
				} else if($('#isPhoneUsable').val() == "falsePhone") {
					setTimeout(function() {
						swal({
							title: "항목을 확인해 주세요!",
							text: "전화번호를 입력하지 않으셨어요!",
							icon: "error"
						}) ;
					}, 1000) ;
					$('#phone').focus() ;
					isUsable = 0 ;
				}
				
				if(isUsable == 1) {
					if(!$('#phone').val())
						$('#phone').val("#empty") ;
					if(!$('#address1').val()) {
						$('#post').val("0") ;
						$('#address1').val("#empty") ;
						$('#address2').val("#empty") ;
					}
					
					$("#JoinForm").submit() ;
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
					} else if($nickName == "${loginUser.nickName}") {
						$('#nickNameCheck').html("기존과 동일한 닉네임입니다.") ;
						$('#nickNameCheck').css('color', 'green') ;
						$('#isNickNameUsable').val("trueNick") ;
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
			
			// 이메일 변경 시 검사
			$('#joinEmail').on('keyup', function() {
				var $email = $('#joinEmail').val() ;
				var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i ;
				
				if($email.trim().length == 0) {
					$('#emailCheck').html("이메일을 입력하세요.") ;
					$('#emailCheck').css('color', 'red') ;
					$('#isEmailUsable').val("uncheckEmail") ;
					isUsable = 0 ;
				} else if(reg.test($email)) {
					if($('#emailConfirmAnswer').val() == "#empty") {
						$('#emailCheck').html("이메일을 인증해 주세요.") ;
						$('#emailCheck').css('color', 'red') ;
						$('#isEmailUsable').val("uncheckEmail") ;
					}
				}
			}) ;
			
			function checkEmail() {
				if($('#joinEmail').val().trim().length == 0) {
					swal({
						title: "다시 시도해 주세요!",
						text: "이메일을 입력하세요!",
						icon: "error"
					}) ;
					$('#joinEmail').focus() ;
				} else {
					var email = $('#joinEmail').val() ;
					$.ajax({
						url: 'emailCheck.me',
						data: {email:email},
						success: function(data) {
							if(data != "#dup!") {
								$('#emailConfirmAnswer').val(data) ;
								$('#emailConfirm').prop('readonly', false) ;
								$('#emailCheck').html("인증번호를 입력하세요!") ;
								$('#emailCheck').css('color', 'red') ;
								$('#isEmailUsable').val("falseEmail") ;
							} else {
								$('#emailCheck').html("중복된 이메일 입니다.다시 입력하세요!") ;
								$('#emailCheck').css('color', 'red') ;
								$('#isEmailUsable').val("dupEmail") ;
							}
						}
					}) ;
				}
			}
			
			$('#emailConfirm').on('keyup', function() {
				if($('#emailConfirm').val() == $('#emailConfirmAnswer').val()) {
					$('#emailCheck').html("인증에 성공하였습니다!") ;
					$('#emailCheck').css('color', 'green') ;
					$('#isEmailUsable').val("trueEmail") ;
				} else {
					$('#emailCheck').html("인증번호가 다릅니다!") ;
					$('#emailCheck').css('color', 'red') ;
					$('#isEmailUsable').val("falseEmail") ;
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
			$('#gender').on('keyup', function() {
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