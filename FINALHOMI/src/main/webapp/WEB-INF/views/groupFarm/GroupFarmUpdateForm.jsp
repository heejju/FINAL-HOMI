<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%> 
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<link rel="stylesheet" href="<c:url value="/resources/jquery-ui/jquery-ui.css"/>" type="text/css">

<!-- 에디터 -->
<script type="text/javascrip" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${ contextPath }/resources/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<style>
	body{background-color: #fff6f0; font-family: 'Nanum Gothic', sans-serif;}
	#realMain{width:80%; height:auto; align:center; margin:0% auto; margin-top:3%;}
	
	/* 썸네일 */
	#postMain{background:white;}
	.thumbnailWrapper{width:100%; height:500px; margin:0% auto; border:2px solid #e0e0e0; 
						text-align:center; overflow: hidden; position:relative; background:rgba(250, 250, 250, 0.4);}
	.centered{width:100%; height:500px; background:rgba(250, 250, 250, 0.4);}
	.thumbnailWrapper > img{width:80%; height:500px; vertical-align:middle;}
	#thumbnailImg{vertical-align:middle;}
	#imgGuide{width:100%; height:100px; background:rgba(0, 0, 0, 0.4); z-index:3; font-size:30px; color:white;
			 vertical-align:middle; position:absolute; top:40%; line-height:100px; font-style:italic;}
	
	/* 게시글 */
	.postWrapper{width:100%; margin:0% auto; padding-bottom:30px;}
	#titleWrapper{width:100%; margin:5% 0;}
	#title{font-size:3em; width:900px; height:60px; text-align:center; display:block; margin:0 auto;}
	#date{color:gray; text-align:right; margin:3%; margin-right:3%;}
	.border{border-bottom:1.2px solid gray; margin-bottom:3%;}
	#groupIntro{margin-left:3%; font-size:1.5em; font-weight:bold; margin:3%;}
	#contents{margin:0 5%;}
	#content {width: 99%; height: 500px;}
	#groupInform{margin-left:3%; font-size:1.5em; font-weight:bold; margin:3%;}
	#informList{margin:0 5%;}
	#informList > li {padding:5px;}
	
	input{height:20px;}
	#personnel{width:80px;}
	#hobbyArea , .locationArea{align:center; width:20%; height:5%; background-color:white;
					border-radius:5px; display:inline-block; margin:0px auto;}
	#hobbyArea > select , .locationArea > select {width:180px; height:25px;}
	#startDate > img{width:30px;}
	.date, .time{padding:5px; height:10px;}
	
	/* 버튼 */
	.buttonArea{width:20%; display:block; margin:30px auto;}
	.buttonArea > button {border-radius:5px; border:0px;  width:45%; height:40px; 
						  cursor:pointer; color:white; font-weight:bold; font-size:18px; display:block; float:left;}
	#insertBtn{background:#888c43; margin-right:5%;}
	#cancleBtn{background:#675141;}
	#inviteBtn{background:#675141; border-radius:5px; border:0px;  width:90px; height:30px; margin-left:20px;
				vertical-align: middle; cursor:pointer; color:white; font-weight:bold; font-size:16px;}
