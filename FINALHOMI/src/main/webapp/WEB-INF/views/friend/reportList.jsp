<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/boardCommon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%-- <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<link rel="stylesheet" href="${ contextPath }/resources/css/reset.css" type="text/css"> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+And+White+Picture|Nanum+Brush+Script&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
    section{width:70%; height:100%; margin:0 auto;}

/* 체크박스 */
input[type=button]{font-weight: bold;}
input[type=button]:hover{background:#000; color:#888c43; font-weight:bold; cursor: pointer;}


.divTable{width:100%; border:1px solid #000; box-sizing:border-box; border-radius:5px; padding:5px 10px; margin-top:5%;}
.farmTable{width:100%; border-collapse:collapse; text-align:center;}
.farmTable>thead{color:#675141;}
.farmTable>thead>th, td{padding:15px;}
.farmTable>thead>th{width:20%; padding:10px;}
.farmTable>thead>th:first-child{border-radius:5% 0 0 5%;}
.farmTable>thead>th:last-child{border-radius:0 5% 5% 0;}

.farmTable>tbody tr:hover{cursor:pointer; background: #888c43; color:#fff;}
.buttonG{width:100px; background-color:#888c43; color:#fff; border:none; padding:10px 0; text-align:center; font-size:15px; margin:4px; cursor:pointer; border-radius:5px;}
.buttonB{width:100px; background-color:#675141; color:#fff; border:none; padding:10px 0; text-align:center; font-size:15px; margin:4px; cursor:pointer; border-radius:5px;}


.tr-no > th:nth-child(1){width:10%;}
.tr-no > th:nth-child(2){width:10%;}
.tr-no > th:nth-child(3){width:9%;}
.tr-no > th:nth-child(4){width:18%;}
.tr-no > th:nth-child(5){width:20%;}
.tr-no > th:nth-child(6){width:14%;}
.tr-no > th:nth-child(7){width:10%;}
.tr-no > th:nth-child(8){width:6%;}

.tr-no > td:nth-child(1){width:9%;}
.tr-no > td:nth-child(2){width:11%;}
.tr-no > td:nth-child(3){width:9%;}
.tr-no > td:nth-child(4){width:18%;}
.tr-no > td:nth-child(5){width:20%;}
.tr-no > td:nth-child(6){width:14%;}
.tr-no > td:nth-child(7){width:11%;}
.tr-no > td:nth-child(8){width:6%;}


input[type=checkbox]{width:18px; height:18px;}

input.searchValue{height:25px;}
select{height:30px; width:100px;}
    
/*페이지*/
	button.nextPBtn{
		border: 0px; border-radius: 5px; background: rgb(103, 81, 65); color: white;  
		adding: 7px 12px 7px 12px; cursor: pointer; font-size: 16px; display:inline-block;
	}
	button.pagingBtn{
	   border: 0px; border-radius: 5px; background: white; color: black; 
	   padding: 7px 12px 7px 12px; cursor: pointer; font-size: 16px; display:inline-block;
	}
	button.pagingSelBtn{
	   border: 0px; border-radius: 5px; background: rgb(136, 140, 67); color: white; font-weight: bold;
	   padding: 7px 12px 7px 12px; font-weight: bolder; font-size: 16px; display:inline-block;
	}
	.nextPBtn{
		border: 0px; border-radius: 5px; background: rgb(103, 81, 65); color: white;  
		padding: 7px 12px 7px 12px; cursor: pointer; font-size: 16px; display:inline-block;
	}
	.pagingBtn{
	   border: 0px; border-radius: 5px; background: white; color: black; 
	   padding: 7px 12px 7px 12px; cursor: pointer; font-size: 16px; display:inline-block;
	}
	.pagingSelBtn{
	   border: 0px; border-radius: 5px; background: rgb(136, 140, 67); color: white; font-weight: bold;
	   padding: 7px 12px 7px 12px; font-weight: bolder;  font-size: 16px; display:inline-block;
	}
</style>
<body>
     <script>
	 	$('#bName').text(' 신고 ');
	 	$('#bNameAfter').text('목록');
	 </script>
    <section>		
		<!-- 표 -->
		<div class="divTable" align="center">
			<table class="farmTable">
				<thead>
					<tr class="tr-no">
						<th>신고 번호</th>
						<th>신고 아이디</th>
						<th>대상 아이디</th>
						<th>신고 사유</th>
						<th>URL</th>
                        <th>신고 체크</th>
						<th>신고 일자</th>
						<th>B.T.N</th>
					</tr>
				</thead>
			</table>
		</div>
		<div>
			<table class="farmTable">
				<tbody>
					<c:forEach var="r" items="${ list }">
					<tr class="tr-no">
						<td>${ r.rpNo }</td>
						<c:url var="userInfo" value="userInfo.fo">
							<c:param name="userId" value="${ r.rpSender }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>	
						<td onclick="window.open('${ userInfo }','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');">${ r.rpSender }</td>
						<c:url var="userInfo2" value="userInfo.fo">
							<c:param name="userId" value="${ r.rpReciever }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						<td onclick="window.open('${ userInfo2 }','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');">${ r.rpReciever }</td>
						<td>${ r.rpDetail }</td>
						<td>${ r.rpUrl }</td>
						<td>
							<c:if test="${ r.check eq 'N' }">
								미확인
							</c:if>
							<c:if test="${ r.check ne 'N' }">
								확인
							</c:if>
						</td>
						<td>${ r.rpDate }</td>
						<td>
							<input type="hidden" value="${ r.rpNo }" class="checkOn">
							<input type="hidden" value="${ r.rpReciever }" class="rePId">
							<input type="hidden" value="${ r.rpCount }" class="rpCount">
							<input type="button" class="checkbox" name="check" value="확 인" style="width:100%; margin-bottom:10px;">
							<input type="button" class="resetbox" name="reset" value="삭 제" style="width:100%;">
						</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>	
    </section>
    <script>
		$(".checkbox").click(function(){ 
			var rpNo = $(this).parent().children(".checkOn").val();
			var rpReciever = $(this).parent().children(".rePId").val();
			var rpCount = $(this).parent().children(".rpCount").val();
   			console.log(rpNo);
   			$.ajax({
   				url:"checkOn.fo",
   				data: {rpNo:rpNo, rpReciever:rpReciever, rpCount:rpCount},
   				type:"post",
   				success: function(data){
   					if(data == "success"){
   						location.href="reportList.fo";
   					}
   				 }
   			});
		});
		$(".resetbox").click(function(){ 
			var rpNo = $(this).parent().children(".checkOn").val();
   			console.log(rpNo);
   			$.ajax({
   				url:"reportreset.fo",
   				data: {rpNo:rpNo},
   				type:"post",
   				success: function(data){
   					if(data == "success"){
   						location.href="reportList.fo";
   					}
   				 }
   			});
		});
	</script>
    <!-- 페이징 -->
    <div align="center" style="margin-top:30px; margin-bottom:30px;">
         <!-- 맨 처음과 이전 버튼 -->
         <c:if test="${ pi.currentPage <= 1 }">
            <button type="button" class="nextPBtn" style="background: lightgray; cursor: default;">&lt;&lt;</button>
            <button type="button" class="nextPBtn" style="background: lightgray; cursor: default;">&lt;</button>
         </c:if>
         <c:if test="${ pi.currentPage > 1 }">
         	<c:url var="before" value="reportList.fo">
				<c:param name="page" value="${ pi.currentPage - 1 }"/>
			</c:url>
			<c:url var="Start" value="reportList.fo">
				<c:param name="page" value="${ pi.startPage }"/>
			</c:url> 
            <a class="nextPBtn" href="${ Start }">&lt;&lt;</a>
            <a class="nextPBtn" href="${ before }">&lt;</a>
         </c:if>
         <!-- 5개의 페이지목록 -->
         <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            <c:if test="${ p eq pi.currentPage }">
               <button type="button" class="pagingSelBtn">${ p }</button>
            </c:if>
            <c:if test="${ p ne pi.currentPage }">
	            <c:url var="pagination" value="reportList.fo">
					<c:param name="page" value="${ p }"/>
				</c:url>
               <a class="pagingBtn" href="${ pagination }" style="">${ p }</a>
            </c:if>
         </c:forEach>
         <!-- 맨끝으로버튼 -->
         <c:if test="${ pi.currentPage < pi.maxPage }">
         	<c:url var="after" value="reportList.fo">
				<c:param name="page" value="${ pi.currentPage + 1 }"/>
			</c:url> 
			<c:url var="End" value="reportList.fo">
				<c:param name="page" value="${ pi.maxPage }"/>
			</c:url> 
            <a class="nextPBtn" href="${ after }">&gt;</a>
            <a class="nextPBtn" href="${ End }">&gt;&gt;</a>
         </c:if>
         <c:if test="${ pi.currentPage >= pi.maxPage }">
            <button type="button" class="nextPBtn" style="background: lightgray; cursor: default;">&gt;</button>
            <button type="button" class="nextPBtn" style="background: lightgray; cursor: default;">&gt;&gt;</button>
         </c:if>
      </div>
</body>
</head>
</html>