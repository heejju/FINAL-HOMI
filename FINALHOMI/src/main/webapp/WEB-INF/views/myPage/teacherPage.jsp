<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<style>
	.thumbnail{border: 2px solid black;
	border-radius: 70%;
	width: 150px;
	height: 150px;}
	.outer{
		width:900px; min-height:50px; padding-bottom: 50px;
		margin-left:auto; margin:auto; margin-top:50px; margin-bottom: 50px; 
	}
	
	.infoTable{float: left; width: 100px; height: 35px; box-sizing: border-box; text-align: center; line-height: 50px; color: gray; font-weight: bold;}
	.heightSet div{line-height: 30px; font-size: 20px; border-bottom: 1px solid gray;}
	.infoSpace{width: 10px; height: 35px;}
	
	.buttonPay{width:100px; background-color:#888c43; color:#fff; border:none; padding:10px 0; text-align:center; font-size:15px; margin:4px; cursor:pointer; border-radius:5px;}
	
	
	.subTitle{padding-left: 30px; padding-top: 10px; width: 200px; border-bottom: 1px solid black; text-align: left; font-size: 30px; font-weight: bold;}
	
	/* table 공통 */
	.table{border-collapse: collapse; width: 100%;} /* 테두리 겹 없애기 */
		.table td{padding: 4px;}
	.align{text-align: center;} /* 가운데 정렬 */
	
	/* 상태 버튼 */
	.status{border: none; color: white; border-radius: 3px; padding: 3px 0;}
		.on{background: #888c43;} /* 진행 */
		.off{background: rgb(120, 120, 120);} /* 마감 */
	
	/* 페이징 div */
	.pagingArea{text-align: center; padding: 30px;}
	.pagingArea button{font-weight: bold;}
	
	/* 페이징 버튼 */
	.pagingBtn{width: 30px; height: 30px; text-align: center; vertical-align: middle; border: none; border-radius: 3px;}
	.arrows{background: rgb(103, 81, 65); color: white;}
	
	
</style>
</head>
<body style="line-height: 2em;">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:import url='../common/boardCommon.jsp'/>
	<script>
	$('#bName').text(' 마이 ');
	$('#bNameAfter').text('페이지');
	$('#bName').css('cursor', 'pointer');
	$('#bNameAfter').css('cursor', 'pointer');
	
	$('#bName').click(function() {
		location.href="teacherPage.mp";
	});
	$('#bNameAfter').click(function() {
		location.href="teacherPage.mp";
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
					<div class="infoTable" id="number1" style="font-size: 30px; color: #888c43;">${mpc.myLectureCount}</div>
					<div class="infoTable infoSpace"></div>
					<div class="infoTable" id="number2" style="width: 120px; font-size: 30px; color: #888c43;">${mpc.myFarmCount}</div>
					<div class="infoTable infoSpace"></div>
					<div class="infoTable" id="number3" style="font-size: 30px; color: #888c43;">0</div>
				</div>
					<c:if test="${loginUser.vipYn == 'N'}">
						<div class="infoTable" style="width: 150px; height: 150px; float: right; line-height: 150px;">
							<button class="buttonPay" onclick="location.href='payView.mp'">연간 회원 결제</button>
						</div>
					</c:if>
					<c:if test="${loginUser.vipYn == 'Y'}">
						<div class="infoTable" style="width: 150px; height: 150px; float: right; line-height: 150px;">
							<button class="buttonPay" style="cursor: default;">결제 완료</button>
						</div>
					</c:if>
				
					<c:url var="myinfo" value="myinfoView.me"/>
					
				<div class="heightSet">
					<div class="infoTable" style="color: rgb(103, 81, 65);"><a href="${myinfo}" style="font-size: 15px;">${loginUser.nickName} 님</a></div>
					<c:if test="${loginUser.vipYn == 'Y' }">
						<div class="infoTable" style="width: 50px;">
							<img style="width: 30px;" src="${contextPath }/resources/images/VIP.png">
						</div>
					</c:if>
					<c:if test="${loginUser.vipYn == 'N' }">
						<div class="infoTable" style="width: 50px;"> </div>
					</c:if>
					<div class="infoTable infoSpace" style="border:none;"></div>
					<div class="infoTable" style="font-size: 15px; border-bottom: 1px solid gray;">텃밭 운영중</div>
					<div class="infoTable infoSpace"></div>
					<div class="infoTable" style="width: 120px; font-size: 15px; border-bottom: 1px solid gray;">참여중인 모임</div>
					<div class="infoTable infoSpace"></div>
					<div class="infoTable" style="font-size: 15px; border-bottom: 1px solid gray;">재배 완료</div>
				</div>
				<div class="infoTable" style="width: 500px; font-style: italic; text-align: left; padding: 5px; font-size: 20px; color: rgb(103, 81, 65);">" ${loginUser.introduction} "</div>
				<div style="clear: both;"></div>
			</div>
		</div>
		<div style="clear: both;"></div>
		<div> <!-- 내 강의 리스트 -->
				
			<div class="subTitle">내 강의 리스트</div>
			<div style="background: white; margin: 15px; padding: 10px;">
				<iframe width="100%" height="300" src="lectureList.mp" frameborder="0"></iframe>
			</div>
		
		
		<div> <!-- 시간표 -->
			<div class="subTitle">시간표</div>
			<div style="background: white; margin: 15px; padding: 15px;">
				<iframe width="100%" height="620" src="timeLine.mp" frameborder="0"></iframe>
			</div>
		</div>
	</div>
	</div>
	<script>
	
	
		/* 내 강의 마우스 오버 효과 */
		$(function() {
			$('#listTable').find("td").mouseenter(function() {
				$(this).parents("tr").css({"background":"rgb(137, 139, 77)", "color":"white", "cursor":"pointer"});
			}).mouseout(function() {
				$(this).parents("tr").css({"background":"none", "color":"black"});
			});
		});
		
		/* 숫자 올리는 효과 */
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