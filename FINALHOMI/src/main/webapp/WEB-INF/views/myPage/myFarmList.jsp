<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<style>
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
	
	#pagingArea{text-align: left; padding: 5px;}
	#pagingArea button{font-weight: bold;}
	
	.pageNum, #before, #next, #current{width:30px; height:30px; border-radius:5px; border:0px; background-color:white; font-size:14px; padding:5px;}
	
</style>
</head>
<body>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<div style=" background: white; padding: 5px; height: 630px;">
	<table class="table">
				<tr style="border-bottom: 1px solid gray;">
					<th style="padding: 10px;">텃밭 이름</th>
					<th>텃밭 주인</th>
					<th>모종 종류</th>
					<th>인원</th>
				</tr>
				<c:if test="${!empty gfList}">
					<c:forEach var="gf" items="${gfList}">
						<tr>
							<td><input type="hidden" value="글번호넣기">${gf.title}</td>
							<td>${gf.nickName}</td>
							<td>${gf.hobbyName}</td>
							<td>${gf.personnel}</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty gfList}">
					<tr>
						<td colspan="4" style="text-align: center;">
							현재 진행중인 모임이 없네요
						</td>
					</tr>
				</c:if>
			</table>
			<div class="pagingArea"> <!-- 페이징 -->
				<div id="pagingArea" style="position: absolute; left: 38%; bottom: 20px; text-align: center;">
				<!-- [이전] -->
	            <c:if test="${ pi.currentPage <= 1 }">
	               <button class="pagingBtn" id="before">&lt;</button>
	            </c:if>
	            <c:if test="${ pi.currentPage > 1 }">
	               <c:url var="before" value="myFarm.mp">
	                  <c:param name="page" value="${ pi.currentPage - 1 }"/>
	               </c:url>
	               <a href="${ before }"><button class="pagingBtn arrows" style="background:#675141; color:white" id="before">&lt;</button></a>
	            </c:if>
	            
	            <!-- 페이지 -->
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	               <c:if test="${ p eq pi.currentPage }">
	                  <button type="button" class="pagingBtn" style="font-wieght:bold; background:#888c43; color:white" id="current">${ p }</button>
	               </c:if>
	               
	               <c:if test="${ p ne pi.currentPage }">
	                  <c:url var="pagination" value="myFarm.mp">
	                     <c:param name="page" value="${ p }"/>
	                  </c:url>
	                  <a href="${ pagination }"><button type="button" class="pagingBtn">${ p }</button></a>
	               </c:if>
	            </c:forEach>
	            
	            <!-- [다음] -->
	            <c:if test="${ pi.currentPage >= pi.maxPage }">
	               <button type="button" class="pagingBtn" id=next>&gt;</button>
	            </c:if>
	            <c:if test="${ pi.currentPage < pi.maxPage }">
	               <c:url var="after" value="myFarm.mp">
	                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
	               </c:url> 
	               <a href="${ after }"><button type="button" class="pagingBtn arrows" id=next style="font-wieght:bold; background:#675141; color:white">&gt;</button></a>
	            </c:if>
			</div>
		</div>
	</div>
	<script>
		/* 내 강의 마우스 오버 효과 */
		$(function() {
			$('.table').find("td").mouseenter(function() {
				$(this).parents("tr").css({"background":"rgb(137, 139, 77)", "color":"white", "cursor":"pointer"});
			}).mouseout(function() {
				$(this).parents("tr").css({"background":"none", "color":"black"});
			});
		});
		
		$(function(){
	     	$('.tr-no').click(function(){
	     		var postNo = $(this).children('td').find('input').val();
	     		console.log(postNo);
	         	parent.location.href='bdetail.gf?postNo=' + postNo;
	     	});
	     });
	</script>
</body>
</html>