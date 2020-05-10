<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<style>
	/* 테이블 */
	.table{border-collapse: collapse; width: 100%;} /* 테두리 겹 없애기 */
		.table td{padding: 4px;}
	.align{text-align: center;} /* 가운데 정렬 */
	
	/* 상태 버튼 */
	.status{border: none; color: white; border-radius: 3px; padding: 3px 0;}
		.on{background: #888c43;} /* 진행 */
		.off{background: rgb(120, 120, 120);} /* 마감 */
		
		
	#pagingArea{text-align: left; padding: 5px;}
	#pagingArea button{font-weight: bold;}
	
	.pageNum, #before, #next, #current{width:30px; height:30px; border-radius:5px; background-color:white; font-size:14px; padding:5px;}
	
	button:hover{cursor:pointer;}
</style>
</head>
<body>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<table class="table classList" id="listTable" style="width: 100%;">
		<tr style="border-bottom: 1px solid gray; line-height: 30px;">
			<th style="width: 50px;">상태</th>
			<th style="text-align: left;">텃밭 이름</th>
			<th>텃밭 주인</th>
			<th>모종</th>
			<th>대상</th>
			<th>업로드 날짜</th>
		</tr>
		<c:if test="${lbList != null}">
		<c:forEach var="lb" items="${lbList}">
			<tr class="tr-no" style="line-height: 30px;">
				<td class="align"><div class="status on">진행</div></td>
				<td style="overflow: hidden;"><input type="hidden" value="${lb.postNo}">${lb.title}</td>
				<td class="align">${lb.nickName}</td>
				<td class="align">${lb.hobbyName}</td>
				<c:if test="${lb.learner eq 'low'}">
					<td class="align">초급자</td>
				</c:if>
				<c:if test="${lb.learner eq 'middle'}">
					<td class="align">중급자</td>
				</c:if>
				<c:if test="${lb.learner eq 'high'}">
					<td class="align">고급자</td>
				</c:if>
				<td class="align">${lb.writeDate}</td>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${empty lbList}">
			<tr>
				<td colspan="6" style="text-align: center; cursor: default;">현재 진행중인 강의가 존재하지 않습니다.</td>
			</tr>
		</c:if>
	</table>
	
	<!-- 페이징 -->
			<div class="pagingArea" style="text-align: center; padding-top: 10px; position: absolute; bottom: 0; left: 10%; right: 10%;">
				<!-- [이전] -->
            <c:if test="${ pi.currentPage <= 1 }">
               <button id="before" style="background:lightgray; color:white" disabled>&lt;</button>
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
               <c:url var="before" value="lectureList.mp">
                  <c:param name="page" value="${ pi.currentPage - 1 }"/>
               </c:url>
               <a href="${ before }"><button style="background:#675141; color:white" id="before">&lt;</button></a>
            </c:if>
            
            <!-- 페이지 -->
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
               <c:if test="${ p eq pi.currentPage }">
                  <button type="button" style="font-wieght:bold; background:#888c43; color:white" id="current">${ p }</button>
               </c:if>
               
               <c:if test="${ p ne pi.currentPage }">
                  <c:url var="pagination" value="lectureList.mp">
                     <c:param name="page" value="${ p }"/>
                  </c:url>
                  <a href="${ pagination }"><button type="button" class=pageNum>${ p }</button></a>
               </c:if>
            </c:forEach>
            
            <!-- [다음] -->
            <c:if test="${ pi.currentPage >= pi.maxPage }">
               <button type="button" id=next style="background:lightgray; color:white" disabled>&gt;</button>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
               <c:url var="after" value="lectureList.mp">
                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
               </c:url> 
               <a href="${ after }"><button type="button" id=next style="font-wieght:bold; background:#675141; color:white">&gt;</button></a>
            </c:if>
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
	
	$(function(){
     	$('.tr-no').click(function(){
     		var postNo = $(this).children('td').find('input').val();
     		console.log(postNo);
         	/* window.open('detail?postNo=' + postNo); */
         	parent.location.href='detail.lec?postNo=' + postNo;
     	});
     });
</script>
</body>
</html>