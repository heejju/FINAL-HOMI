<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<style>
	/* 날짜 페이징 */
	.date{float: left; text-align: center; word-spacing: 5px;}
	.dateBtn{width: 50px; border: none; color: white; border-radius: 3px; padding: 8px 0; background: #888c43;}
	
	/* table 공통 */
	.table{border-collapse: collapse; width: 100%;} /* 테두리 겹 없애기 */
		.table td{padding: 4px;}
	.align{text-align: center;} /* 가운데 정렬 */
</style>
</head>
<body>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<div style="margin-left: 30%;"> <!-- 날짜 선택 -->
		<div class="dateBtn date" id="before" style="margin-right: 3%; cursor: pointer;">이전</div> <!-- 이전을 누르면 ${date} - 1 하기(integer?) -->
		<div class="date" id="inputDate" style="width: 200px; font-size: 25px;"></div>
		<div class="dateBtn date" id="next" style="margin-left: 3%; cursor: pointer;">다음</div> <!-- 다음을 누르면 ${date} + 1 하기(integer?) -->
	<script>
		var month = '${date}'.substr(4,2);
		var day = '${date}'.substr(6,2);
		
		var date = month + '월 ' + day + '일';
			$('#inputDate').text(date);

		// 이전, 다음날 연결
		$('#before').click(function() {
			var dDay = parseInt(${date}) - 1;
			location.href="timeLine.mp?day="+dDay;
		});
		
		$('#next').click(function() {
			var dDay = parseInt(${date}) + 1;
			location.href="timeLine.mp?day="+dDay;
		});
	</script>
	</div>
		<div style="clear: both; border-bottom: 1px solid gray; padding: 5px;"></div>
		<table class="table classList" id="timeTable" style="width: 100%; text-align: center;">
			
				<tr style="border-bottom: 1px solid gray; line-height: 30px;">
					<th style="width: 120px;">시간</th>
					<th>제목</th>
					<th style="width: 120px;">모종</th>
					<th style="width: 80px;">종류</th>
					<th style="width: 80px;">수강생</th>
				</tr>
			<c:if test="${empty timeline}">
				<tr style="border-bottom: 1px solid rgb(225, 225, 225); line-height: 25px;">
					<td colspan="5"> 강의 없음! </td>
				</tr>
			</c:if>
			<c:forEach var="t" items="${timeline}">
				<tr style="border-bottom: 1px solid rgb(225, 225, 225); line-height: 25px;">
					<td id="time"></td>
					<td><input type="hidden" value="${t.postNo}">${t.title}</td>
					<td>${t.hobbyName}</td>
					<c:if test="${t.tKind == 2}">
						<td>강의</td>
					</c:if>
					<c:if test="${t.tKind == 3}">
						<td>모임</td>
					</c:if>
					<td><input type="hidden" value="${t.learnerId}">${t.learnerNick}</td>
				</tr>
				<script>
					var time1 = parseInt('${t.timeline}'.substr(8,2));
					var time2 = parseInt('${t.timeline}'.substr(8,2)) + 2;
					
					var time = time1 + " : 00 - " + time2 + " : 00";
					$('#time').text(time);
				</script>
			</c:forEach>
		</table>
		
	<script>
		/* 시간표 마우스 오버 효과 */
		$(function() {
			$('#timeTable').find("td").mouseenter(function() {
				$(this).parents("tr").css({"background":"rgb(137, 139, 77)", "color":"white", "cursor":"pointer"});
			}).mouseout(function() {
				$(this).parents("tr").css({"background":"none", "color":"black"});
			});
		});
	</script>
</body>
</html>