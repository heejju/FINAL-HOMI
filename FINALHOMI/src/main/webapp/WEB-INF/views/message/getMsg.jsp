<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<style>
	
	#title{text-align: center; color: #888c43;}
	.buttonR{width:100px; background-color:lightgray; color:#000; border:none; padding:5px 0; text-align:center; font-size:13px; cursor:pointer; border-radius:5px;}
	.buttonG{width:50px; background-color:#888c43; color:#fff; border:none; padding:5px 0; text-align:center; font-size:13px; cursor:pointer; border-radius:5px;}
	
	
	#msgTable{width: 100%; text-align: center; border-top: 1px solid gray; border-bottom: 1px solid gray;
				border-collapse: collapse;}
	#msgTable th{border-bottom: 1px solid gray;}
	#msgTable tr{line-height: 30px;}
	#tableTop{text-align: center;}
	
	#pagingArea{text-align: left; padding: 5px;}
	#pagingArea button{font-weight: bold;}
	
	.pageNum, #before, #next, #current{width:30px; height:30px; border-radius:5px; border:0px; background-color:white; font-size:14px; padding:5px;}
	
	#check{width: 18px;}
	button:hover{cursor:pointer;}
</style>
</head>
<body style="background: #fff6f0;">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<div><h2 id="title"># 받은 쪽지</h2></div>
	
	<c:url var="get" value="msgList.msg"/>
	<c:url var="sent" value="sentMsgList.msg"/>
	<c:url var="delete" value="deleteMsg.msg"/>
	<c:url var="write" value="insertForm.msg"/>
	<c:url var="detail" value="detail.msg"/>
	
	<!-- 버튼 -->
	<div>
		<div id="pagingArea" style="position: relative;">
			<button class="buttonR" onclick="location.href='${get}'">받은 쪽지</button>
			<button class="buttonR" onclick="location.href='${sent}'">보낸 쪽지</button>
			<div style="float: right;">
				<button id="deleteit" class="buttonG" style="position: absolute; right: 10px; background: #675141;">삭제</button>
			</div>
		</div>
	</div>
	
	<!-- 리스트 -->
	<div>
		<table id="msgTable" style="table-layout: fixed;">
			<tr class="tableTop">
				<th style="width: 20px;"><input type="checkbox" name="checkAll" onclick="checkAll();"></th>
				<th style="width: 30px;">상태</th>
				<th style="width: 100px;">보낸사람</th>
				<th style="width: 200px;">제목</th>
				<th style="width: 100px;">날짜</th>
			</tr>
			<c:forEach var="m" items="${list}">
				<tr>
					<td><input name="checkbox" type="checkbox" onclick="checkCheck();"class="mNo" value="${ m.mNo }"></td>
						<c:if test="${ m.msg_view >= 1 }">
							<td><img id="check" alt="check" src="${contextPath }/resources/images/checkIcon.png"></td>
						</c:if>
						<c:if test="${ m.msg_view == 0 }">
							<td class="tr-no">&nbsp;</td>
						</c:if>
					<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;" id="from" class="tr-no">${ m.msg_from }</td>
					<td style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap; text-align: left;" class="tr-no"> ${ m.msg_title } </td>
					<td class="tr-no"> ${ m.msg_date } </td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<!-- 페이징, 쪽지 버튼 -->
	<div>
		<div id="pagingArea" style="position: relative; text-align: center;">
			<!-- [이전] -->
            <c:if test="${ pi.currentPage <= 1 }">
               <button id="before" style="background: lightgray;" disabled>&lt;</button>
            </c:if>
            <c:if test="${ pi.currentPage > 1 }">
               <c:url var="before" value="msgList.msg">
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
                  <c:url var="pagination" value="msgList.msg">
                     <c:param name="page" value="${ p }"/>
                  </c:url>
                  <a href="${ pagination }"><button type="button" class=pageNum>${ p }</button></a>
               </c:if>
            </c:forEach>
            
            <!-- [다음] -->
            <c:if test="${ pi.currentPage >= pi.maxPage }">
               <button type="button" id=next style="background: lightgray;" disabled>&gt;</button>
            </c:if>
            <c:if test="${ pi.currentPage < pi.maxPage }">
               <c:url var="after" value="msgList.msg">
                  <c:param name="page" value="${ pi.currentPage + 1 }"/>
               </c:url> 
               <a href="${ after }"><button type="button" id=next style="font-wieght:bold; background:#675141; color:white">&gt;</button></a>
            </c:if>
			<div style="float: right;">
					<button class="buttonG" style="width: 80px; position: absolute; right: 10px;" onclick="location.href='${write}'">쪽지쓰기</button>
			</div>
					
		</div>
	</div>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		/* 마우스 오버 효과 */
			$(function() {
				$('#msgTable').find("td").mouseenter(function() {
					$(this).parents("tr").css({"background":"rgb(137, 139, 77)", "color":"white", "cursor":"pointer"});
				}).mouseleave(function() {
					$(this).parents("tr").css({"background":"none", "color":"black"});
				});
			});
		
			$(function(){
	         	$('.tr-no').click(function(){
	         		var mNo = $(this).parent("tr").find(".mNo").val();
	         		var from = $(this).parent("tr").find("#from").text();
		         		location.href="detail.msg?mNo=" + mNo + "&page=" + ${pi.currentPage} + "&msg_from=" + from + "&msg_to=false";
	         	});
	         });
			
			
			$(function(){
				$('.pageNum').mouseenter(function(){
					$(this).css({'font-weight':'bold', 'background':'#888c43', 'color':'white'});
				});
				
				$('.pageNum').mouseleave(function(){
					$(this).css({'font-weight':'normal', 'background':'white', 'color':'black'});
				});
			});
			
			// 전체 선택
			function checkAll(){
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
			
			// 선택 삭제
		
		
			
		$('#deleteit').on('click', function() {
					var checkVal = "";
					swal("정말 삭제하시겠습니까?",{
						icon : "warning",
						buttons : ["취소", "확인"],
					}).then((YES) => {
						if(YES) {
							var checkbox = document.getElementsByName("checkbox");
							for (var i = 0; i < checkbox.length; i++) {
								if (checkbox[i].checked == true) {
									checkVal += checkbox[i].value + ",";
								}
							}
							if(checkVal == "") {
								swal("선택한 쪽지가 없습니다", {
									icon : "info",
									button : {확인 : true}
								})
								return;
							}
							location.href = 'deleteGetMsg.msg?checkVal=' + checkVal
									+ '&id=${loginUser.userId}';
						} else {
							return;
						}
					});
				});
	</script>
</body>
</html>