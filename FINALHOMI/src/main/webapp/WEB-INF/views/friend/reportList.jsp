<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/boardCommon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<link rel="stylesheet" href="${ contextPath }/resources/css/reset.css" type="text/css">
<title>Insert title here</title>
<style>
    section{width:70%; height:100%; margin:0 auto;}

/* 체크박스 */
input[type=button]{font-weight: bold;}
input[type=button]:hover{background:#000; color:#888c43; font-weight:bold;}


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

.tr-no > th:nth-child(1){width:5%;}
.tr-no > th:nth-child(2){width:10%;}
.tr-no > th:nth-child(3){width:10%;}
.tr-no > th:nth-child(4){width:9%;}
.tr-no > th:nth-child(5){width:18%;}
.tr-no > th:nth-child(6){width:20%;}
.tr-no > th:nth-child(7){width:14%;}
.tr-no > th:nth-child(8){width:10%;}

.tr-no > td:nth-child(1){width:6%;}
.tr-no > td:nth-child(2){width:9%;}
.tr-no > td:nth-child(3){width:11%;}
.tr-no > td:nth-child(4){width:9%;}
.tr-no > td:nth-child(5){width:18%;}
.tr-no > td:nth-child(6){width:20%;}
.tr-no > td:nth-child(7){width:14%;}
.tr-no > td:nth-child(8){width:11%;}


input[type=checkbox]{width:18px; height:18px;}

input.searchValue{height:25px;}
select{height:30px; width:100px;}
    
    
</style>
<body>
     
    <section>		
		<!-- 표 -->
		<div class="divTable" align="center">
			<table class="farmTable">
				<thead>
					<tr class="tr-no">
                        <th>B.T.N</th>
						<th>신고 번호</th>
						<th>신고 아이디</th>
						<th>대상 아이디</th>
						<th>신고 사유</th>
						<th>URL</th>
                        <th>신고 체크</th>
						<th>신고 일자</th>
					</tr>
				</thead>
			</table>
		</div>
		<div>
			<table class="farmTable">
				<tbody>
					<c:forEach var="r" items="${ list }">
					<tr class="tr-no">
						<td>
							<input type="hidden" value="${ r.rpNo }" class="checkOn">
							<input type="hidden" value="${ r.rpReciever }" class="rePId">
							<input type="hidden" value="${ r.rpCount }" class="rpCount">
							<input type="button" class="checkbox" name="check" value="check">
						</td>
						<td>${ r.rpNo }</td>
						<td>${ r.rpSender }</td>
						<td>${ r.rpReciever }</td>
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
	</script>
    <!-- 페이징 -->
	     <div class="pageing-box" style="text-align: center;">
            <!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					<div class="pre-box page-box1"></div>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="reportList.fo">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }" class="next-box page-box1">&gt;</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="white" size="4"><b style="background:#888c43; display:inline-block; width:10%; padding:5px 0; border-radius: 5px;">${ p }</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="reportList.fo">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<div class="next-box page-box1">&gt;</div>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="reportList.fo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }" class="next-box page-box1">&gt;</a>
				</c:if>
        </div>
</body>
</head>
</html>