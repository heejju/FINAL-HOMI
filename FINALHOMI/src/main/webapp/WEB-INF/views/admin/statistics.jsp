<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<link rel="stylesheet" type="text/css" href="${ contextPath }/resources/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
section{width:80%; height:100%; margin:0 auto;}

/* 컨테이너 */
div.container{width:100%; height:auto; background-color:#fff; align:center; border-radius:1px; margin:7% auto;}

/* 탑 컨테이너 */
table.top-table{width:100%; align:center; border:none; margin-top: 2%;}
table.top-table tr th{padding:20px 5px; cursor:pointer; color:#fff; font-size:18pt; background-color:#675141;}
table.top-table tr th:hover{color:#fff; background-color:#888c43;}

/* 미니 컨테이너 */
div.container > div.mini-container{width:100%; height: auto;}
.mini-line{width:100%; height:3px; background:#ccc; margin: 15px 0;}
div.container > div.mini-container > div.mini-first {width:370px; margin:5% 3.5%; height:200px; border:2px solid #9f9f9f; padding:10px; display:inline-block;}
div.container > div.mini-container > div.mini-second {width:370px; margin:5% 3.5%; height:200px; border:2px solid #9f9f9f; padding:10px; display:inline-block;}
div.container > div.mini-container > div.mini-third {width:370px; margin:5% 3.5%; height:200px; border:2px solid #9f9f9f; padding:10px; display:inline-block;}
div.container > div.mini-container > div > div {float:left;}

#number1{padding-top:40px; padding-left:30px; font-size:50pt; font-weight:bold; color:#888c43;}
#number2{padding-top:40px; padding-left:30px; font-size:50pt; font-weight:bold; color:#888c43;}
#number3{padding-top:40px; padding-left:30px; font-size:50pt; font-weight:bold; color:#888c43;}
#icon1{position:relative; float:right; margin-right:10px;}
#text1{padding-top:0px; padding-left:35px; font-size:15pt; font-weight:bold; color:#5f5f5f;}

/* 셀렉트 */
.selectbox { position: relative; width: 200px; /* 너비설정 */ border: 1px solid #999; /* 테두리 설정 */ z-index: 1;  display:inline-block; margin-left:3%;}
.selectbox:before { /* 화살표 대체 */ content: ""; position: absolute; top: 50%; right: 15px; width: 0; height: 0; margin-top: -1px; border-left: 5px solid transparent; border-right: 5px solid transparent; border-top: 5px solid #333; }
.selectbox label { position: absolute; top: 1px; /* 위치정렬 */ left: 5px; /* 위치정렬 */ padding: .8em .5em; /* select의 여백 크기 만큼 */ color: #999; z-index: -1; /* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */ }
.selectbox select { width: 100%; height: auto; /* 높이 초기화 */ line-height: normal; /* line-height 초기화 */ font-family: inherit; /* 폰트 상속 */ padding: .8em .5em; /* 여백과 높이 결정 */ border: 0; opacity: 0; /* 숨기기 */ filter:alpha(opacity=0); /* IE8 숨기기 */ -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none;}


/* 이미지 */
.icon{width:100px; height:100px; align:right;}

/* 빅 컨테이너 */
div.container > div.big-container{width:100%; height: 100%; }
div.graph{width:100%; height:600px; margin:2% 2%;}
#listArea {background:#fff; margin:4% 0.5%; display:block; width:45%;  height:500px; overflow-x: hidden; float:left;}
#listArea > thead{font-size:17px; line-height:25px; padding:2%; border-bottom: 2px solid #5A5A5A;}
#listArea > thead tr td {padding:2%; width:200px; text-align:center;}
#listArea > tbody {padding:2%;}
#listArea > tbody tr {border-bottom: 1px solid #d9d9d9;}
#listArea > tbody tr td {padding:2%; text-align:center;}


</style>
</head>
<body>
	<c:import url='../common/boardCommon.jsp'/>
	<script>
		$('#bName').text('텃밭');
		$('#bNameAfter').text('통계');
	</script>
	<section>
		<div class="container">
			<div class="top-container">
			</div>
			<div class="mini-container">
				<div class="mini-first">
					<div id="number1">${ visitCount }</div>
					<div id="icon1"><img class="icon" src="${ contextPath }/resources/images/group.png"></div>
					<div class="clear-both"></div>
					<div id="text1">총 방문자 수</div>
					<div class="mini-line"></div>
				</div>
				<div class="mini-second">
					<div id="number2">${ lectureCount }</div>
					<div id="icon1"><img class="icon" src="${ contextPath }/resources/images/book.png"></div>
					<div class="clear-both"></div>
					<div id="text1">총 강의 수</div>
					<div class="mini-line"></div>
				</div>
				<div class="mini-third">
					<div id="number3">${ memberCount }</div>
					<div id="icon1"><img class="icon" src="${ contextPath }/resources/images/group.png"></div>
					<div class="clear-both"></div>
					<div id="text1">총 회원 수</div>
					<div class="mini-line"></div>
				</div>
			</div>
			
			<div class="big-container">
				<div class="selectbox">
					<label for="ex_select">연도</label>
					<select name="selectYear" id="selectYear">
						<option selected>연도</option>
						<option>2018</option>
						<option>2019</option>
						<option>2020</option>
					</select>
				</div>
				<div class="selectbox">
					<label for="ex_select">월</label>
					<select name="selectMonth" id="selectMonth">
						<option selected>월</option>
						<option>01</option>
						<option>02</option>
						<option>03</option>
						<option>04</option>
						<option>05</option>
						<option>06</option>
						<option>07</option>
						<option>08</option>
						<option>09</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select>
				</div>
				
				<script>
				 // 셀렉트 박스
					$(document).ready(function() { var selectTarget = $('.selectbox select'); selectTarget.change(function(){ var select_name = $(this).children('option:selected').text(); $(this).siblings('label').text(select_name); }); });
				</script>
				
					<table class="top-table">
						<tr>
							<th id="first-btn">회원 수</th>
							<th id="second-btn">강의 게시글 수</th>
							<th id="third-btn">성사된 강의 수</th>
						</tr>
					</table>
				</div>
				<div class="wrap">
				<div class="graph" style="width:50%; float:left; ">
					<canvas id="myChart1" style="width:500px; height:400px; display:none;"></canvas>
					<canvas id="myChart2" style="width:500px; height:400px; display:none;"></canvas>
					<canvas id="myChart3" style="width:500px; height:400px; display:none;"></canvas>
				</div>
				<table id="listArea" style="">
						<thead>
							<tr>
								<td>날짜</td>
								<td>데이터 값 </td>
							</tr>
						</thead>
						<tbody>
						</tbody>
				</table>
				</div>
				<div class="clear-both"></div>
			</div>
	</section>
	<script src="${ contextPath }/resources/js/Chart.min.js"></script>
	<script src="${ contextPath }/resources/js/utils.js"></script>
	<script src="${ contextPath }/resources/js/analyser.js"></script>
	<script>
		
		// count numbers animate
		$(window).scroll(startCounter);
		function startCounter() {
			if ($(window).scrollTop() > 50) {
				$(window).off("scroll", startCounter);
				$("#number1").each(function () {
					var $this = $(this);
					jQuery({ Counter: 0 }).animate(
						{ Counter: $this.text() },
						{
							duration: 1000,
							easing: "swing",
							step: function () {
								$this.text(Math.ceil(this.Counter));
							}
						}
					);
				});
				$("#number2").each(function () {
					var $this = $(this);
					jQuery({ Counter: 0 }).animate(
						{ Counter: $this.text() },
						{
							duration: 1000,
							easing: "swing",
							step: function () {
								$this.text(Math.ceil(this.Counter));
							}
						}
					);
				});
				$("#number3").each(function () {
					var $this = $(this);
					jQuery({ Counter: 0 }).animate(
						{ Counter: $this.text() },
						{
							duration: 1000,
							easing: "swing",
							step: function () {
								$this.text(Math.ceil(this.Counter));
							}
						}
					);
				});
			}
		}
		
	  // 차트를 그려보자
	  
	  $('#first-btn').click(function(){
	      var ctx = document.getElementById("myChart1").getContext('2d');
	     
	      $('#myChart1').css('display','block');
	      $('#myChart2').css('display','none');
	      $('#myChart3').css('display','none');
	      
	      var myChart = new Chart(ctx, {
	          type: 'bar',
	          data: {
	              labels: ["총 회원 수", "일반 회원 수", "강사 회원 수"],
	              datasets: [{
	                  label: '취미 텃밭 통계',
	                  data: ['${memberCount}','${studentCount}', '${teacherCount}'],
	                  backgroundColor: [
	                      'rgba(255, 206, 86, 0.2)',
	                      'rgba(75, 192, 192, 0.2)',
	                      'rgba(153, 102, 255, 0.2)'
	                  ],
	                  borderColor: [
	                      'rgba(255, 206, 86, 1)',
	                      'rgba(75, 192, 192, 1)',
	                      'rgba(153, 102, 255, 1)'
	                  ],
	                  borderWidth: 1
	              }]
	          },
	          options: {
	              maintainAspectRatio: false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
	              scales: {
	                  yAxes: [{
	                      ticks: {
	                          beginAtZero:true
	                      }
	                  }]
	              }
	          }
	      }); 
	      
	      // ajax 테이블 받기
	      
	      var selectMonth = $('#selectMonth').val();
	      var selectYear = $('#selectYear').val();
	      var sysdate = selectYear + selectMonth;
	      
	      $.ajax({
	    	  url: "tableList.st",
	    	  type: 'post',
	    	  data : {sysdate:sysdate},
	    	  dataType: "json",
	    	  success: function(data){
	    		  $list = $("#listArea tbody");
	    		  $list.html("");
	    		  
	    		  var result="";
	    		  for(var i in data){
	    			  result +="<tr>"+"<td>" + data[i].sysdate + "</td>"
	    			  		   +"<td>" + data[i].memberCount + "</td>"  + "</tr>"
	    		  }
	    		  $('#listArea').fadeIn();
	    		  $('#listArea').children('tbody').html(result);
	    	  }
	      });
	      
	      
	  });
		
	  
	  $('#second-btn').click(function(){
	      var ctx = document.getElementById("myChart2").getContext('2d');
	     
	      $('#myChart2').css('display','block');
	      $('#myChart1').css('display','none');
	      $('#myChart3').css('display','none');
	      
	      var myChart = new Chart(ctx, {
	          type: 'bar',
	          data: {
	              labels: ["미술", "공예", "음악", "디자인/개발", "사진/영상", "요리", "스포츠", "기타"],
	              datasets: [{
	                  label: '강의 게시글',
	                  data: ['${artCount}', '${craftsCount}', '${musicCount}','${designCount}', '${pictureCount}', '${cookCount}', '${danceCount}', '${sportsCount}'],
	                  backgroundColor: [
	                      'rgba(255, 99, 132, 0.2)',
	                      'rgba(54, 162, 235, 0.2)',
	                      'rgba(255, 206, 86, 0.2)',
	                      'rgba(75, 192, 192, 0.2)',
	                      'rgba(153, 102, 255, 0.2)',
	                      'rgba(255, 99, 132, 0.2)',
	                      'rgba(54, 162, 235, 0.2)',
	                      'rgba(255, 206, 86, 0.2)',
	                      'rgba(75, 192, 192, 0.2)',
	                      'rgba(153, 102, 255, 0.2)'
	                  ],
	                  borderColor: [
	                	  'rgba(255,99,132,1)',
	                      'rgba(54, 162, 235, 1)',
	                      'rgba(255, 206, 86, 1)',	
	                      'rgba(75, 192, 192, 1)',
	                      'rgba(153, 102, 255, 1)',
	                      'rgba(255,99,132,1)',
	                      'rgba(54, 162, 235, 1)',
	                      'rgba(255, 206, 86, 1)',	
	                      'rgba(75, 192, 192, 1)',
	                      'rgba(255,99,132,1)'
	                  ],
	                  borderWidth: 1
	              }]
	          },
	          options: {
	              maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
	              scales: {
	                  yAxes: [{
	                      ticks: {
	                          beginAtZero:true
	                      }
	                  }]
	              }
	          }
	      }); 
	      
		// ajax 테이블 받기
	      
	      var selectMonth = $('#selectMonth').val();
	      var selectYear = $('#selectYear').val();
	      var sysdate = selectYear + selectMonth;
	      
	      $.ajax({
	    	  url: "tableList.st",
	    	  type: 'post',
	    	  data : {sysdate:sysdate},
	    	  dataType: "json",
	    	  success: function(data){
	    		  $list = $("#listArea tbody");
	    		  $list.html("");
	    		  
	    		  var result="";
	    		  for(var i in data){
	    			  result +="<tr>"+"<td>" + data[i].sysdate + "</td>"
	    			  		   +"<td>" + data[i].lectureCount + "</td>"  + "</tr>"
	    		  }
	    		  
	    		  $('#listArea').children('tbody').html(result);
	    	  }
	      });
	  });
	  $('#third-btn').click(function(){
	      var ctx = document.getElementById("myChart3").getContext('2d');
	     
	      $('#myChart3').css('display','block');
	      $('#myChart1').css('display','none');
	      $('#myChart2').css('display','none');
	      
	      var myChart = new Chart(ctx, {
	          type: 'bar',
	          data: {
	              labels: ["미술", "공예", "음악", "디자인/개발", "사진/영상", "요리", "스포츠", "기타"],
	              datasets: [{
	                  label: '성사된 강의 수',
	                  data: ['${artCount2}', '${craftsCount2}', '${musicCount2}','${designCount2}', '${pictureCount2}', '${cookCount2}', '${danceCount2}', '${sportsCount2}'],
	                  backgroundColor: [
	                	  'rgba(255, 99, 132, 0.2)',
	                      'rgba(54, 162, 235, 0.2)',
	                      'rgba(255, 206, 86, 0.2)',
	                      'rgba(75, 192, 192, 0.2)',
	                      'rgba(153, 102, 255, 0.2)',
	                      'rgba(255, 99, 132, 0.2)',
	                      'rgba(54, 162, 235, 0.2)',
	                      'rgba(255, 206, 86, 0.2)',
	                      'rgba(75, 192, 192, 0.2)',
	                      'rgba(153, 102, 255, 0.2)'
	                  ],
	                   borderColor: [
	                      'rgba(255,99,132,1)',
	                      'rgba(54, 162, 235, 1)',
	                      'rgba(255, 206, 86, 1)',	
	                      'rgba(75, 192, 192, 1)',
	                      'rgba(153, 102, 255, 1)',
	                      'rgba(255,99,132,1)',
	                      'rgba(54, 162, 235, 1)',
	                      'rgba(255, 206, 86, 1)',	
	                      'rgba(75, 192, 192, 1)',
	                      'rgba(255,99,132,1)'
	                  ],
	                  borderWidth: 1
	              }]
	          },
	          options: {
	              maintainAspectRatio: false, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
	              scales: {
	                  yAxes: [{
	                      ticks: {
	                          beginAtZero:true
	                      }
	                  }]
	              }
	          }
	      });
			// ajax 테이블 받기
	      
	      var selectMonth = $('#selectMonth').val();
	      var selectYear = $('#selectYear').val();
	      var sysdate = selectYear + selectMonth;
	      
	      $.ajax({
	    	  url: "tableList.st",
	    	  type: 'post',
	    	  data : {sysdate:sysdate},
	    	  dataType: "json",
	    	  success: function(data){
	    		  $list = $("#listArea tbody");
	    		  $list.html("");
	    		  
	    		  var result="";
	    		  for(var i in data){
	    			  result +="<tr>"+"<td>" + data[i].sysdate + "</td>"
	    			  		   +"<td>" + data[i].conLectureCount + "</td>"  + "</tr>"
	    		  }
	    		  
	    		  $('#listArea').children('tbody').html(result);
	    	  }
	      });
		  	
	  });	
		
	</script>
	
	
</body>
</html>