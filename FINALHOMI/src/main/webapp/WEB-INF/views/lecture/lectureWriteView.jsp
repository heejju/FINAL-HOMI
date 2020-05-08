<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@include file="../common/boardCommon.jsp"%>
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<title>모종 구하기 - 글쓰기</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
	body, html, div{padding: 0; margin:0; line-height: normal;}
	br{line-height: 30%;}
	hr, h3{margin: 10px 0 10px 0;}
	p{margin-bottom: 10px; margin-top: 10px; vertical-align: middle;}
	hr{color: gray;}
	.green{color: rgb(136, 140, 67);}
	.brown{color: rgb(103, 81, 65);}
	.lightgray{color: lightgray;}
	.cancleLine{color: #ccc;}
	.greenOP{color: rgb(136, 140, 67); font-weight: bold;}
	
	
	
	.inputS{
		font-weight: bold; border: 0px; height: 21px;
		padding: 0 5px 0 5px;
	}
	.title{
		width: 90%; height: 42px; font-size: 20px; color: rgb(136, 140, 67);
		font-weight: bold; overflow: hidden; resize: none;
	}
	
	div.firstBody{
		background: white; padding: 10px 0 50px 0; width: 80%; margin: 0 auto;
		
	}
	
	div.header{
		padding-top: 20px; height: auto;
		width: 100%;
	}
	
	div.header > div.titleImgArea{
		width : 45%; height: 245px; border: 1px solid lightgray; box-sizing:border-box;
		margin: 0 0 0 4%; display: inline-block; float: none; padding:5px; text-align: center;
	}
	
	div.header > div.firstInfo {
		text-align:left; padding: 0 0 0 20px;
		width: 45%; height: auto; border: 1px solid lightgray;
		display: inline-block; float: right; margin: 0 4% 0 0; box-sizing:border-box;
	}
	div.firstInfo  select{
		border: 2px solid rgb(103, 81, 65); border-radius: 5px; height: 27px;
		font-weight: bold; vertical-align: middle;
	}
	::placeholder { text-align: center; color: lightgray; vertical-align: middle;}
	
	textarea{
		width: 100%; height: 300px; border: 1px solid lightgray
	}
	
	.selectLocation{
		height:40px; border: 3px solid rgb(103, 81, 65); text-align-last : center; width: 170px;
		font-weight: bold; border-radius: 5px; font-size: 20px; box-sizing: border-box; vertical-align: middle;
	}
	button.ablePlaceDeleteBtn {
		font-size: 15px; font-weight: bold; height: 30px; box-sizing: border-box;
		border: 0px solid rgb(103, 81, 65); border-radius: 5px; background: rgb(136, 140, 67); color: white;
	}
	
	.gugunList{
		position: absolute; display: none; background: white;
		height:auto; border: 3px solid rgb(103, 81, 65); text-align-last : center; width: 200px;
		font-weight: bold; border-radius: 5px; font-size: 20px; box-sizing: border-box;
	}
	.gugunList > li{
		border-bottom: 2px solid rgb(103, 81, 65);
	}
	.checkboxST{
		vertical-align: middle; width: 17px; height: 17px; text-align: center;
	}
	input.dateSelect{
		height:40px; border: 2px solid rgb(103, 81, 65); text-align:center; width: 120px; padding: 0; vertical-align: middle;
		font-weight: bold; border-radius: 5px; font-size: 20px; box-sizing: border-box; color: rgb(136, 140, 67);
	}
	select.timeSelect{
		height:40px; border: 2px solid rgb(103, 81, 65); text-align:center; width: 110px; text-align-last: center; vertical-align:middle;
		font-weight: bold; border-radius: 5px; font-size: 20px; box-sizing: border-box; color: rgb(136, 140, 67); padding: 1px 0 0 0;
	}
	select.timeSelect > option{
		height:40px; border: 2px solid rgb(103, 81, 65); text-align:center; width: 50px;
		font-weight: bold; border-radius: 5px; font-size: 20px; box-sizing: border-box;
	}
	button.addBtn{
		background: rgb(136, 140, 67); color: white; font-size: 20px; font-weight: bold; height: 35px; width: 75px;
		border: 0px solid white; border-radius: 5px; vertical-align: middle; text-align: center; cursor: pointer;
	}
	
	
	div.date{
		height: 40px; border: 2px solid rgb(103, 81, 65); text-align:center; display: inline-block; width: 95px; cursor: pointer;
		font-weight: bold; border-radius: 5px; font-size: 20px; box-sizing: border-box; color: rgb(103, 81, 65);
	}
	div.time{
		height: 120px; border: 2px solid rgb(103, 81, 65); text-align:center; display: inline-block; width: 95px;
		font-weight: bold; border-radius: 5px; font-size: 20px; box-sizing: border-box; color:rgb(136, 140, 67);
		overflow: auto;
	}
	input.insertBtn{
		background: rgb(136, 140, 67); color: white; font-size: 20px; font-weight: bold; height: 35px; width: 75px;
		border: 0px solid white; border-radius: 5px; vertical-align: middle; text-align: center; cursor: pointer;
	}
	input.cancleBtn{
		background: rgb(103, 81, 65); color: white; font-size: 20px; font-weight: bold; height: 35px; width: 75px;
		border: 0px solid white; border-radius: 5px; vertical-align: middle; text-align: center; cursor: pointer;
	}
	span.selectDong{
		vertical-align: middle; cursor: pointer; line-height: 36px; color: rgb(136,140,67);
	}
	
</style>
</head>
<body style="background: #fff6f0;">
	<div class=firstBody>
	<form method="post" action="insertLecture.lec" onsubmit="return beforeSubmit();" enctype="Multipart/form-data">
	
		<input type="hidden" id=allDate name=allDate>
		<input type="hidden" name="writer" value="${ loginUser.userId }">
		<input type="hidden" name="nickName" value="${ loginUser.nickName }">
		<div class="header">
			<br>
			<div class="titleImgArea" id=titleImgArea>
				<img id=titleImg style="width: auto; height: 100%;">
			</div>
			<div id="fileArea">
				<input type="file" id="thumbnailImg" multiple="multiple" name="thumbnailImg" onchange="LoadImg(this)">
			</div>
			<script>
				$(function(){
					var height = $("div.firstInfo");
					$("div.titleImgArea").css("height",$("div.firstInfo")[0].offsetHeight+"px");
				});
				$(window).resize(function(){
					$("div.titleImgArea").css("height",$("div.firstInfo")[0].offsetHeight+"px");
				});
				
				$(function(){
					$("#fileArea").hide();
					
					$("#titleImgArea").click(function(){
						$("#thumbnailImg").click();
					});
				});
				
				function LoadImg(value){
					if(value.files && value.files[0]){
						var reader = new FileReader();
						reader.onload = function(e){								
							$("#titleImg").attr("src", e.target.result);
						}
						reader.readAsDataURL(value.files[0]);
					}
				}
			</script>
			
			
			<div class="firstInfo">
				<br>
				<textarea class="title" id='title' name='title' placeholder="제목을 입력해주세요."></textarea>
				<p>
					<b class="green" style="vertical-align: middle;">카테고리 : </b>
					<select name="hobbyNo" id='hobbyNo'><!-- DB에서 불러오기 -->
						<option style="color: lightgray" value='0'>선택</option>
						<c:forEach var="hobby" items="${ hList }">
							<option value="${ hobby.hobbyNo }">${ hobby.hobbyName }</option>
						</c:forEach>
					</select>
				</p>
				<p>
				<b class="green">회당 강의료: </b><b class="brown"><input onkeyup="numberVal(this);" onkeydown="return notMinusAndPlus(this);" name="otTuition" id='otTuition' min="0" type="Number" class="brown inputS" placeholder="수강료를 입력해주세요." style="text-align: right;">원</b>
				</p>
				<p>
				<b class="green">회당 시간: </b><b class="brown"><input onkeyup="numberVal(this);" onkeydown="return notMinusAndPlus(this);" name="otTime" id='otTime' type="text" class="brown inputS" placeholder="회당 시간을 입력해주세요" style="text-align: right;">시간</b>
				</p>
				<p>
				<b class="green">총 횟수: </b><b class="brown"><input onkeyup="numberVal(this);" onkeydown="return notMinusAndPlus(this);" name="otAllTime" id='otAllTime' min="0" type="Number" class="brown inputS" placeholder="총횟수를 입력해주세요" style="text-align: right;">회</b>
				</p>
				<script>
					// 강의 가격 횟수 총횟수에 -나 0이 앞자리에 오지 않게하기
					function numberVal(e){
						var val = $(e).val();
						if(val < 0){
							$(e).val('0');
						} else if(val.length > 1){
							if(val.charAt(0) == 0){
								var val2 = val.toString().substring(1, val.length);
								$(e).val(val2);
							}
						}
					}
					
					function notMinusAndPlus(d) {
						var e = event;
						if(e.keyCode == 37 || e.keyCode == 39){
							return true;
						}
					    if(!((e.keyCode > 95 && e.keyCode < 106)
					      || (e.keyCode > 47 && e.keyCode < 58)
					      || e.keyCode == 8)) {
					        return false;
						}
					    var name = $(d);
					    if($("#allDate").val() != ""){
						    if(name[0].name == "otTime"){
						    	var isTrue = confirm("회당 시간을 바꾸면 지금까지 추가한 시간이 삭제됩니다. 정말로 삭제하시나요?");
						    	if(isTrue){
						    		ableTimeReset();
						    	} else {
						    		return false;
						    	}
						    }
					    }
					   
					   return true;
					    
					}
					
					function ableTimeReset(){
						$("#allDate").val("");
						var divTime = $("div.time");
						for(var i = 0; i < divTime.length; i++){
							divTime.eq(i).empty();
						}
						allDate = new Array();
					}
				</script>
				
				<p>
				<b class="green">수강 대상: </b>
					<b class="brown">
						<select name="learner" id='learner'><!-- DB에서 불러오기 -->
							<option style="color: lightgray" value="">선택</option>
							<option value="low">초급자</option>
							<option value="middle">중급자</option>
							<option value="high">고급자</option>
						</select>
					</b>
				</p>
			
			
			</div>
		</div>
		<br clear="all">
		<hr>
		
		<div id='content2' style="width: 80%; margin: 0 auto; text-align: center;">
			<br>
			<b class="green" style="font-size: 20px;">수업소개</b><br><br>
			<br><br>
			
			<textarea id="summernote1" name="content"></textarea>
			
			<script>
				/* 썸머노트 관련 설정 */
				$(document).ready(function() {
				     $('#summernote1').summernote({
				             height: 300,                 // set editor height
				             toolbar: [
				     		    ['style', ['style']],
				     		    ['font', ['bold', 'italic', 'underline', 'clear']],
				     		    ['fontname', ['fontname']],
				     		    ['color', ['color']],
				     		    ['para', ['ul', 'ol', 'paragraph']],
				     		    ['height', ['height']],
				     		    ['insert', ['link', 'hr']],
				     		  ]
				     });
				     $('#summernote2').summernote({
			             height: 300,                 // set editor height
			             toolbar: [
			     		    ['style', ['style']],
			     		    ['font', ['bold', 'italic', 'underline', 'clear']],
			     		    ['fontname', ['fontname']],
			     		    ['color', ['color']],
			     		    ['para', ['ul', 'ol', 'paragraph']],
			     		    ['height', ['height']],
			     		    ['insert', ['link', 'hr']],
			     		  ]
			     });
				});
			
			</script>
			
			<br><br>
			<b class="brown" style="font-size: 20px;">강사소개</b><br><br>
			<br><br>
			
			<textarea id="summernote2" name="teacherInfo"></textarea>
			
			<div id="ableArea">
				<br><br>
				<b class="brown" style="font-size: 20px;">가능한 장소</b><br><br>
				<div>
					<div class="place" style="vertical-align: middle" id="place0">
						<select name="sido0" class="selectLocation lightgray" id="sido" onchange="sidoChange(this)">
							<option value=''>시/도 선택</option>
							<option value='서울특별시' class="greenOP">서울특별시</option>
							<option value='경기도' class="greenOP">경기도</option>
							<option value='인천광역시' class="greenOP">인천광역시</option>
							<option value='강원도' class="greenOP">강원도</option>
							<option value='충청북도' class="greenOP">충청북도</option>
							<option value='충청남도' class="greenOP">충청남도</option>
							<option value='대전광역시' class="greenOP">대전광역시</option>
							<option value='세종특별자치시' class="greenOP">세종특별자치시</option>
							<option value='전라북도' class="greenOP">전라북도</option>
							<option value='전라남도' class="greenOP">전라남도</option>
							<option value='광주광역시' class="greenOP">광주광역시</option>
							<option value='대구광역시' class="greenOP">대구광역시</option>
							<option value='경상북도' class="greenOP">경상북도</option>
							<option value='경상남도' class="greenOP">경상남도</option>
							<option value='울산광역시' class="greenOP">울산광역시</option>
							<option value='부산광역시' class="greenOP">부산광역시</option>
							<option value='제주특별자치도' class="greenOP">제주특별자치도</option>
						</select>
						
						<i class="fas fa-chevron-circle-right" style="width: 30px; height: 30px; vertical-align: middle; color: rgb(103, 81, 65);"></i>
						
						<select name="gugun0" class="selectLocation lightgray" id="gugun" onchange="gugunChange(this);">
							<option value=''>구/군 선택</option>
						</select>
						
						<i class="fas fa-chevron-circle-right" style="width: 30px; height: 30px; vertical-align: middle; color: rgb(103, 81, 65);"></i>
						
						<div class="selectLocation" id="selectDong" style="display: inline-block;" onmouseleave="closeGugun(this);">
							<div style="display: inline-block;"><span style='vertical-align:middle; line-height: 36px;' class='lightgray'>동 선택</span></div>
							<ul id='dong' class="gugunList green">
							</ul>
						</div>
						<hr>
					</div>
				</div>
				
				
			</div>
			<div><!-- 가능한 장소의 마지막한줄을 지우는 곳 -->
				<button class='ablePlaceDeleteBtn' type='button' onclick='ablePlaceDeleteBtn();'>마지막 줄 삭제하기</button>
				<hr>
				<script>
					function ablePlaceDeleteBtn(){
						var i = placeCount - 1;
						var j = placeCount;
						if(placeCount == 1){
							return;
						}
						placeCount -= 1;
						$("select[name=sido"+i+"]").parent().parent()[0].outerHTML = "";
						$("select[name=sido"+j+"]").attr({"name":"sido"+i});
						$("select[name=sido"+i+"]").parent().attr("id","place"+i);
						$("select[name=gugun"+j+"]").attr("name","gugun"+i);
					}
				</script>
			</div>
			
			
			<br><br>
			
			
			<div id=ableTime> <!-- 가능한 시간 시작부분 -->
				<div>
					<b class="green" style="font-size: 20px;">가능한 시간</b><br><br>
				</div>
				<br>
				<div><!-- 좌우 버튼 날짜선택, 시간선택부분 -->
					<div style="display: inline-block; cursor: pointer;">
						<i onclick="beforeCal();" class="fas fa-chevron-circle-left" style="width: 30px; height: 30px; vertical-align: middle; color: rgb(103, 81, 65);"></i>
					</div>
					<div style="display: inline-block;">
						<input type=text class="dateSelect" readonly="readonly" value="날짜선택" onchange="ableTimeController(this);">
						
						<select class="timeSelect" id="timeSelect">
							<option class='lightgray'>시간선택</option>
							<option>09:00</option>
							<option>10:00</option>
							<option>11:00</option>
							<option>12:00</option>
							<option>13:00</option>
							<option>14:00</option>
							<option>15:00</option>
							<option>16:00</option>
							<option>17:00</option>
							<option>18:00</option>
							<option>19:00</option>
							<option>20:00</option>
							<option>21:00</option>
							<option>22:00</option>
						</select>
						<button type="button" class="addBtn" id="addBtn">추가</button>
					</div>
					<div  style="display: inline-block; cursor: pointer;">
						<i onclick="nextCal();" class="fas fa-chevron-circle-right" style="width: 30px; height: 30px; vertical-align: middle; color: rgb(103, 81, 65);"></i>
					</div>
					
					<br>
					<br>
					
					<div id=calendar style="font-size: 0px;">
						<%for(int i = 0; i < 7; i++) {%>
						<div id=calDate style="display: inline-block;">
							<div class="date"></div>
							<br>
							<div class="time"></div>
						</div>
						<%}%>
					</div>
					
					<script>
						// 처음 로딩 될때 알맞은 날짜 넣기
						var date = new Date();
						$(function(){
							if(0 < date.getDay()){
								var to1 = date.getDay();
								date.setDate(date.getDate() - to1);
							}
							for(var i = 0; i < $("div.date").length; i++){
								var month;
								if(date.getMonth()+1 < 10){
									month = "0"+(date.getMonth()+1);
								} else {
									month = date.getMonth()+1;
								}
								
								var stringDate;
								if(date.getDate() < 10){
									stringDate = "0"+date.getDate();
								} else {
									stringDate = date.getDate();
								}
								
								var weekday = new Array(7);
								weekday[0] = "일";
								weekday[1] = "월";
								weekday[2] = "화";
								weekday[3] = "수";
								weekday[4] = "목";
								weekday[5] = "금";
								weekday[6] = "토";
								var n = weekday[date.getDay()];
								
								$("div.date").eq(i)[0].innerHTML = "<span style='vertical-align: middle;'>"+month+"/"+stringDate+"("+n+")<input id='"+month+"/"+stringDate+"("+n+")' type='hidden' value='"+date.getFullYear()+"/"+month+"/"+stringDate+"'></span>";
								date.setDate(date.getDate()+1);
							}
						});
						
						function beforeCal(){
							date.setDate(date.getDate()-8);
							if(0 < date.getDay()){
								var to1 = date.getDay();
								date.setDate(date.getDate() - to1);
							}
							for(var i = 0; i < $("div.date").length; i++){
								var month;
								if(date.getMonth()+1 < 10){
									month = "0"+(date.getMonth()+1);
								} else {
									month = date.getMonth()+1;
								}
								
								var stringDate;
								if(date.getDate() < 10){
									stringDate = "0"+date.getDate();
								} else {
									stringDate = date.getDate();
								}
								var weekday = new Array(7);
								weekday[0] = "일";
								weekday[1] = "월";
								weekday[2] = "화";
								weekday[3] = "수";
								weekday[4] = "목";
								weekday[5] = "금";
								weekday[6] = "토";
								var n = weekday[date.getDay()];
								
								$("div.date").eq(i)[0].innerHTML = "<span style='vertical-align: middle;'>"+month+"/"+stringDate+"("+n+")<input id='"+month+"/"+stringDate+"("+n+")' type='hidden' value='"+date.getFullYear()+"/"+month+"/"+stringDate+"'></span>";
								date.setDate(date.getDate()+1);
								
							}
							//전주로 갈때 추가되어있던 시간들을 초기화함
							for(var i = 0; i < $("div.time").length; i++){
								$("div.time").eq(i)[0].innerHTML = "";
							}
							
							if(allDate.length > 0){
								for(var i = 0; i < $("div.date").length; i++){//다음주의 모든일자에서
									for(var j = 0; j < allDate.length; j++){//allDate의 모든일자와 같은게 있는지
										if($("div.date").eq(i)[0].innerText == allDate[j][0]){// 만약 저장되어잇는 날짜가 있다면
											//allDate[j].length만큼 (저장되어있는시간의개수) 돌면서 innerText추가
											for(var k = 1; k < allDate[j].length; k++){
												$("div.time").eq(i)[0].innerHTML += "<div onclick='return deleteTime(this);'>"+allDate[j][k]+":00</div>";
											}
											
										}
									}
									
								}
							}
						}
					
						function nextCal(){
							for(var i = 0; i < $("div.date").length; i++){
								var month;
								if(date.getMonth()+1 < 10){
									month = "0"+(date.getMonth()+1);
								} else {
									month = date.getMonth()+1;
								}
								
								var stringDate;
								if(date.getDate() < 10){
									stringDate = "0"+date.getDate();
								} else {
									stringDate = date.getDate();
								}
								var weekday = new Array(7);
								weekday[0] = "일";
								weekday[1] = "월";
								weekday[2] = "화";
								weekday[3] = "수";
								weekday[4] = "목";
								weekday[5] = "금";
								weekday[6] = "토";
								var n = weekday[date.getDay()];
								
								$("div.date").eq(i)[0].innerHTML = "<span style='vertical-align: middle;'>"+month+"/"+stringDate+"("+n+")<input id='"+month+"/"+stringDate+"("+n+")' type='hidden' value='"+date.getFullYear()+"/"+month+"/"+stringDate+"'></span>";
								date.setDate(date.getDate()+1);
								
							}
							
							for(var i = 0; i < $("div.time").length; i++){
								$("div.time").eq(i)[0].innerHTML = "";
							}
							
							if(allDate.length > 0){
								for(var i = 0; i < $("div.date").length; i++){//다음주의 모든일자에서
									for(var j = 0; j < allDate.length; j++){//allDate의 모든일자와 같은게 있는지
										if($("div.date").eq(i)[0].innerText == allDate[j][0]){// 만약 저장되어잇는 날짜가 있다면
											//allDate[j].length만큼 (저장되어있는시간의개수) 돌면서 innerText추가
											for(var k = 1; k < allDate[j].length; k++){
												$("div.time").eq(i)[0].innerHTML += "<div onclick='return deleteTime(this);'>"+allDate[j][k]+":00</div>";
											}
											
										}
									}
									
								}
							}
							
						}
						// 가능한 시간에서  날짜를 눌렀을 떄 날짜 선택에 해당 날짜가 표시되도록하게 만들기
						$("div.date").click(function(){
							var dayInfo = $(this).children().children().eq(0).val().split("/");
							
							var today = new Date();
							
							var clickDay = new Date(dayInfo[0], dayInfo[1]-1, dayInfo[2]);
							if($("#otTime").val() == "" || $("#otTime").val() == 0){
								swal("회당 시간을 먼저입력해주세요.",{
									icon : "warning",
									buttons : {
										confirm : true,
									}
								});
								return false;
							}
							if(today > clickDay){
								swal("오늘 날짜 이후로 선택해주세요.",{
									icon : "warning",
									buttons : {
										confirm : true,
									}
								});
							} else {
								$("input.dateSelect").val($(this)[0].innerText);
							}
							ableTimeController();
						});
						
						// 추가된 시간의 모든정보를 담는 2차원배열 1번째는 날짜저장 2번재는 해당날짜에 추가되었던 시간저장
						var allDate = new Array();
						// 가능한 시간에서 추가버튼 누르면 고른 날짜 + 시간을 맞춰서 넣기
						$("#addBtn").click(function(){
							var selectDate = $(this).parent().children().eq(0).val();
							var selectTime = $(this).parent().children().eq(1).val();
							if( selectDate != "날짜선택"){
								if(selectTime != "시간선택"){
									var inDate = true;
									for(var i = 0; i < $("div.date").length; i++){
										if( $("div.date").eq(i)[0].innerText == selectDate){
											//이미추가되어있는시간은이제 disabled이다.
											/*for(var j = 0; j < $("div.date").eq(i).parent().children().eq(2).children().length; j++){
												if($("div.date").eq(i).parent().children().eq(2).children().eq(j)[0].innerText == selectTime){
													swal("이미 추가되어 있는 시간입니다.",{
														icon : "warning",
														buttons : {
															confirm : true,
														}
													});
													return;
												}
											}*/
											// 먼저 추가되어 있던 시간들을 가져온다
											var timeArr = new Array();
											for(var j = 0; j < $("div.date").eq(i).parent().children().eq(2).children().length; j++){
												timeArr[j] = $("div.date").eq(i).parent().children().eq(2).children().eq(j)[0].innerText.substring(0,2);
											}
											// 가져온곳에서 시간들을 지운다
											$("div.date").eq(i).parent().children().eq(2)[0].innerHTML = "";
											// timeArr에 담겨있는 시간과 추가할 시간을 비교해서 시간순으로 올바르게 담는다 sort()사용
											timeArr[timeArr.length] = selectTime.substring(0,2);
											timeArr.sort();
											 
											//allDate length만큼 포문 돌면서 [i]에서 원래 추가 되었던 날짜가 있는 지 확인한다 잇을경우 해당하는 곳에 추가하고
											var isTrue = true; //밑에서 포문중에 날짜가 같은게 잇었다면 false 없었다면 true다;
											for(var j = 0; j < allDate.length; j++){
												//현재 선택된 날짜 $("div.date").eq(i) 가 allDate에 있는지 비교
												if($("div.date").eq(i)[0].innerText == allDate[j][0]){
													//만약 있다면 안에있는 시간을 추가된걸로 업데이트한다. timeArr을 for문으로 돌려서 넣는다 [j][k]안에
													for(var k = 1; k < timeArr.length + 1; k++){
														allDate[j][k] = timeArr[k - 1];
													}
													isTrue = false; // 이미추가되었기 때문에 밑에포문에서 새로이 추가되지 않게한다.
												}
											}
											if(isTrue){//위포문에서 allDate에 추가되지 않은 날짜이기 때문에 여기서 allDate[allDate.length] 마지막부분에 추가해준다.
												allDate[allDate.length] = new Array();
												allDate[allDate.length - 1][0] = $("div.date").eq(i)[0].innerText;
												for(var j = 1; j < timeArr.length +1; j++){
													allDate[allDate.length - 1][j] = timeArr[j-1];
												}
											}
											// for문으로 시간마다 div사용해서 넣기
											var timediv = "";
											for(var j = 0; j < timeArr.length; j++){
												timediv += "<div onclick='return deleteTime(this);'>"+timeArr[j]+":00</div>";
											}
											$("div.date").eq(i).parent().children().eq(2)[0].innerHTML = timediv;
											var inDate = false;
										}
									}
									
									if(inDate){
										swal("날짜를 다시 선택해주세요.",{
											icon : "warning",
											buttons : {
												confirm : true,
											}
										});
										return;
									}
									allDate.sort(sortFunction);
									$("#allDate").val(allDate);
								} else {
									swal("시간을 선택해주세요.",{
										icon : "warning",
										buttons : {
											confirm : true,
										}
									});
									return;
								}
							} else {
								swal("날짜를 선택해주세요.",{
									icon : "warning",
									buttons : {
										confirm : true,
									}
								});
								return;
							}
							allDate.sort(sortFunction);
							ableTimeController();
							console.log(allDate);
						});
						
						
						
						//추가된 시간을 삭제하는 펑션
						async function deleteTime(e){
							var selectTime = $(e)[0].innerText.substring(0,2);
							var selectDate = $(e).parent().parent().children().eq(0)[0].innerText;
							var isTrue;//confirm("추가된 시간을 삭제하시겠습니까?");
							
							await swal("추가된 시간을 삭제하시겠습니까?",{
								icon : "warning",
								buttons : ["NO","YES"]
							}).then((YES) => {
								if(YES) {
									isTrue = true;
								} else {
									isTrue = false;			
								}
							});
							
							
							
							if(isTrue){
								$(e)[0].outerHTML = "";
								for(var i = 0; i < allDate.length; i++){
									if(allDate[i][0] == selectDate){
										for(var j = 0; j < allDate[i].length; j++){
											if(allDate[i][j] == selectTime){
												allDate[i].splice(allDate[i].indexOf(selectTime), 1);
												
												if(allDate[i].length == 1){
													allDate.splice(allDate.indexOf(selectDate),1);
												}
												allDate.sort(sortFunction);
												$("#allDate").val(allDate);
												return;
											}
										}
									}
								}
								
							}
							ableTimeController();
							
						}
					</script>
					
					<br><br>
					<c:url var="toList" value="list.lec"/>
					<div><!-- 등록 취소 버튼 -->
						<input type=submit value="등록" class="insertBtn">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type=button value="취소" class="cancleBtn" onclick="location.href='${toList}'">
					</div>
				</div>
			</div>
			
		</div>
	</form>
	</div>
	<script>
		// 누르면 동의 list가 나온다
		function viewdong(e){
			
			var sido = $(e).parent().parent().parent().children().eq(0).val();
			if(sido != ""){
				$(e).parent().next().toggle();
			}
		}
		
		// div selectLocation을 나가면 자동으로 구군 list를 닫는다
		function closeGugun(e){
			$(e).children().eq(1).hide();
		}
		// 구군 list의 위치를 맞추는 펑션
		$(function(){
			var gugun = $("#selectDong");
			var ultop = gugun[0].offsetTop + gugun[0].offsetHeight + "px";
			var ulleft = gugun[0].offsetLeft - 15 + "px";
			$("#dong").css({"top":ultop, "left":ulleft});
		});
		$(window).resize(function(){
			var selectGuguns = $("div[id^='selectDong']");
			for(var i = 0; i < selectGuguns.length; i++){
				var ultop = selectGuguns.eq(i)[0].offsetTop + selectGuguns.eq(i)[0].offsetHeight + "px";
				var ulleft = selectGuguns.eq(i)[0].offsetLeft - 15 + "px";
				$("ul[id^='dong']").eq(i).css({"top":ultop, "left":ulleft});
			}
		});
	</script>
	
	<script>
		var placeCount = 0;
		function sidoChange(e) {
			// 시도선택 때는 회색이다가 체인지되면 초록으로 바꿈
			$(e).attr("class","selectLocation green");
			// 시/도 선택을 선택할수없게 만들기
			$(e).children().eq(0).attr("disabled","disabled");
			
			// ----------밑에 추가되고나서 기본선택을 시도가 다시 추가되기때문에 선택한걸 selected해줘야함 -------------
			for(var i = 0; i < $(e).children().length; i++){
				if($(e).children().eq(i).val() == $(e).val()){
					$(e).children().eq(i)[0].selected = true;
					$(e).children().eq(i).attr("selected", "selected");
				} else {
					$(e).children().eq(i)[0].selected = false;
					$(e).children().eq(i).removeAttr("selected", "selected");
				}
			}
			var sido = $(e).val();
			//------------구 군--------------------
		    var gugun = "";
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
		    
			$(e).next().next().empty();
			$(e).next().next().append($("<option class='lightgray' value=''>구/군 선택</option>"));
			for(var i = 0; i < gugun.length; i++){           
				 var option = $("<option class='greenOP' value='"+gugun[i]+"'>"+gugun[i]+"</option>");
				 $(e).next().next().append(option);
			}
		    
		    
		    
			//-------- 시도 선택시 새로운 셀렉트 박스가 생기도록한다 그리고 버튼으로 바뀐다 --------------
			var nowId = $(e).parent()[0].id
			if($(e).val() != "" && nowId == ("place"+placeCount)){
				placeCount = placeCount + 1;
				var insert = "<div>"+
								"<div class='place' style='vertical-align: middle' id='place"+placeCount+"'>"+
									"<select name='sido"+placeCount+"' class='selectLocation lightgray' id='sido' onchange='sidoChange(this)'>"+
										"<option value='' class='greenOP'>시/도 선택</option>"+
										"<option value='서울특별시' class='greenOP'>서울특별시</option>"+
										"<option value='경기도' class='greenOP'>경기도</option>"+
										"<option value='인천광역시' class='greenOP'>인천광역시</option>"+
										"<option value='강원도' class='greenOP'>강원도</option>"+
										"<option value='충청북도' class='greenOP'>충청북도</option>"+
										"<option value='충청남도' class='greenOP'>충청남도</option>"+
										"<option value='대전광역시' class='greenOP'>대전광역시</option>"+
										"<option value='세종특별자치시' class='greenOP'>세종특별자치시</option>"+
										"<option value='전라북도' class='greenOP'>전라북도</option>"+
										"<option value='전라남도' class='greenOP'>전라남도</option>"+
										"<option value='광주광역시' class='greenOP'>광주광역시</option>"+
										"<option value='대구광역시' class='greenOP'>대구광역시</option>"+
										"<option value='경상북도' class='greenOP'>경상북도</option>"+
										"<option value='경상남도' class='greenOP'>경상남도</option>"+
										"<option value='울산광역시' class='greenOP'>울산광역시</option>"+
										"<option value='부산광역시' class='greenOP'>부산광역시</option>"+
										"<option value='제주특별자치도' class='greenOP'>제주특별자치도</option>"+
									"</select>"+
								
									" <i class='fas fa-chevron-circle-right' style='width: 30px; height: 30px; vertical-align: middle; color: rgb(103, 81, 65);''></i> "+
								
									"<select name='gugun"+placeCount+"' class='selectLocation lightgray' id='gugun' onchange='gugunChange(this);'>"+
										"<option value=''>구/군 선택</option>"+
									"</select>"+
								
									" <i class='fas fa-chevron-circle-right' style='width: 30px; height: 30px; vertical-align: middle; color: rgb(103, 81, 65);''></i> "+
									
									"<div class='selectLocation' id=selectDong style='display: inline-block;' onmouseleave='closeGugun(this);'>"+
										"<div style='display: inline-block;'><span style='vertical-align:middle; line-height: 36px;' class='lightgray'>동 선택</span></div>"+
										"<ul id='dong' class='gugunList'>"+
										"</ul>"+
									"</div>"+
									"<hr>"+
								"</div>";
				$('#ableArea')[0].innerHTML = $('#ableArea')[0].innerHTML + insert;
			}
			
			//1번 select에서 강남구고르면 2번 3번 그뒤로다 선택이 안되게 만드는 것
			//1. selectSido에 선택된 시도 담앗다
			var gugunLength = $("select[name^='gugun']").length;
			var selectGugun = new Array(gugunLength);
			for(var i = 0; i < gugunLength; i++){
				selectGugun[i] = $("select[name^='gugun']").eq(i).val();
			}
			
			
			//name으로 모든 select 가져와서 선택된 시도를 disable시키기
			//먼저 disabled를 다지우기
			for(var i = 0; i < $("select[name^='gugun']").length; i++){
				for(var j = 0; j < $("select[name^='gugun']").eq(i).children().length; j++){
					for(var k = 0; k < selectGugun.length; k++){
						$("select[name^='gugun']").eq(i).children().eq(j).removeAttr("disabled").attr("class","selectLocation green");
						
					}
				}
			}
			//그다음 disabled 넣기
			for(var i = 0; i < $("select[name^='gugun']").length; i++){
				for(var j = 0; j < $("select[name^='gugun']").eq(i).children().length; j++){
					for(var k = 0; k < selectGugun.length; k++){
						if($("select[name^='gugun']").eq(i).children().eq(j).val() == selectGugun[k]){
							if(!$("select[name^='gugun']").eq(i).children().eq(j)[0].selected){
								$("select[name^='gugun']").eq(i).children().eq(j).attr({"disabled":"disabled","class":"selectLocation cancleLine"});
							}
						}
					}
				}
			}
			
			
			// 동 list 위치 맞춤한번더하기
			var selectGuguns = $("div[id^='selectDong']");
			for(var i = 0; i < selectGuguns.length; i++){
				var ultop = selectGuguns.eq(i)[0].offsetTop + selectGuguns.eq(i)[0].offsetHeight + "px";
				var ulleft = selectGuguns.eq(i)[0].offsetLeft - 15 + "px";
				$("ul[id^='dong']").eq(i).css({"top":ultop, "left":ulleft});
			}
			
		}
		
		// 구군이 바뀌면
		function gugunChange(e){
			var gugun = $(e).val();
			$(e).attr("class","selectLocation greenOP");
			
			// ----------밑에 추가되고나서 기본선택을 시도가 다시 추가되기때문에 선택한걸 selected해줘야함 -------------
			for(var i = 0; i < $(e).children().length; i++){
				if($(e).children().eq(i).val() == $(e).val()){
					$(e).children().eq(i)[0].selected = true;
					$(e).children().eq(i).attr("selected", "selected");
				} else {
					$(e).children().eq(i)[0].selected = false;
					$(e).children().eq(i).removeAttr("selected", "selected");
				}
			}
			
			var dong = "";
			var 강남구 = ['신사동', '논현1동', '논형2동', '압구정동', '청담동', '삼성1동', '삼성2동','대치1동','대치2동','대치4동','역삼1동','역삼2동','도곡1동','도곡2동','개포1동','개포2동','개포4동','세곡동','일원본동','일원1동','일원2동','수서동'];
			var 강동구 = ['강일동','상일동','명일1동','명일2동','고덕1동','고덕2동','암사1동','암사2동','암사3동','천호1동','천호2동','천호3동','성내1동','성내2동','성내3동','길동','둔촌1동','둔촌2동'];
			var 강북구 = ['삼양동','미아동','송중동','송천동','삼각산동','번1동','번2동','번3동','수유1동','수유2동','수유3동','우이동','인수동'];
			var 강서구 = ['염창동','등촌1동','등촌2동','등촌3동','화곡본동','화곡1동','화곡2동','화곡3동','화곡4동','화곡6동','화곡8동','가양1동','가양2동','가양3동','발산1동','공항동','방화1동','방화2동','방화3동','우장산동'];
			var 관악구 = ['보라매동','은천동','성현동','중앙동','청림동','행운동','청룡동','낙성대동','인헌동','남현동','신림동','신사동','조원동','미성동','난곡동','난향동','서원동','서림동','삼성동','대학동'];
			var 광진구 = ['중곡1동','중곡2동','중곡3동','중곡4동','능동','구의1동','구의2동','구의3동','광장동','자양1동','자양2동','자양3동','자양4동','화양동','군자동'];
			var 구로구 = ['신도림동','구로제1동','구로제2동','구로제3동','구로제4동','구로제5동','가리봉동','고척제1동','고척제2동','개봉제1동','개봉제2동','개봉제3동','오류제1동','오류제2동','항동','수궁동'];
			var 금천구 = ['가산동','독산1동','독산2동','독산3동','독산4동','시흥1동','시흥2동','시흥3동','시흥4동','시흥5동'];
			var 노원구 = ['월계1동','월계2동','월계3동','공릉1동','공릉2동','하계1동','하계2동','중계본동','중계1동','중계4동','중계2&middot;3동','상계1동','상계2동','상계3&middot;4동','상계5동','상계6&middot;7동','상계8동','상계9동','상계10동'];
			var 도봉구 = ['쌍문1동','쌍문2동','쌍문3동','쌍문4동','방학1동','방학2동','방학3동','창1동','창2동','창3동','창4동','창5동','도봉1동','도봉2동'];
			var 동대문구 = ['용신동','제기동','전농1동','전농2동','답십리1동','답십리2동','장안1동','장안2동','청량이동','회기동','휘경1동','휘경2동','이문1동','이문2동'];
			var 동작구 = ['노량진1동','노량진2동','상도1동','상도2동','상도3동','상도4동','흑석동','사당1동','사당2동','사당3동','사당4동','사당5동','대방동','신대방1동','신대방2동'];
			
			switch(gugun){
			case "" : dong = dong; break;
			case '강남구': dong = 강남구; break;
			case '강동구': dong = 강동구; break;
			case '강북구': dong = 강북구; break;
			case '강서구': dong = 강서구; break;
			case '관악구': dong = 관악구; break;
			case '광진구': dong = 광진구; break;
			case '구로구': dong = 구로구; break;
			case '금천구': dong = 금천구; break;
			case '노원구': dong = 노원구; break;
			case '도봉구': dong = 도봉구; break;
			case '동대문구': dong = 동대문구; break;
			case '동작구': dong = 동작구; break;
			}
			$(e).next().next().children().eq(0)[0].innerHTML = "<span onclick='viewdong(this);' class='selectDong'>동 선택<i class='fas fa-arrow-circle-down brown'></i></span><input style='margin:0 0 0 5px;' id='allC' type='checkbox' class='checkboxST' onclick='checkAllBtn(this);'>";
			var count = $(e)[0].name.substring($(e)[0].name.length - 1);
			$(e).next().next().children().eq(1).empty();
			for(var i = 0; i < dong.length; i++){                
			          var option = $("<li class='green'><span style='cursor: pointer;' onclick='childInputClick(this);'>"+dong[i]+"</span><input name=dong"+count+" value='"+dong[i]+"' type='checkbox' class='checkboxST' onclick='checkBtn(this);'></li>");
			          $(e).next().next().children().eq(1).append(option);
			}
			
			//1번 select에서 서울고르면 2번 3번 그뒤로다 선택이 안되게 만드는 것
			//1. selectSido에 선택된 시도 담앗다
			var gugunLength = $("select[name^='gugun']").length;
			var selectGugun = new Array(gugunLength);
			for(var i = 0; i < gugunLength; i++){
				selectGugun[i] = $("select[name^='gugun']").eq(i).val();
			}
			
			
			//name으로 모든 select 가져와서 선택된 시도를 disable시키기
			//먼저 disabled를 다지우기
			for(var i = 0; i < $("select[name^='gugun']").length; i++){
				for(var j = 0; j < $("select[name^='gugun']").eq(i).children().length; j++){
					for(var k = 0; k < selectGugun.length; k++){
						$("select[name^='gugun']").eq(i).children().eq(j).removeAttr("disabled").attr("class","selectLocation green");
						
					}
				}
			}
			//그다음 disabled 넣기
			for(var i = 0; i < $("select[name^='gugun']").length; i++){
				for(var j = 0; j < $("select[name^='gugun']").eq(i).children().length; j++){
					for(var k = 0; k < selectGugun.length; k++){
						if($("select[name^='gugun']").eq(i).children().eq(j).val() == selectGugun[k]){
							if(!$("select[name^='gugun']").eq(i).children().eq(j)[0].selected){
								$("select[name^='gugun']").eq(i).children().eq(j).attr({"disabled":"disabled","class":"selectLocation cancleLine"});
							}
						}
					}
				}
			}
			
			
		}
		
		//동 에서 input checkbox가 아닌 ex신사동 클릭시에도 동이름클릭시 input이 체크됌
		function childInputClick(e){
			$(e).parent().children().eq(1).click();
		}
		
		//동에서 전체가능 선택시 메소드
		function checkAllBtn(e){
			var allC = $(e)[0].checked;
			var length = $(e).parent().next().children().length;
			if(allC){
				$(e).attr("checked","checked");
				for(var i = 0; i < length; i++){
					 $(e).parent().next().children().eq(i).children().eq(1)[0].checked = true;
					 $(e).parent().next().children().eq(i).children().eq(1).attr("checked","checked");
				}
			} else {
				$(e).removeAttr("checked");
				for(var i = 0; i < length; i++){
					 $(e).parent().next().children().eq(i).children().eq(1)[0].checked = false;
					 $(e).parent().next().children().eq(i).children().eq(1).removeAttr("checked");
				}
			}
		}
		// 동선택하면 실행되는 메소드
		function checkBtn(e){
			if($(e)[0].checked){
				$(e).attr("checked","checked");
			} else {
				$(e).removeAttr("checked");
			}
			
			var isTrue = true;
			for(var i = 0; i < $(e).parent().parent().children().length; i++){
				if(!$(e).parent().parent().children().eq(i).children().eq(1)[0].checked){
					isTrue = false;
				}
			}
			if(isTrue){
				$(e).parent().parent().prev().children().eq(1)[0].checked = true;
				$(e).parent().parent().prev().children().eq(1).attr("checked","checked");
			} else {
				$(e).parent().parent().prev().children().eq(1)[0].checked = false;
				$(e).parent().parent().prev().children().eq(1).removeAttr("checked");
			}
			
		}
		// 강의시간으로 가능시간 제어하기
		function ableTimeController(e){
			var nowDate = $("input[class='dateSelect']").val();
			var startTime = 9;
			var endTime = 22;
			//otTime에서 endTime - otTime해서 선택안되게하기
			$("#timeSelect").empty();
			$("#timeSelect").append("<option class='lightgray'>시간선택</option>");
			for(var i = startTime; i <= endTime; i++){
				var insertSelectTime = i;
				if(i < 10){
					insertSelectTime = "0"+insertSelectTime;
				}
				var option;
				if(i > endTime - $("#otTime").val()){
					option = "<option disabled>"+insertSelectTime+":00</option>";
				} else {
					option = "<option>"+insertSelectTime+":00</option>";
				}
				$("#timeSelect").append(option);
			}
			
			if($("#allDate").val() != ""){
				//현재의 allDate를 2차원배열로 만든다
				var thisAllDate = new Array();
				var allDateVal = $("#allDate").val();
				var j = -1;
				var k = 0;
				for(var i = 0; i < allDateVal.split(",").length; i++){
					
					if(allDateVal.split(",")[i].length > 2){
						j++;
						thisAllDate[j] = new Array();
						thisAllDate[j][0] = allDateVal.split(',')[i];
						k = 0;
					} else {
						k++;
						thisAllDate[j][k] = allDateVal.split(",")[i];
					}
					
				}
				var usingTime;
				for(var i = 0; i < thisAllDate.length; i++){
					var textDate = thisAllDate[i];
					if(textDate[0] == nowDate){
						usingTime = textDate;
					}
				}
				
				// usingTime에 따라서 추가가능시간선택제어
				// 그전에 비우기
				if(usingTime == null){
					
				} else {
					//현재 저장되어 있는 시간을 disabled하기
					for(var i = 1; i < usingTime.length; i++){
						for(var j = 0; j < $("#timeSelect").children().length; j++){
							if($("#timeSelect").children().eq(j)[0].innerText.substring(0,2) == usingTime[i]){
								$("#timeSelect").children().eq(j).attr('disabled','disabled');
							}
						}
					}
					//현재 저장되어 있는 시간 + otTime을 disabled하기
					for(var i = 1; i < usingTime.length; i++){
						for(var j = 0; j < $("#timeSelect").children().length; j++){
							if($("#timeSelect").children().eq(j)[0].innerText.substring(0,2) == usingTime[i]){
								// k = j 현재 시간과 같은곳을 찾고 같다면 + otTime까지 disabled
								//현재 저장되어 있는 시간 - otTime부터 저장시간 + otTime까지 disabled
								for(var k = j - Number($("#otTime").val()); k <= j + Number($("#otTime").val()); k++){
									$("#timeSelect").children().eq(k).attr('disabled','disabled');
								}
							}
						}
					}
				}
			}
			allDate.sort(sortFunction);
			
		}
		
		function sortFunction(a, b) {
			var amonth;
		    if (a[0] == b[0]) {
		        return 0;
		    }
		    else {
		    	if( parseInt(a[0].split("/")[0]) < parseInt(b[0].split("/")[0]) ){
		    		console.log("parseInt(a[0].split('/')[0]) = "+parseInt(a[0].split('/')[0]));
		    		console.log("parseInt(b[0].split('/')[0]) = "+parseInt(b[0].split('/')[0]));
					return parseInt(a[0].split("/")[0]) < parseInt(b[0].split("/")[0]) ? -1 : 1;
				} else if( parseInt(a[0].split("/")[1].split("(")[0]) < parseInt(b[0].split("/")[1].split("(")[0]) ){
					console.log("parseInt(a[0].split('/')[1].split('(')[0]) = "+parseInt(a[0].split('/')[1].split('(')[0]));
					console.log("parseInt(b[0].split('/')[1].split('(')[0]) = "+parseInt(b[0].split('/')[1].split('(')[0]));
					return parseInt(a[0].split("/")[1].split("(")[0]) < parseInt(b[0].split("/")[1].split("(")[0]) ? -1 : 1;
				}
		    	
		        return (a[0] < b[0]) ? -1 : 1;
		    }
		}
		
		function beforeSubmit(){
			var titleImg = $("#titleImg")[0].src;
			if(titleImg == ""){
				swal("썸네일 이미지를 넣어주세요.",{
					icon : "warning",
					buttons : {
						confirm : true,
					}
				});
				return false;
			}
			
			var title = $("#title").val();
			if(title == ""){
				swal("제목을 작성해주세요.",{
					icon : "warning",
					buttons : {
						confirm : true,
					}
				});
				return false;
			}
			
			var hobbyNo = $("#hobbyNo").val();
			if(hobbyNo == "" || hobbyNo == 0){
				swal("카테고리를 설정해주세요.",{
					icon : "warning",
					buttons : {
						confirm : true,
					}
				});
				return false;
			}
			
			var otTuition = $("#otTuition").val();
			if(otTuition == ""){
				swal("수강료를 입력해주세요.",{
					icon : "warning",
					buttons : {
						confirm : true,
					}
				});
				return false;
			}
			
			var otTime = $("#otTime").val();
			if(otTime == "" || otTime == 0){
				swal("수강 시간을 입력해주세요.",{
					icon : "warning",
					buttons : {
						confirm : true,
					}
				});
				return false;
			}
			
			var otAllTime = $("#otAllTime").val();
			if(otAllTime == "" || otAllTime == 0){
				swal("총 수강 횟수를 입력해주세요.",{
					icon : "warning",
					buttons : {
						confirm : true,
					}
				});
				return false;
			}
			
			var learner = $("#learner").val();
			if(learner == ""){
				swal("수강 대상을 선택해주세요.",{
					icon : "warning",
					buttons : {
						confirm : true,
					}
				});
				return false;
			}
			
			var content = $("textarea[name=content]").val();
			if(content == ""){
				swal("수업소개를 입력해주세요.",{
					icon : "warning",
					buttons : {
						confirm : true,
					}
				});
				return false;
			}
			
			var teacherInfo = $("textarea[name=teacherInfo]").val();
			if(teacherInfo == ""){
				swal("강사소개를  입력해주세요.",{
					icon : "warning",
					buttons : {
						confirm : true,
					}
				});
				return false;
			}
			
			var isChecked = new Array();
			for(var i = 0; i < $("ul[id=dong]").length; i++){
				isChecked[i] = false;
				for(var j = 0; j < $("ul[id=dong]").eq(i).children().length;j++){
					if($("ul[id=dong]").eq(i).children().length > 1){
						if($("ul[id=dong]").eq(i).children().eq(j).children().eq(1)[0].checked){
							isChecked[i] = true;
						}
					}
				}
			}
			var isCheckedLen;
			if(isChecked.length < 2){
				isCheckedLen = isChecked.length; 
			} else {
				isCheckedLen = isChecked.length - 1;
			}
			for(var i = 0; i < isCheckedLen; i++){
				if(!isChecked[i]){
					swal((i+1)+'번째 가능한 장소의 동을 선택해주세요.',{
						icon : "warning",
						buttons : {
							confirm : true,
						}
					});
					return false;
				}
			}
			
			var allDateC = $("#allDate").val();
			if(allDateC == ""){
				swal("가능한 시간을 하나이상 추가해주세요.",{
					icon : "warning",
					buttons : {
						confirm : true,
					}
				});
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>