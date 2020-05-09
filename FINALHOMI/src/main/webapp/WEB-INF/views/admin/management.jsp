<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
section{width:70%; height:100%; margin:0 auto;}

/* 체크박스 */
input[type=checkbox]{width:18px; height:18px;}


.divTable{width:100%; border:1px solid #000; box-sizing:border-box; border-radius:5px; padding:5px 10px; margin-top:5%;}
.farmTable{width:100%; border-collapse:collapse; text-align:center;}
.farmTable>thead{color:#675141;}
.farmTable>thead>th, td{padding:15px;}
.farmTable>thead>th{width:20%; padding:10px;}
.farmTable>thead>th:first-child{border-radius:5% 0 0 5%;}
.farmTable>thead>th:last-child{border-radius:0 5% 5% 0;}

.farmTable>tbody tr:hover{cursor:pointer; background: #888c43; color:#fff;}
.buttonG{width:100px; background-color:lightgray; color:#000; border:none; padding:10px 0; text-align:center; font-size:15px; margin:4px; cursor:pointer; border-radius:5px;}
.buttonB{width:100px; background-color:#675141; color:#fff; border:none; padding:10px 0; text-align:center; font-size:15px; margin:4px; cursor:pointer; border-radius:5px;}

.tr-no > th:nth-child(1){width:5%;}
.tr-no > th:nth-child(2){width:10%;}
.tr-no > th:nth-child(3){width:10%;}
.tr-no > th:nth-child(4){width:9%;}
.tr-no > th:nth-child(5){width:12%;}
.tr-no > th:nth-child(6){width:14%;}
.tr-no > th:nth-child(7){width:20%;}
.tr-no > th:nth-child(8){width:10%;}
.tr-no > th:nth-child(9){width:7%;}

.tr-no > td:nth-child(1){width:6%;}
.tr-no > td:nth-child(2){width:9%;}
.tr-no > td:nth-child(3){width:11%;}
.tr-no > td:nth-child(4){width:9%;}
.tr-no > td:nth-child(5){width:11%;}
.tr-no > td:nth-child(6){width:14%;}
.tr-no > td:nth-child(7){width:20%;}
.tr-no > td:nth-child(8){width:11%;}
.tr-no > td:nth-child(9){width:7%;}


input[type=checkbox]{width:18px; height:18px;}

input.searchValue{height:25px;}
select{height:30px; width:100px;}

/* 페이징 */
#paging{margin: 30px auto; width: 800px;}
#buttonTab > button {width:40px; height:40px; border-radius:5px; border:0px; background-color:white; font-size:16px; padding:5px;}
button:hover{cursor:pointer;}
#startBtn:hover{font-wieght:bold; background:#675141; color:white}
#endBtn:hover{font-wieght:bold; background:#675141; color:white}
.startBtn, .endBtn, .pageNum, #before, #next {width:40px; height:40px; border-radius:5px; border:0px; background-color:white; font-size:16px; padding:5px;}
a{display:inline !important;}	

/* 검색창 */
.searchArea{text-align:center; margin:0 20px 20px 20px;}
.selectArea{margin-top:0px; display:inline-block; border:0.5px solid lightgray;}
#searchSelect{height:37px; width:80px; border:1px solid lightgray; padding:5px;}
.wordArea{width:300px; height:35px; border:1px solid lightgray; background:#fff; display:inline-block; vertical-align:bottom;}
#word{font-size:18px; height:auto; padding:5px; border: 0px; outline:none; float:left;}
#searchBtn{width:60px; height:35px; border: 0px; border-radius:0px; padding:5px;background: #888c43; outline: none; float:right; color: #fff; font-size:18px;}

</style>
</head>
<body>
	<c:import url='../common/boardCommon.jsp'/>
	<script>
		$('#bName').text('텃밭');
		$('#bNameAfter').text('관리');
	</script>
	
	<!-- swal 선언 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	
	<section>
		<!-- 상단 버튼 -->
		<div class="topB" align="right">
			<button class="buttonG" onclick="msgPopup();">쪽지 보내기</button>
			<button class="buttonB" >회원 탈퇴</button>
		</div>
		
		<!-- 표 -->
		<div class="divTable" align="center">
			<table class="farmTable">
				<thead>
					<tr class="tr-no">
						<th><input type="checkbox" name="checkAll" onclick="checkAll1();"></th>
						<th>회원 분류</th>
						<th>아이디</th>
						<th>회원 이름</th>
						<th>닉네임</th>
						<th>가입 일자</th>
						<th>이메일</th>
						<th>상태</th>
						<th>누적 신고</th>
					</tr>
				</thead>
			</table>
		</div>
		<div>
			<table class="farmTable">
				<tbody>
				<c:forEach var="m" items="${ list }">
					<tr class="tr-no">
						<td><input type="checkbox" id="checkbox" name="checkbox" value="${ m.userId }" onclick="checkCheck();">
							<input type="hidden" id="mNo" name="mNo" value="${ mNo }"></td>
						<td>
							<c:if test="${ m.mKind eq 0}">
						 		관리자
						 	</c:if>
						 	<c:if test="${ m.mKind eq 1}">
						 		새싹
						 	</c:if>
						 	<c:if test="${ m.mKind eq 2}">
						 		농부
						 	</c:if>
						</td>
						<td>${ m.userId }</td>
						<td>${ m.userName }</td>
						<td>${ m.nickName }</td>
						<td>${ m.createDate }</td>
						<td>${ m.email }</td>
						<td>
							<c:if test="${ m.mStatus eq 'N'}">
								정상
							</c:if>
							<c:if test="${ m.mStatus ne 'N'}">
								탈퇴
							</c:if>
						</td>
						<td>
							<c:if test="${ m.reportCount eq 0 }">
								<font color='black'>일반</font>
							</c:if>
							<c:if test="${ m.reportCount eq 1 }">
								<font color='gold'>주의</font>
							</c:if>
							<c:if test="${ m.reportCount eq 2 }">
								<font color='orange'>경고</font>
							</c:if>
							<c:if test="${ m.reportCount eq 3 }">
								<font color='red'>블랙</font>
							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>	
		<!-- 페이징 -->
	     <div id="paging">
	        <!-- 페이징 처리 -->
	        <div align="center" id="buttonTab">
	        
	        	<c:if test="${ word eq null}">
	        		<c:set var="loc" value="/mlist.ma" scope="page"/>
	        	</c:if>
	        	<c:if test="${ word ne null }">
	        		<c:set var="loc" value="/maSearchList.ma" scope="page"/>
	        	</c:if>
	           <!-- 맨 앞으로 -->
	             <c:if test="${ pi.currentPage <= 1 }">
	                <button class="startBtn" style="background:#e0e0e0; color:black" disabled>&lt;&lt;</button>
	             </c:if>
	             <c:if test="${ pi.currentPage ne 1 }">
	                <c:url var="first" value="${ loc }">
	                	<c:if test="${ word ne null }">
	                		<c:param name="searchSelect" value="${ searchSelect }"/>
	                		<c:param name="word" value="${ word }"/>
	                	</c:if>
	                	<c:param name="page" value="1"/>            
	                </c:url>
	                <a href="${ first }">
	                   <button class="startBtn" style="background:#e0e0e0; color:black">&lt;&lt;</button>
	                </a>
	             </c:if>
	           <!-- [이전] -->
	           <c:if test="${ pi.currentPage <= 1 }">
	              <button id="before" style="background:#675141; color:white">&lt;</button>
	           </c:if>
	           <c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="${ loc }">
	              		<c:if test="${ word ne null }">
	                		<c:param name="searchSelect" value="${ searchSelect }"/>
	                		<c:param name="word" value="${ word }"/>
	                	</c:if>
	                 	<c:param name="page" value="${ pi.currentPage - 1 }"/>
	              	</c:url>
	             	<a href="${ before }"><button style="background:#675141; color:white" id="before">&lt;</button></a>
	           </c:if>
	           <!-- 페이지 -->
	           <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	              <c:if test="${ p eq pi.currentPage }">
	                 <button style="font-weight:bold; background:#888c43; color:white" id="current">${ p }</button>
	              </c:if>
	              
	              <c:if test="${ p ne pi.currentPage }">
	              	<c:if test="${ word eq null }">
	              		<c:url var="pagination" value="${ loc }">
	              			<c:param name="page" value="${ p }"/>
	              		</c:url>
	              	</c:if>
	                <c:if test="${ word ne null }">
	               		<c:url var="pagination" value="${ loc }">
	                		<c:param name="searchSelect" value="${ searchSelect }"/>
	                		<c:param name="word" value="${ word }"/>
	                		<c:param name="page" value="${ p }"/>
	                	</c:url>
	                </c:if>
	                <a href="${ pagination }"><button class="pageNum" style="font-weight:normal; background:white; color:black;">${ p }</button></a>
	              </c:if>
	           </c:forEach>
	           
	           <!-- [다음] -->
	           <c:if test="${ pi.currentPage >= pi.maxPage }">
	              <button id="next" style="background:#675141; color:white" disabled>&gt;</button>
	           </c:if>
	           <c:if test="${ pi.currentPage < pi.maxPage }">
	              <c:url var="after" value="${ loc }">
	              		<c:if test="${ word ne null }">
	                		<c:param name="searchSelect" value="${ searchSelect }"/>
	                		<c:param name="word" value="${ word }"/>
	                	</c:if>
	             	   <c:param name="page" value="${ pi.currentPage + 1 }"/>
	              </c:url> 
	              <a href="${ after }"><button id="next" style="background:#675141; color:white">&gt;</button></a>
	           </c:if>
	           
	           <!-- 맨 뒤로 -->
	             <c:if test="${ pi.currentPage > pi.maxPage }">
	                <button class="endBtn" style="font-wieght:bold; background:#675141; color:white">&gt;&gt;</button>
	             </c:if>
	             <c:if test="${ pi.currentPage <= pi.maxPage }">
	                <c:url var="last" value="${ loc }">
	                	<c:if test="${ word ne null }">
	                		<c:param name="searchSelect" value="${ searchSelect }"/>
	                		<c:param name="word" value="${ word }"/>
	                	</c:if>
	                 	<c:param name="page" value="${ pi.maxPage }"/>            
	                </c:url>
	                <a href="${ last }">
	                   <button class="endBtn" style="background:#e0e0e0; color:black">&gt;&gt;</button>
	                </a>
	             </c:if>
	        </div>
		</div>
	
		<!-- 검색 -->
		<div>
			<form id="searchForm">
			   <div class="searchArea">
			      <div class="selectArea">
			         <select name="searchSelect" id="searchSelect" style="border-radius:0px;">
			            <option value="selectId" selected>아이디</option>
			            <option value="selectNick">닉네임</option>
			            <option value="selectName">이름</option>
			         </select>
			               <!-- <input type="hidden" name="searchSelect" id="searchSelect"> -->
			      </div>
			      <div class="wordArea">
			         <input type="text" placeholder="검색어 입력" name="word" id="word">
			         <button type="button" id="searchBtn" onclick="search();">검색</button>
			       </div>
			    </div>
			</form>
		</div>
	</section>
	
	<script>
		// 체크박스 전체 선택
		function checkAll1(){
			var checkbox = document.getElementsByName("checkbox");
			var checkAll = document.getElementsByName("checkAll");
			
			for(var i = 0; i < checkbox.length; i++){
				if(checkAll[0].checked == true){
					checkbox[i].checked = true;
				} else {
					checkbox[i].checked = false;
				}
			}
		}
		
		var checkVal = "";
		
		// 하나라도 선택 해제 시 전제선택 해제 && 체크박스 노가다로 전체 선택 시 전체선택 체크
		function checkCheck() {
			var checkbox = document.getElementsByName("checkbox");
			var checkAll = document.getElementsByName("checkAll");
			var num = 0;
			
			for(var i = 0; i < checkbox.length; i++) {
				if(checkbox[i].checked == false) {
					checkAll[0].checked = false;
				} else if(checkbox[i].checked == true) {
					num++;
						if(num == checkbox.length) {
							checkAll[0].checked = true;
						}
				}
			}
		}
		
		// 회원 탈퇴
		$('.buttonB').on('click', function(){
			var checkbox = document.getElementsByName("checkbox");
			for(var i = 0; i < checkbox.length; i++){
				if(checkbox[i].checked == true){
					checkVal += checkbox[i].value + ",";
				}
			}
			var mNo = checkVal;
			console.log(mNo);
			
			swal("정말 탈퇴시겠습니까?",{
				icon : "warning",
				buttons : {
					cancel : true,
					confirm : true,
				}
			}).then((result) => { 
				if(result) {
					location.href="madelete.ma?mNo=" + mNo;
				}
			});
		});
			
		
		// 메세지 팝업
		function msgPopup() {
			
			var to=null;
			
			var checkbox = document.getElementsByName("checkbox");
			checkVal = "";
			for(var i = 0; i < checkbox.length; i++){
				if(checkbox[i].checked == true){
					checkVal += checkbox[i].value + ",";
				} 
			}
			
			to = $('#mNo').val(checkVal).val();
			var url = "insertForm.msg?to=" + to;
			var option = "resizable = no, scrollbars = no, width = 500, height = 550";
			window.open(url, "쪽지함", option);
			
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
		
		// 검색창
		function search(){
			var searchSelect = $('#searchSelect').val();
			var word = $('#word').val();
			if(window.event.keyCode == 13){
				location.href="maSearchList.ma?searchSelect=" + searchSelect + "&word=" + word;
			}
		}
	</script>




	
</body>
</html>