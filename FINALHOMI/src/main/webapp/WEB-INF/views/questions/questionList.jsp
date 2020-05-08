<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<style>
	.qTable{overflow:hidden; width:100%; margin:0 auto; padding: 10px; font-size: 16px;}
	.qTable td{padding: 16px; text-align: center;}
	thead th{height:30px; color: rgb(103,81,65);}
	
	.tablaLine tr{border: 1px solid red;}
	
	#pagingArea{text-align: center; padding: 5%;}
	#buttonTab > button {width:40px; height:40px; border-radius:5px; border:0px; background-color:white; font-size:16px; padding:5px;}
 	#start:hover, #end:hover{font-wieght:bold; background:#675141; color:white}
	#searchArea{text-align: center; margin-bottom: 5%;}
	
	.startBtn, .end, .pageNum, #before, #next {width:40px; height:40px; border-radius:5px; border:0px; background-color:white; font-size:16px; padding:5px;}
	
	.buttonG{width:100px; background-color:#888c43; color:#fff; border:none; padding:10px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}
	.pagingBtn{width: 60px; height: 40px; text-align: center; vertical-align: middle; border: none; border-radius: 3px; font-size: 18px;}
			   

	.outer{
		width:70%; min-height:50px; margin:auto; 
	}
	
	a{display: inline !important; }
	button:hover{cursor:pointer;}
	
</style>
</head>
<body>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<c:import url='../common/boardCommon.jsp'/>
	<script>
	$('#bName').text(' 1:1 ');
	$('#bNameAfter').text('문의게시판');
	$('#bName').css('cursor', 'pointer');
	$('#bNameAfter').css('cursor', 'pointer');
	
	$('#bName').click(function() {
		location.href="qlist.qu";
	});
	$('#bNameAfter').click(function() {
		location.href="qlist.qu";
	});
	</script>
	
	<div class="outer">
		<!-- 글 목록 테이블 -->
		<div style="border: 1px solid #000; border-radius: 10px; padding: 1%;">
			<table class="qTable tableLine">
				<tr>
					<th>No.</th>
					<th style="width: 500px;">제목</th>
					<th>작성자</th>
					<th>게시일</th>
					<th>답변</th>
				</tr>
			</table>
		</div>
		<div>
			<table class="qTable" id="tableCon" style="border-collapse: collapse;">
				<c:forEach var="q" items="${ list }">
						<c:if test="${loginUser.nickName == q.writer || loginUser.mKind == 0}">
							<tr class="tr-no" style="font-weight: bold;">
								<td>${ q.post_no }</td>
								<td style="width: 500px;"><c:url var="qdetail"
										value="qdetail.qu">
										<c:param name="post_no" value="${ q.post_no }" />
										<c:param name="page" value="${ pi.currentPage }" />
									</c:url> <a href="${ qdetail }">${ q.title }</a></td>
								<td>${ q.writer }</td>
								<td>${ q.modify_date }</td>
								<c:if test="${ q.report_yn == 'Y'}">
									<td>완료</td>
								</c:if>
								<c:if test="${ q.report_yn == 'N'}">
									<td style="color: gray; font-weight: normal;">미답변</td>
								</c:if>
							</tr>
						</c:if>
						<c:if test="${loginUser.nickName != q.writer  && loginUser.mKind != 0 }">
							<tr class="tr-no">
								<td>${ q.post_no }</td>
								<td style="width: 500px;">${ q.title }</td>
								<td>${ q.writer }</td>
								<td>${ q.modify_date }</td>
								<c:if test="${ q.report_yn == 'Y'}">
									<td>완료</td>
								</c:if>
								<c:if test="${ q.report_yn == 'N'}">
									<td style="color: gray; font-weight: normal;">미답변</td>
								</c:if>
							</tr>
						</c:if>
				</c:forEach>
			</table>
		</div>
		
		<!-- 페이징, 글쓰기 버튼 -->
		<div id="pagingArea" style="position: relative;">
			<!-- 맨 앞 -->
			  <c:if test="${ pi.currentPage <= 1 }">
                 <button class="startBtn" style="background:lightgray; color:white" disabled>&lt;&lt;</button>
              </c:if>
              <c:if test="${ pi.currentPage ne 1 }">
                 <c:url var="first" value="qlist.qu">
                    <c:param name="page" value="1"/>            
                 </c:url>
                 <a href="${ first }">
                    <button class="startBtn" style="background:#675141; color:white">&lt;&lt;</button>
                 </a>
              </c:if>
          
            <!-- [이전] -->
            <c:if test="${ pi.currentPage <= 1 }">
               <button id="before" style="background:lightgray; color:white" disabled>&lt;</button>
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
               <c:url var="before" value="qlist.qu">
                  <c:param name="page" value="${ pi.currentPage - 1 }"/>
               </c:url>
               <a href="${ before }"><button style="background:#675141; color:white" id="before">&lt;</button></a>
            </c:if>
            
            <!-- 페이지 -->
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
               <c:if test="${ p eq pi.currentPage }">
                  <button type="button" style="font-wieght:bold; background:#888c43; color:white" class="pageNum" id="current">${ p }</button>
               </c:if>
               
               <c:if test="${ p ne pi.currentPage }">
                  <c:url var="pagination" value="qlist.qu">
                     <c:param name="page" value="${ p }"/>
                  </c:url>
                  <a href="${ pagination }"><button class=pageNum>${ p }</button></a>
               </c:if>
            </c:forEach>
            
            <!-- [다음] -->
            <c:if test="${ pi.currentPage >= pi.maxPage }">
               <button id="next" style="background:lightgray; color:white;" disabled>&gt;</button>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
               <c:url var="after" value="qlist.qu">
                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
               </c:url> 
               <a href="${ after }"><button type="button" id="next" style="background:#675141; color:white">&gt;</button></a>
            </c:if>
            
           <!-- 맨 뒤로 -->
              <c:if test="${ pi.currentPage >= pi.maxPage }">
                 <button class="end" style="background:lightgray; color:white;" disabled>&gt;&gt;</button>
              </c:if>
              <c:if test="${ pi.currentPage < pi.maxPage }">
                 <c:url var="last" value="qlist.qu">
                    <c:param name="page" value="${ pi.maxPage }"/>            
                 </c:url>
                 <a href="${ last }"><button class="end" style="background:#675141; color:white">&gt;&gt;</button></a>
              </c:if>
			<div style="float: right;">
				<c:if test="${ !empty loginUser }">
					<button class="buttonG" style="position: absolute; right: 50px;" onclick="location.href='qInsertView.qu';">글쓰기</button>
				</c:if>
			</div>
		</div>
		
		<!-- 검색 -->
		<c:if test="${loginUser != null}">
			<div id="searchArea">
				<select id="searchOption" name="searchOption" style="height: 40px; width: 80px; font-size: 20px; text-align: center;">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				</select>
					<input type="text" id="searchContent" name="searchContent" style="height: 35px; width: 200px;">
					<button class="pagingBtn" style="background: #888c43; color: white;" onclick="questionSearch();">검색</button>
			</div>
		</c:if>
	</div>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
			
		/* 마우스 오버 효과 */
		$(function() {
			$('#tableCon').find("td").mouseenter(function() {
				$(this).parents("tr").css({"background":"rgb(137, 139, 77)", "color":"white", "cursor":"pointer"});
			}).mouseleave(function() {
				$(this).parents("tr").css({"background":"none", "color":"black"});
			});
		});
		
		 $(function(){
         	$('.tr-no').click(function(){
         		var post_no = $(this).children('td').eq(0).text();
         		var writer = $(this).children('td').eq(2).text();
    			
         		var loginUser = "${ loginUser.nickName }";
	         	var loginLevel = "${loginUser.mKind}";
	         	
         		if(loginUser == writer || loginLevel == '0') {  // 본인 / 운영자 아니면 글 못들어가게 하기
	         		location.href="qdetail.qu?post_no=" + post_no + "&page=" + ${pi.currentPage};
         		} else {
         			swal("게시글 열람 권한이 없습니다.",{
						icon : "info",
						buttons : {
							확인 : true,
						}
					});
         		}
         	});
         });
		
		/* 검색 */
		function questionSearch() {
			var sCategory = $('#searchOption').val();
				console.log(sCategory);
			var sContent = $('#searchContent').val();
				console.log(sContent);
			location.href="qlist.qu?sCategory=" + sCategory + "&sContent=" + sContent;
		}
	</script>
</body>
</html>