</style>
</head>
<body>
	<header>
		<c:import url='../common/boardCommon.jsp'/>
		<script>
		 	$('#bName').text('동네');
		 	$('#bNameAfter').text('텃밭');
		 	
		 	$('#spanWrapper').click(function(){
		 		location.href="blist.gf";
		 	}).mouseover(function(){
		 		$(this).css('cursor','pointer');
		 	}).mouseout(function(){
		 		$(this).css('cursor','default');
		 	});
		</script>
	</header>
	<section>
		<div id="realMain">
			<div id="postMain">
				<form action="bmodify.gf" id="form" method="post" enctype="Multipart/form-data" accept-charset="UTF-8">
					<div class="thumbnailWrapper">
						<div id="centerd">
							<img id="thumbnailImg" name="thumbnailImg" src="${ contextPath }/resources/uploadFiles/${img.changeName}"/>
						</div>
						<div id="imgGuide">썸네일 이미지를 변경하시려면 클릭하세요</div>
					</div>
					
					<!-- 이미지 자르는 스크립트 -->
					<script>
						var div = $(".thumbnailWrapper") // 이미지를 감싸는 div
						var img = $("#thumbnailImg") // 이미지
						var divAspect = div.height / div.width;
						var imgAspect = img.height / img.width;
						 
						if (imgAspect <= divAspect) {
						    // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
						    var imgWidthActual = div.offsetHeight / imgAspect;
						    var imgWidthToBe = div.offsetHeight / divAspect;
						    var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);
						    img.css({"width":"auto", "height":"100%", "margin-left":$(marginLeft)+"px"});
						    /* img.style.cssText = 'width: auto; height: 100%; margin-left: '
						                      + marginLeft + 'px;' */
						} else {
						    // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
						     img.css({"width":"100%", "height":"auto", "margin-left":"0"});
						    /* img.style.cssText = 'width: 100%; height: auto; margin-left: 0;'; */
						} 
					</script>
					
					<!-- 파일 업로드 하는 부분 -->
					<div id="fileArea">
						<input type="file" id="inputThumbnailImg" multiple="multiple" 
							value="${img.changeName}" name="thumbnailImg" onchange="LoadImg(this,1)">
					</div>
					
					<script>
						// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
						$(function(){
							$("#fileArea").hide();
							
							$(".thumbnailWrapper").click(function(){
								$("#inputThumbnailImg").click();
							});
						});
						
						// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
						function LoadImg(value, num){
							if(value.files && value.files[0]){
								var reader = new FileReader();
								
								reader.onload = function(e){								
									$("#thumbnailImg").attr("src", e.target.result);
								}
								
								reader.readAsDataURL(value.files[0]);
								
								$('#imgGuide').hide();
								$('.thumbnailWrapper').css("border","0px");
								
							}
						}
					</script>
					
				<div class="postWrapper"> 
					<div id="titleWrapper"><input type="text" name="title" id="title" value="${ gf.title }"></div><br>
					<!-- <div id="date">2020.02.16</div> -->
					<div class="border"></div>
					<div id="groupIntro">모임소개</div>
					<div id="contents">
						<textarea name="content" id="content">
							<% pageContext.setAttribute("newLineChar", "\r\n"); %>
							${ fn:replace(gf.content, newLineChar, "<br>") }
						</textarea>
					</div>
					
					<div class="border" style="width:50%; margin:3% auto;"></div>
					<div id="groupInform">상세정보</div>
					<ul id="informList">
						<li>
							<b>취미</b> : 
							<div id="hobbyArea">
								<select name="selectHobby" id="selectHobby">
									<option value="">취미를 선택하세요</option>
									<c:forEach var="h" items="${ hlist }"> <!-- 정의 안될 경우 begin=0 / end=items-1 -->
										<option value="${ h.hobbyNo }">${ h.hobbyName }</option>
									</c:forEach>
								</select>
							</div>
							
							<script>
								$(function(){
									var $select = $("select[name=selectHobby]").children();
									
									for(var i = 0; i < $select.length; i++){
										if('${ gf.hobbyNo }' == $select.eq(i).val()){
											$select.eq(i).attr("selected", "selected");
										}
									}
									categoryChange();
								});
							</script>
						</li>
						<li>
							<b>지역</b> :
							<div class="locationArea">
								<select name="selectSido" class="selectLocation" id="selectSido" onchange="categoryChange();" required>
									<option value=''>시/도 선택</option>
									<option value='서울특별시'>서울특별시</option>
									<option value='경기도'>경기도</option>
									<option value='인천광역시'>인천광역시</option>
									<option value='강원도'>강원도</option>
									<option value='충청북도'>충청북도</option>
									<option value='충청남도'>충청남도</option>
									<option value='대전광역시'>대전광역시</option>
									<option value='세종특별자치시'>세종특별자치시</option>
									<option value='전라북도'>전라북도</option>
									<option value='전라남도'>전라남도</option>
									<option value='광주광역시'>광주광역시</option>
									<option value='대구광역시'>대구광역시</option>
									<option value='경상북도'>경상북도</option>
									<option value='경상남도'>경상남도</option>
									<option value='울산광역시'>울산광역시</option>
									<option value='부산광역시'>부산광역시</option>
									<option value='제주특별자치도'>제주특별자치도</option>
								</select>
							</div>
							<div class="locationArea" id="gugunArea" >
								<select name="selectGugun" class="selectLocation" id="selectGugun" required>
									<option value=''>시/군 을 선택하세요</option>
								</select>
							</div>
							
							<script>
								$(function(){
									var $select = $("select[name=selectSido]").children();
									
									for(var i = 0; i < $select.length; i++){
										if('${ selectedSido }' == $select.eq(i).val()){
											$select.eq(i).attr("selected", "selected");
										}
									}
									categoryChange();
								});
							</script>
							
							<input type="hidden" name="hobby" id="hobby">
							<input type="hidden" name="sido" id="sido">
							<input type="hidden" name="gugun" id="gugun">
							
							<script>
							
								function categoryChange() {
									var sido = $("#selectSido").val();
								    var gugun;
								    
								    var seoul = ['강남구','강동구','강북구','강서구','관악구','광진구',
												'구로구','금천구','노원구','도봉구','동대문구','동작구',
												'마포구','서대문구','서초구','성동구','성북구','송파구',
												'양천구','영등포구','용산구','은평구','종로구','중구','중랑구'];
								    var gyeonggi = ['고양시 덕양구','고양시 일산동구','고양시 일산서구','과천시','광명시',
													'광주시','구리시','군포시','김포시','남양주시','동두천시',
													'부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구',
													'성남시 수정구','성남시 중원구','수원시 권선구','수원시 영통구',
													'수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구',
													'안성시','안양시 동안구','안양시 만안구','양주시','오산시','용인시 기흥구',
													'용인시 수지구','용인시 처인구','의왕시','의정부시','이천시','파주시',
													'평택시','포천시','하남시','화성시','가평군','양평군','여주군','연천군'];
								    var incheon = ['계양구','남구','남동구','동구','부평구','서구', '연수구','중구','강화군','옹진군'];
								    var gangwon = ['강릉시','동해시','삼척시','속초시','원주시','춘천시',
											    	'태백시','고성군','양구군','양양군','영월군','인제군',
											    	'정선군','철원군','평창군','홍천군','화천군','횡성군'];
								    var chungcheong_b = ['제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군',
										 				 '영동군','옥천군','음성군','증평군','진천군','청원군'];
								    var chungcheong_n = ['계룡시','공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군',
														 '부여군','서천군','연기군','예산군','청양군','태안군','홍성군'];
								    var daejeon = ['대덕구','동구','서구','유성구','중구'];
								    var sejong = ['조치원읍', '연기면', '연동면', '부강면', '금남면', '장군면', '연서면', '전의면', 
									  			  '전동면', '소정면', '한솔동', '반곡동', '소담동', '보람동', '대평동', '가람동', 
									  			  '나성동', '새롬동', '다정동', '어진동', '종촌동', '고운동', '아름동', '도담동'];
								    var jeolla_b = ['군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군',
													'무주군','부안군','순창군','완주군','임실군','장수군','진안군'];
								    var jeolla_n = ['광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군',
													'담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군',
													'진도군','함평군','해남군','화순군'];
								    var gwangju = ['광산구','남구','동구','북구','서구'];
								    var daegu = ['남구','달서구','동구','북구','서구','수성구','중구','달성군'];
								    var gyeongsang_b = ['경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시',
														'영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군',
														'영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군'];
								    var gyeongsang_n = ['거제시','김해시','마산시','밀양시','사천시','양산시','진주시',
														'진해시','창원시','통영시','거창군','고성군','남해군','산청군',
														'의령군','창녕군','하동군','함안군','함양군','합천군'];
								    var ulsan = ['남구','동구','북구','중구','울주군'];
								    var busan = ['강서구','금정구','남구','동구','동래구','부산진구',
												'북구','사상구','사하구','서구','수영구','연제구',
												'영도구','중구','해운대구','기장군'];
								    var jeju = ['제주시','서귀포시'];
								    
								    switch(sido){
								    	case "" : gugun = gugun; break;
								    	case "서울특별시" : gugun = seoul; break;
								    	case "경기도" : gugun = gyeonggi; break;
								    	case "인천광역시" : gugun = incheon; break;
								    	case "강원도" : gugun=gangwon; break;
								    	case "충청북도" : gugun=chungcheong_b; break;
								    	case "충청남도" : gugun=chungcheong_n; break;
								    	case "대전광역시" : gugun=daejeon; break;
								    	case "세종특별자치시" : gugun=sejong; break;
								    	case "전라북도" : gugun=jeolla_b; break;
								    	case "전라남도" : gugun=jeolla_n; break;
								    	case "광주광역시" : gugun=gwangju; break;
								    	case "대구광역시" : gugun=daegu; break;
								    	case "경상북도" : gugun=gyeongsang_b; break;
								    	case "경상남도" : gugun=gyeongsang_n; break;
								    	case "울산광역시" : gugun=ulsan; break;
								    	case "부산광역시" : gugun=busan; break;
								    	case "제주특별자치도" : gugun=jeju; break;
								    }
							
								    $('#selectGugun').empty();
								    
								    for(var i in gugun){           
										if('${selectedgugun}' == gugun[i]){
										 	var option = $("<option value='"+gugun[i]+"' selected>"+gugun[i]+"</option>");
										} else {
										 	var option = $("<option value='"+gugun[i]+"'>"+gugun[i]+"</option>");
										}
									     $('#selectGugun').append(option);
									}
							
								}
							</script>
						</li>
						
						<li>
							<b>인원</b> : 최대 <input type="number" name="personnel" id="personnel" min=2 value=${ gf.personnel }> 명
							<c:url var="friends" value="fdList.gf"/>
							<button id="inviteBtn" type="button" onclick="invite();">친구 초대</button>
							<input type="hidden" name="inviteFriends" id="inviteFriends">
							<script>
								function invite(){
									 //var data = document.querySelector('#friends').value;
									var child
									var friendsPopup;						
									fdPopup = window.open('${friends}', 'friendsPopup', 'width=490, height=605, menubar=no, status=no, toolbar=no, resizable=no');
									
								}
							</script>
						</li>
						<li>
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
							<input type="hidden" name="todayDate" value="${today}">
							
							<b>시작</b> : <input type="text" class="date" id="startDate" name="startDate" placeholder="YYYY-MM-DD" readonly="readonly" ><br>
							<b>마감</b> : <input type="text" class="date" id="endDate" name="endDate" placeholder="YYYY-MM-DD" readonly="readonly"><br>
							<script type="text/javascript">
								$(function(){
									$(".date").datepicker({
						                dateFormat: 'yy-mm-dd' //Input Display Format 변경
						                ,showOtherMonths: false //빈 공간에 현재월의 앞뒤월의 날짜를 표시
						                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
						                ,changeYear: true //콤보박스에서 년 선택 가능
						                ,changeMonth: true //콤보박스에서 월 선택 가능                
						                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
						                ,buttonImage: "${ contextPath }/resources/images/calendar.png" //버튼 이미지 경로
						                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
						                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
						                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
						                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
						                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
						                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
						                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
						                ,minDate: "0" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						                ,maxDate: "+10Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
						            });
									
									$("#startDate").datepicker();                    
						            $("#endDate").datepicker();
						            
						            //초기값을 오늘 날짜로 설정
						            $('#startDate').datepicker('setDate', '${ gf.startDate }'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
						            $('#endDate').datepicker('setDate', '${ gf.endDate }'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
								
						            $('img.ui-datepicker-trigger').css({'cursor':'pointer', 'width':'30px', 'vertical-align':'middle', 'padding':'10px'});
								});
							</script>
						</li>
						<li><b>요일</b> :
							<input type="checkbox" name="days" class="days" value="월">월요일
							<input type="checkbox" name="days" class="days" value="화">화요일
							<input type="checkbox" name="days" class="days" value="수">수요일
							<input type="checkbox" name="days" class="days" value="목">목요일
							<input type="checkbox" name="days" class="days" value="금">금요일
							<input type="checkbox" name="days" class="days" value="토">토요일
							<input type="checkbox" name="days" class="days" value="일">일요일
							<input type="hidden" name="day" id="day">
							
							<%-- <c:set var="checkedDays" value="${fn:split(gf.day,',')}"/>
							<c:forEach var="checkedDay" items="${ days }">
								${ day }
							</c:forEach> --%>
							
							<!-- 작성자가 선택한 요일 script -->
							<script>
								var checkedDays = "${ gf.day }";
								var checkedDay = checkedDays.split(',');
								
								console.log('gf : ' + checkedDays);
								console.log('gf.split : ' + checkedDay);
								
								$('input:checkbox[name=days]').each(function(){
									for(var i in checkedDay) {
										if(checkedDay[i] == $(this).val()){
											$(this).prop('checked', true);
										}
					   				};
								});
							</script>
							
							<!-- 날짜 체크 스크립트 -->
							<script type="text/javascript">

								var days = $("input:checkbox[name=days]");
								var check = $("input:checkbox[name=days]:checked");
								var length = $("input:checkbox:checked").length;
								
								var items = [];
								
								$("input:checkbox[name=days]").change(function(){
									if ($(this).is(':checked')) {
										for(var i=0; i <= length; i++){
											items.push($(this).val());
										};
						            }

									$('#day').val(items);
								});
								
								function selectDay(){
									console.log($('#day').val());
								}
								
							</script>
						</li>
						
						<li><b>시간</b> : <input type="text"  class="time" name="startHour" id="startHour" value="09:00"/> 
							~ <input type="text" class="time" name="endHour" id="endHour" value="10:00"/>
						
						<script type="text/javascript">
							$(function(){
								$('#startHour').timepicker({
								    timeFormat: 'H:mm',
								    interval: 60,
								    minTime: '09',
								    maxTime: '22:00',
								    defaultTime: '${fn:substring(gf.startHour, 0, 2)}',
								    startTime: '09:00',
								    dynamic: false,
								    dropdown: true,
								    scrollbar: true
								});
								
								$("#startHour").timepicker();
								
								$('#endHour').timepicker({
								    timeFormat: 'H:mm',
								    interval: 60,
								    minTime: '10',
								    maxTime: '23:00',
								    defaultTime: '${fn:substring(gf.endHour, 0, 2)}',
								    startTime: '10:00',
								    dynamic: false,
								    dropdown: true,
								    scrollbar: true
								});
								
								$("#endHour").timepicker();
							});
							
						</script>
						</li>
						<li>
							<b>지도 강사</b> : 
							<input type="radio" name="offerYN" value="Y" id="offerY"/>구인함
							<input type="radio" name="offerYN" value="N" id="offerN"/>구인안함
							
							<script>
								var offerYN = '${ gf.offerYN }';
								
								if(offerYN == 'Y'){
									$('#offerY').prop('checked',true);
								} else {
									$('#offerN').prop('checked',true);
								}
							</script>
						</li>
					</ul>
				</div>
				<input type="hidden" name="writer" value="${ loginUser.userId }"/>
			</form>
			</div>
			<div class="buttonArea">
				<!-- <button id="insertBtn" onclick="ok();">확인하기</button> -->
				<button type="button" id="insertBtn" onclick="modify();">수정 완료</button>
				<button type="button" id="cancleBtn" onclick="cancle();">취소</button>
				<div class="clear-both"></div>
			</div>
			
			<script>
			
				function modify(){
					if(personnel < '${ gfa.size() }'){
						swal({
	  						title : '인워 수를 다시 설정해주세요!',
	  						text : '현재 참가 인원보다 모집 인원을 적게 설정하실 수 없습니다',
	  						icon : 'info',
	  					});
					} else{
						
					}
				}
				
				function cancle(){
					location.href="blist.gf?postNo="+${gf.postNo}+"&page="+'${page}';
				}
			</script>
			
	</div>
	</section>
	
	<!-- 스마트 에디터 + 글 작성 -->
	<script type="text/javascript"> 
		$(function(){
			
			var editor_object = [];
			
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: editor_object,
				elPlaceHolder: "content",
				sSkinURI: "${ contextPath }/resources/smarteditor2/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true,
					bUseVerticalResizer : true,
					bUseModeChanger : true,
				}
			});
			
			// 글 작성
			$('#insertBtn').click(function(){
				editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);// 에디터의 내용이 textarea에 적용됩니다.
				
				var dateVaildate = true;
	            var hourVaildate = true;
	            var dayVaildate = true;

	            //도시 선택
	            $('#sido').val($('#selectSido').val());
	            $('#gugun').val($('#selectGugun').val());
	            $('#hobby').val($('#selectHobby').val());
	                  
	           /*  //요일 선택
                 	var check = $("input:checkbox[name=days]:checked");
                 	var length = $("input:checkbox:checked").length;
	                  
                // 체크
                .days.attr("checked", true);
                // 체크 해제
                days.removeAttr("checked"); */
                  
                
                var dayArr = [];
                var cnt = 0;
                var days = $(".days");

                for(i=0;i<days.length;i++) {
                    if (days[i].checked == true){
                    	dayArr[cnt] = days[i].value;
                        cnt++;
                    }
                }

                $("#day").val(dayArr);
                
                if($("#inputThumbnailImg").val() == ""){
                	//alert("대표이미지를 선택해주세요.");
  					swal({
  						title : '대표 이미지를 선택해주세요!',
  						text : '다른 회원들에게 좀 더 많은 정보를 제공해 주세요.',
  						icon : 'info',
  					});
  					return false;
  				} else if($('#title').val() == "") {
  					//alert("제목을 입력해주세요.");
  					swal({
  						title : '제목을 입력해주세요!',
  						text : '어떤 모임인지 작성해주세요.',
  						icon : 'info',
  					});
  					return false;
  				} else if($('#content').val() == "" || $('#content').val() == null) {
  					//alert("모임 소개를 작성해주세요.");
  					swal({
  						title : '모임 소개를 작성해주세요!',
  						text : '다른 회원들에게 구하는 모임에 대해 좀 더 많은 정보를 제공해주세요.',
  						icon : 'info',
  					});
  					return false;
  				} else if($('#hobby').val() == "") {
  					//alert("모임의 취미를 선택해주세요.");
  					swal({
  						title : '모임의 취미를 선택해주세요!',
  						text : '다른 회원들에게 구하는 모임에 대해 좀 더 많은 정보를 제공해주세요.',
  						icon : 'info',
  					});
  					return false;
  				} else if($('#sido').val() == "") {
  					//alert("모임 지역을 선택해주세요.");
  					swal({
  						title : '모임 지역을 선택해주세요!',
  						text : '다른 회원들에게 모임에 대해 좀 더 많은 정보를 제공해주세요.',
  						icon : 'info',
  					});
  					return false;
  				} else if($('#personnel').val() == "0"){
  					//alert("모임 인원을 선택해주세요.");
  					swal({
  						title : '모임 인원을 선택해주세요!',
  						text : '회원님을 제외한 모임 인원에 대해 설정해주세요.',
  						icon : 'info',
  					});
  					return false;
  				} else if($('#day').val() == ""){
  					//alert("요일을 선택해주세요.");
  					swal({
  						title : '요일을 선택해주세요!',
  						text : '회원님이 구하는 모임은 주로 무슨 요일에 만나는지 선택해주세요. 다중 선택이 가능합니다.',
  						icon : 'info',
  					});
  					return false;
  				} else if($('#startHour').val() == ""){
  					//alert("모임이 시작하는 시간을 선택해주세요.");
  					swal({
  						title : '모임이 시작하는 시간을 선택해주세요!',
  						text : '회원님이 구하는 모임은 주로 몇시에 만나는지 선택해주세요.',
  						icon : 'info',
  					});
  					return false;
  				} else if($('#endHour').val() == ""){
  					//alert("모임이 끝나는 시간을 선택해주세요");
  					swal({
  						title : '모임이 끝나는 시간을 선택해주세요!',
  						text : '회원님이 구하는 모임은 몇시에 끝나는지 선택해주세요.',
  						icon : 'info',
  					});
  					return false;
  				} else if($('#startDate').val() > $('#endDate').val()){
  					//alert("마감 날짜는 시작 날짜보다 빠를 수 없습니다.");
  					swal({
  						title : '마감 날짜를 다시 선택해주세요!',
  						text : '마감 날짜는 시작 날짜보다 빠를 수 없습니다.',
  						icon : 'error',
  					});
  					return false;
  				} else if(/* $('#startHour').val() > $('#endHour').val() 
  							||  */$('#startHour').val() == $('#endHour').val() ){
                     //alert("마감 시간을 다시 설정해주세요.");
                     swal({
   						title : '마감 시간을 다시 선택해주세요!',
   						text : '모임이 끝나는 시간은 만나는 시간보다 빠를 수 없습니다.',
   						icon : 'error',
   					});
                     return false;
                }/*  else if(confirm("글을 작성하시겠습니까?")){
                	
                	
                	$('#form').submit();
                } */
                else{
                	swal({
                		  title: "글을 작성하시겠습니까?",
                		  text: "회원님이 모집하시는 모임이 모임 텃밭에 등록됩니다.",
                		  icon: "warning",
                		  buttons: true,
                		  dangerMode: true,
                		  buttons: ["취소", "확인"]
                		})
                		.then(확인 => {
                		  if(확인) {
                		    $('#form').submit();
                		    swal("모임 텃밭에 등록되었습니다.", {
                		      icon: "success",
                		      button: false,
                		    });
                		  } else {
                		    swal("준비가 완료되시면 등록해주세요!");
                		  }
                		});
                }
			});
			
		});
	</script>
</body>
</html>
