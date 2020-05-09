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
		var year = parseInt('${date}'.substr(0,4));
		var month = parseInt('${date}'.substr(4,2));
		var day = parseInt('${date}'.substr(6,2));
		
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
			<thead>
				<tr style="border-bottom: 1px solid gray; line-height: 30px;">
					<th style="width: 120px;">시간</th>
					<th>제목</th>
					<th style="width: 120px;">모종</th>
					<th style="width: 80px;">종류</th>
					<th style="width: 80px;">수강생</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty timeline}">
					<tr style="border-bottom: 1px solid rgb(225, 225, 225); line-height: 25px;">
						<td colspan="5"> 강의 없음! </td>
					</tr>
				</c:if>
				<c:if test="${!empty timeline}">
					<c:forEach var="i" begin="9" end="23">
						<tr style="border-bottom: 1px solid rgb(225, 225, 225); line-height: 25px;">
							<td class="tr-no" id="time"><input type="hidden" value="${i}">${i}:00 - ${i+1}:00</td>
							<td class="tr-no"><input type="hidden"></td>
							<td class="tr-no"></td>
							<td class="tr-no"></td>
							<td class="id" ><input type="hidden"></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
	</table>
		<c:forEach var="t" items="${timeline}">
				<script>
					for(var i = 0; i < 15; i++) {
						var tr = $('#timeTable').children().eq(1).children().eq(i); // 모든 시간(행) 돌기(9~23)
							var time = tr.children().eq(0).children().val(); // 시작시간 i 가져오기
							var postNo = tr.children().eq(1);
							var title = tr.children().eq(1);
							var hobbyName = tr.children().eq(2);
							var tKind = tr.children().eq(3);
							var learnerNick = tr.children().eq(4);
							var learnerId = tr.children().eq(4);
							
							var ot = ${t.otTime};
							var time1 = parseInt('${t.timeline}'.substr(8,2));
							if(!ot) {
								if(time == time1) {
									postNo.val('${t.postNo}');
									title.text('${t.title}');
									hobbyName.text('${t.hobbyName}');
									if('${t.tKind}' == 'low') {
										tKind.text('초급');
									} else if('${t.tKind}' == 'middle'){
										tKind.text('중급');
									} else {
										tKind.text('고급');
									}
									learnerNick.text('${t.learnerNick}');
									learnerId.val('${t.learnerId}');
								}
							} else if(ot){
								for(var j = 1; j <= ot; j++) {
									if(time == time1+j) {
										postNo.val('${t.postNo}');
										title.text('${t.title}');
										hobbyName.text('${t.hobbyName}');
										if('${t.tKind}' == 'low') {
											tKind.text('초급');
										} else if('${t.tKind}' == 'middle'){
											tKind.text('중급');
										} else {
											tKind.text('고급');
										}
										learnerNick.text('${t.learnerNick}');
										learnerId.val('${t.learnerId}');
									}
								}
							}
					}
					
					</script>
		</c:forEach>
		
	<script>
		/* 시간표 마우스 오버 효과 */
		$(function() {
			$('#timeTable').find("td").mouseenter(function() {
				$(this).parents("tr").css({"background":"rgb(137, 139, 77)", "color":"white", "cursor":"pointer"});
			}).mouseout(function() {
				$(this).parents("tr").css({"background":"none", "color":"black"});
			});
		});
		
		$(function(){ 
         	$('.tr-no').click(function(){
         		var postNo = $(this).parents("tr").children().eq(1).val();
         		parent.location.href='detail.lec?postNo=' + postNo;
         	});
         	
         	$('.id').click(function(){
         		var userId = $(this).parents("tr").children().eq(4).val()
         		window.open('userInfo.fo?userId=' + userId + '&page=1','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');
         	});
		});
	</script>
</body>
</html>