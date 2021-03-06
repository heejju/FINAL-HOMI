<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
section{width:70%; height:100%; margin:0 auto;}

/* 체크박스 */
input[type=checkbox]{width:18px; height:18px;}

/* 이미지 */
.pin{width:20px; height:20px;}

/* 테이블 */

.divTable{width:100%; border:1px solid #000; box-sizing:border-box; border-radius:5px; padding:13px 10px; margin-top:5%; font-size:14pt;}
.farmTable{width:100%; border-collapse:collapse; text-align:center;}
.farmTable>thead{color:#675141;}
.farmTable>thead>th, td{padding:20px; font-size:13pt;}
.farmTable>thead>th{width:20%; padding:10px;}
.farmTable>thead>th:first-child{border-radius:5% 0 0 5%;}
.farmTable>thead>th:last-child{border-radius:0 5% 5% 0;}

.farmTable>tbody tr:hover{cursor:pointer; background: #888c43; color:#fff;}
.buttonG{width:120px; background-color:#888c43; color:#fff; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}
.buttonB{width:120px; background-color:#675141; color:#fff; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}

.tr-no > th:nth-child(1){width:5%;}
.tr-no > th:nth-child(2){width:45%;}
.tr-no > th:nth-child(3){width:20%;}
.tr-no > th:nth-child(4){width:20%;}
.tr-no > th:nth-child(5){width:10%;}

.tr-no > td:nth-child(1){width:5%;}
.tr-no > td:nth-child(2){width:45%;}
.tr-no > td:nth-child(3){width:20%;}
.tr-no > td:nth-child(4){width:20%;}
.tr-no > td:nth-child(5){width:10%;}

/* 페이징 */
#paging{margin: 30px auto; width: 800px;}
#buttonTab > button {width:40px; height:40px; border-radius:5px; border:0px; background-color:white; font-size:16px; padding:5px;}
button:hover{cursor:pointer;}
#startBtn:hover{font-wieght:bold; background:#675141; color:white}
#endBtn:hover{font-wieght:bold; background:#675141; color:white}
.startBtn, .endBtn, .pageNum, #before, #next {width:40px; height:40px; border-radius:5px; border:0px; background-color:white; font-size:16px; padding:5px;}
.a_tag{display:inline !important;}	

/* 검색창 */
.searchArea{text-align:center; margin:0 20px 20px 20px;}
.selectArea{margin-top:0px; display:inline-block; border:0.5px solid lightgray;}
#nSelect{height: 37px; width: 80px; font-size: 20px; text-align: center;}
.wordArea{width:300px; height:35px; border:1px solid lightgray; background:#fff; display:inline-block; vertical-align:bottom;}
#nWord{font-size:18px; height:auto; padding:5px; border: 0px; outline:none; float:left;}
#searchBtn{width:60px; height:36px; border: 0px; border-radius:0px; background: #888c43; outline: none; float:right; color: #fff; font-size:18px;}


</style>
</head>
<body>
	<c:import url='../common/boardCommon.jsp'/>
	<script>
		$('#bName').text('공지');
		$('#bNameAfter').text('사항');
		
		$('#bName').css('cursor', 'pointer');
		$('#bNameAfter').css('cursor', 'pointer');
		
		$('#bName').click(function() {
			location.href="nlist.no";
		});
		$('#bNameAfter').click(function() {
			location.href="nlist.no";
		});
		
	</script>
	
	<section>
		<!-- 표 -->
		<div class="divTable" align="center">
			<table class="farmTable">
				<thead>
					<tr class="tr-no">
						<th>No.</th>
						<th>제목</th>
						<th>작성자</th>
						<th>게시일</th>
						<th>조회수</th>
					</tr>
				</thead>
			</table>
		</div>
		<div>
			<table class="farmTable">
				<tbody>
				<c:forEach var="n" items="${ list }">
				<tr class="tr-no">
					<c:if test="${ n.post_fix eq 'N'}">
						<td id="no"><input type="hidden" name="post_no" id="post_no" value="${ n.post_no }">${ n.post_no }</td>
					</c:if>
					<c:if test="${ n.post_fix ne 'N' }">
						<td id="no"><input type="hidden" name="post_no" id="post_no" value="${ n.post_no }"><img class="pin" src="${ contextPath }/resources/images/pin.png"></td>
					</c:if>
					<td>${ n.title }</td>
					<c:if test="${ n.writer eq 'admin'}">
						<td>관리자</td>
					</c:if>
					<td>${ n.write_date }</td>
					<td>${ n.view_count }</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>			
		
		
		<!-- 페이징 -->
      <div id="paging">
         <!-- 페이징 처리 -->
         <div align="center" id="buttonTab">
         		<c:if test="${ nWord eq null}">
	        		<c:set var="loc" value="/nlist.no" scope="page"/>
	        	</c:if>
	        	<c:if test="${ nWord ne null }">
	        		<c:set var="loc" value="/nSearchList.no" scope="page"/>
	        	</c:if>
            <!-- 맨 앞으로 -->
	             <c:if test="${ pi.currentPage <= 1 }">
	                <button class="startBtn" style="background: lightgray; cursor: default;" disabled>&lt;&lt;</button>
	             </c:if>
	             <c:if test="${ pi.currentPage ne 1 }">
	                <c:url var="first" value="${ loc }">
	                	<c:if test="${ nWord ne null }">
	                		<c:param name="nSelect" value="${ nSelect }"/>
	                		<c:param name="nWord" value="${ nWord }"/>
	                	</c:if>
	                	<c:param name="page" value="1"/>            
	                </c:url>
	                <a class="a_tag" href="${ first }">
	                   <button class="startBtn" style="background:#e0e0e0; color:black">&lt;&lt;</button>
	                </a>
	             </c:if>
	           <!-- [이전] -->
	           <c:if test="${ pi.currentPage <= 1 }">
	              <button id="before"  style="background: lightgray; cursor: default;">&lt;</button>
	           </c:if>
	           <c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="${ loc }">
	              		<c:if test="${ nWord ne null }">
	                		<c:param name="nSelect" value="${ nSelect }"/>
	                		<c:param name="nWord" value="${ nWord }"/>
	                	</c:if>
	                 	<c:param name="page" value="${ pi.currentPage - 1 }"/>
	              	</c:url>
	             	<a class="a_tag" href="${ before }"><button style="background:#675141; color:white" id="before">&lt;</button></a>
	           </c:if>
	           <!-- 페이지 -->
	           <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	              <c:if test="${ p eq pi.currentPage }">
	                 <button style="font-weight:bold; background:#888c43; color:white" id="current">${ p }</button>
	              </c:if>
	              
	           		<c:if test="${ p ne pi.currentPage }">
		              	<c:if test="${ nWord eq null }">
		              		<c:url var="pagination" value="${ loc }">
		              			<c:param name="page" value="${ p }"/>
		              		</c:url>
		              	</c:if>
		                <c:if test="${ nWord ne null }">
		               		<c:url var="pagination" value="${ loc }">
		                		<c:param name="nSelect" value="${ nSelect }"/>
		                		<c:param name="nWord" value="${ nWord }"/>
		                		<c:param name="page" value="${ p }"/>
		                	</c:url>
		                </c:if>
		                
	                <a class="a_tag" href="${ pagination }"><button class="pageNum" style="font-weight:normal; background:white; color:black;">${ p }</button></a>
	              	</c:if>
	           </c:forEach>
	           <!-- [다음] -->
	           <c:if test="${ pi.currentPage >= pi.maxPage }">
	              <button id="next"  style="background: lightgray; cursor: default;" disabled>&gt;</button>
	           </c:if>
	           <c:if test="${ pi.currentPage < pi.maxPage }">
	              <c:url var="after" value="${ loc }">
	              		<c:if test="${ nWord ne null }">
	                		<c:param name="nSelect" value="${ nSelect }"/>
	                		<c:param name="nWord" value="${ nWord }"/>
	                	</c:if>
	             	   <c:param name="page" value="${ pi.currentPage + 1 }"/>
	              </c:url> 
	              <a class="a_tag" href="${ after }"><button id="next" style="background:#675141; color:white">&gt;</button></a>
	           </c:if>
	           
	           <!-- 맨 뒤로 -->
	             <c:if test="${ pi.currentPage > pi.maxPage }">
	                <button class="endBtn"  style="background: lightgray; cursor: default;" disabled>&gt;&gt;</button>
	             </c:if>
	             <c:if test="${ pi.currentPage <= pi.maxPage }">
	                <c:url var="last" value="${ loc }">
	                	<c:if test="${ nWord ne null }">
	                		<c:param name="nSelect" value="${ nSelect }"/>
	                		<c:param name="nWord" value="${ nWord }"/>
	                	</c:if>
	                 	<c:param name="page" value="${ pi.maxPage }"/>            
	                </c:url>
	                <a class="a_tag" href="${ last }">
	                   <button class="endBtn" style="background:#e0e0e0; color:black">&gt;&gt;</button>
	                </a>
	             </c:if>
         </div>
       </div>  

		<!-- 하단 버튼 -->
		<div align=right>
			<c:if test="${ loginUser.userId eq 'admin' }">
				<button class="buttonG" onclick="location.href='ninsertView.no'">글쓰기</button>
			</c:if>
		</div>
		
		<!-- 검색 -->
		<div>
		   <div class="searchArea">
		      <div class="selectArea">
		         <select name="nSelect" id="nSelect" style="border-radius:0px;">
		            <option value="title" selected>제목</option>
		            <option value="content">내용</option>
		         </select>
		               <!-- <input type="hidden" name="searchSelect" id="searchSelect"> -->
		      </div>
		      <div class="wordArea">
		         <input type="text" placeholder="검색어 입력" name="nWord" id="nWord" onKeyDown="if(event.keyCode == 13) search()">
		         <button  id="searchBtn" onClick="search();">검색</button>
		       </div>
		    </div>
		</div>
	</section>
	
	<script>
		// 검색창
		function search(){
			var nSelect = $('#nSelect').val();
			var nWord = $('#nWord').val();
				location.href="nSearchList.no?nSelect=" + nSelect + "&nWord=" + nWord;
		}
		
		// 페이징
		$(function(){
			$('.pageNum').mouseenter(function(){
				$(this).css({'font-weight':'bold', 'background':'#888c43', 'color':'white'});
			});
			
			$('.pageNum').mouseleave(function(){
				$(this).css({'font-weight':'normal', 'background':'white', 'color':'black'});
			});
		});
		 
		$("#pageNum").hover(function(){
            $('#pageNum').css({'font-weight':'bold', 'background':'#888c43', 'color':'white'});
            $('#current').css({'font-weight':'none', 'background':'#none', 'color':'none'});
         });
         
		
		// 로그인
         $(function(){
         	 var loginUser = "${ loginUser }";
              var isEmpty = function(val) {
                    if(val == "" || val === null || val == undefined
                          || (val != null && typeof val === "object" && !Object.keys(val).length)){
                       return true
                    } else { 
                       return false
                    }
              };
         	
         	$('.tr-no').click(function(){
         		if(loginUser == null){
         			alert("로그인이 필요한 서비스입니다.");
         			location.href="loginView.me";
         		} else {
	            		var post_no = $(this).children('td').children($('#post_no')).val();
	            		location.href="ndetail.no?post_no=" + post_no + "&page=" + ${pi.currentPage};
         		}
         	});
         });
	</script>
	
	
	
</body>
</html>