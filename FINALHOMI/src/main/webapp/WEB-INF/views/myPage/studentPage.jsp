<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<style>

	.outer{
		width:1000px; height: auto; padding-bottom: 50px;
		margin-left:auto; margin:auto; margin-top:50px; margin-bottom: 50px; 
	}
	
	.infoTable{float: left; width: 100px; height: 35px; box-sizing: border-box; text-align: center; line-height: 50px; color: gray; font-weight: bold;}
	.heightSet div{line-height: 30px; font-size: 20px; border-bottom: 1px solid gray;}
	.infoSpace{width: 33px; height: 35px;}
	
	.subTitle{padding-left: 10px; padding-top: 10px; width: 200px; border-bottom: 1px solid black; text-align: left; font-size: 25px; font-weight: bold; margin: 10px;}
	
	/* table 공통 */
	.table{border-collapse: collapse; width: 100%; background: white;} /* 테두리 겹 없애기 */
		.table td{padding: 8px;}
	.align{text-align: left;} /* 가운데 정렬 */
	
	/* 페이징 div */
	.pagingArea{text-align: center; padding: 10px;}
	.pagingArea button{font-weight: bold;}
	
	/* 페이징 버튼 */
	.pagingBtn{width: 30px; height: 30px; text-align: center; vertical-align: middle; border: none; border-radius: 3px;}
	.arrows{background: rgb(103, 81, 65); color: white;}
	
	/* 사진, 사진이름 틀 */
	.picFrame{width: 200px; height: 100px;}
	.titleFrame{width: 200px; height: 20px;}
	
</style>
</head>
<body style="line-height: 2em;">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:import url='../common/boardCommon.jsp'/>
	<script>
	$('#bName').text(' 마이 ');
	$('#bNameAfter').text('페이지');
	
	$('#bName').click(function() {
		location.href="studentPage.mp";
	});
	$('#bNameAfter').click(function() {
		location.href="studentPage.mp";
	});
	</script>
	<div class="outer"> <!-- 그냥 제일 큰 칸 -->
		<div style="padding: 20px;"></div>
		<div style="padding: 1px;">
			<div style="margin: 14px;"> <!-- 정보칸 -->
			<!-- 사진 -->
				<div class="infoTable" style="width: 150px; height: 150px;">
					<img class="thumbnail" style="width: 150px;" src="${ contextPath }/resources/uploadFiles/${ loginUser.changeName }">
				</div>
				<div style="font-size: 20px; font-weight: bold;">
					<div class="infoTable" style="width: 150px;"></div>
					<div class="infoTable infoSpace"></div>
					<div class="infoTable" id="number1" style="font-size: 30px; color: #888c43;">${mpc.myFarmCount}</div>
					<div class="infoTable infoSpace"></div>
					<div class="infoTable" id="number2" style="width: 120px; font-size: 30px; color: #888c43;">${mpc.stLectureCount}</div>
					<div class="infoTable infoSpace"></div>
					<div class="infoTable" id="number3" style="font-size: 30px; color: #888c43;">${mpc.finishedLectureCount}</div>
					<div class="infoTable" style="width: 250px; height: 150px; float: right; line-height: 150px;"></div>
				</div>
				
				<c:url var="myinfo" value="infoN.me"/>
				<c:url var="google" value="infoG.me"/>
				
				<div class="heightSet">
					<c:if test="${loginUser.userPwd != null }">
						<div class="infoTable" style="color: rgb(103, 81, 65);"><a href="${myinfo}" style="font-size: 15px;">${loginUser.nickName} 님</a></div>
					</c:if>
					<c:if test="${loginUser.userPwd == null }">
						<div class="infoTable" style="color: rgb(103, 81, 65);"><a href="${google}" style="font-size: 15px;">${loginUser.nickName} 님</a></div>
					</c:if>
					<div class="infoTable" style="width: 50px;"></div>
					<div class="infoTable infoSpace" style="border:none;"></div>
					<div class="infoTable" style="font-size: 15px; border-bottom: 1px solid gray;">참여중인 모임</div>
					<div class="infoTable infoSpace"></div>
					<div class="infoTable" style="width: 120px; font-size: 15px; border-bottom: 1px solid gray;">참여중인 강의</div>
					<div class="infoTable infoSpace"></div>
					<div class="infoTable" style="font-size: 15px; border-bottom: 1px solid gray;">재배 완료</div>
				</div>
				<div class="infoTable" style="width: 500px; font-style: italic; text-align: left; padding: 5px; font-size: 20px; color: rgb(103, 81, 65);">" ${loginUser.introduction} "</div>
				<div style="clear: both;"></div>
			</div>
		</div>
		
		<div style="clear: both;"></div>
		
		<!-- 참여한 동네 텃밭 -->
		<div style="width: 300px; float: left; margin: 10px;"> 
			<div class="subTitle" >참여한 동네 텃밭</div>
			<iframe width="100%" height="660" src="myFarm.mp" frameborder="0"></iframe>
		</div>
		<div style="width: 650px; float: left; margin: 10px;">
			<div class="subTitle" style="width: 600px;">주문한 모종</div>
			<div style="width: 620px; border: 1px solid black; padding: 10px;">
				<iframe width="100%" height="250" src="myLectureSt.mp" frameborder="0"></iframe>
			</div>
			
		</div>
		<div style="width: 650px; float: left; margin: 10px;">
			<div class="subTitle" style="width: 600px;">재배한 모종</div>
			<div style="width: 620px; border: 1px solid black; padding: 10px;">
				<iframe width="100%" height="250" src="myFinishedLectureSt.mp" frameborder="0"></iframe>
			</div>
		</div>
		
		<div style="clear: both;"></div> <!-- outer가 전체를 감싸게 하기 위한 clear -->
	</div> <!-- outer 끝 -->
	
	<script>
	
	/* 강의 숫자 올리는 효과 */
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
	</script>
</body>
</html>