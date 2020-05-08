<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="finalProject.homis.hobbyFarm.lecture.model.vo.LectureBoard"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<meta charset="UTF-8">
	<title>#취미 텃밭</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap" rel="stylesheet">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<style>
		body {
			font-family: 'Nanum Gothic', sans-serif;
		}
		
		.rankTable {
			width: 60%;
			margin-left: 20%;
			margin-right: 20%;
			text-algin: center;
		}
		
		.newImg {
			width: 100%;
			height: 100%;
			
		}
		
		.newImgDiv {
			width: 200px;
			height: 200px;
			background-color: white;
			text-align: center;
			cursor: pointer;
		}
		
		.newImgP {
			color: white;
			background-color: #515050;
			padding: 10px 0;
			margin-top: -2%;
		}
		
		.rstImg {
			width: 100%;
			height: 100%;
			
		}
		
		.rstImgDiv {
			width: 200px;
			height: 200px;
			background-color: white;
			text-align: center;
			cursor: pointer;
		}
		
		.rstImgP {
			color: white;
			background-color: #515050;
			padding: 10px 0;
			margin-top: -2%;
		}
	</style>
</head>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<body>
	<script>
		$(function() {
			newList() ;
			rstList() ;
			setInterval(function() {
				newList() ;
				rstList() ;
			}, 5000) ;
		})
		
		function newList() {
			var $tableBody = "" ;
			$.ajax({
				url: 'newList.do',
				dataType: 'json',
				success: function(data) {
					for(var i=0; i<5; i++) {
						$('#newImgB1'+(i+1)).text(data[i].nickName) ;
						$('#newImgB2'+(i+1)).text(data[i].title) ;
						$('#newImgPostNo'+(i+1)).val(data[i].postNo) ;
						$('#newImg'+(i+1)).attr("src", "${contextPath}/resources/uploadFiles/"+data[i].changeName) ;
					}
				}
			}) ;
		}
		
		function rstList() {
			var $tableBody = "" ;
			$.ajax({
				url: 'rstList.do',
				dataType: 'json',
				success: function(data) {
					for(var i=0; i<data.length; i++) {
						$('#rstImgB1'+(i+1)).text(data[i].nickName) ;
						$('#rstImgB2'+(i+1)).text(data[i].title) ;
						$('#rstImgPostNo'+(i+1)).val(data[i].postNo) ;
						$('#rstImg'+(i+1)).attr("src", "${contextPath}/resources/uploadFiles/"+data[i].changeName) ;
					}
					
					for(var i=1; i<=5; i++) {
						if($('#rstImgPost#rstImgPostNo'+i).val() == null) {
							$('#rstImgP'+(i+1)).text('게시글이 없습니다!') ;
							$('#rstImgB1'+(i+1)).text(' ') ;
							$('#rstImgB2'+(i+1)).text(' ') ;
							$('#rstImgPostNo'+(i+1)).val('0') ;
							$('#rstImg'+(i+1)).attr("src", "${contextPath}/resources/images/default_board_icon.png") ;
						}
					}
				}
			}) ;
		}
	</script>
	<header>
		<jsp:include page="WEB-INF/views/common/boardCommon.jsp"/>
		<script>
	    	$('#subHeader').hide();
		</script>
	</header>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<form action="list.lec" method="post" id="lecForm" onsubmit="whereFormGo();">
		<input type="hidden" name="postNo" id="postNo" value="0">
		<table class="rankTable">
			<tr>
				<td colspan="5">
					<h3>새로 등록된 강의</h3><hr style="border-top: 1px solid black;"><br>
				</td>
			</tr>
			<tr>
				<td id="newTd1" class="newTd">
					<div id="newImgDiv1" class="newImgDiv" onclick="toDetail('new', '1');">
						<input type="hidden" id="newImgPostNo1" class="newImgPostNo" value="">
						<img id="newImg1" class="newImg" src="">
						<p id="newImgP1" class="newImgP"><b id="newImgB11" class="newImgB1">작성자</b> - <b id="newImgB21" class="newImgB2">글제목</b></p>
					</div>
				</td>
				<td id="newTd2" class="newTd">
					<div id="newImgDiv2" class="newImgDiv" onclick="toDetail('new', '2');">
						<input type="hidden" id="newImgPostNo2" class="newImgPostNo" value="">
						<img id="newImg2" class="newImg" src="">
						<p id="newImgP2" class="newImgP"><b id="newImgB12" class="newImgB1">작성자</b> - <b id="newImgB22" class="newImgB2">글제목</b></p>
					</div>
				</td>
				<td id="newTd3" class="newTd">
					<div id="newImgDiv3" class="newImgDiv" onclick="toDetail('new','3');">
						<input type="hidden" id="newImgPostNo3" class="newImgPostNo" value="">
						<img id="newImg3" class="newImg" src="">
						<p id="newImgP3" class="newImgP"><b id="newImgB13" class="newImgB1">작성자</b> - <b id="newImgB23" class="newImgB2">글제목</b></p>
					</div>
				</td>
				<td id="newTd4" class="newTd">
					<div id="newImgDiv4" class="newImgDiv" onclick="toDetail('new', '4');">
						<input type="hidden" id="newImgPostNo4" class="newImgPostNo" value="">
						<img id="newImg4" class="newImg" src="">
						<p id="newImgP4" class="newImgP"><b id="newImgB14" class="newImgB1">작성자</b> - <b id="newImgB24" class="newImgB2">글제목</b></p>
					</div>
				</td>
				<td id="newTd5" class="newTd">
					<div id="newImgDiv5" class="newImgDiv" onclick="toDetail('new', '5');">
						<input type="hidden" id="newImgPostNo5" class="newImgPostNo" value="">
						<img id="newImg5" class="newImg" src="">
						<p id="newImgP5" class="newImgP"><b id="newImgB15" class="newImgB1">작성자</b> - <b id="newImgB25" class="newImgB2">글제목</b></p>
					</div>
				</td>
			</tr>
		</table>
		<br><br><br><br>
		<table class="rankTable">
			<tr>
				<td colspan="5">
					<h3>최근 성사된 강의</h3><hr style="border-top: 1px solid black;"><br>
				</td>
			</tr>
			<tr>
				<td id="rstTd1" class="rstTd">
					<div id="rstImgDiv1" class="rstImgDiv" onclick="toDetail('rst', '1');">
						<input type="hidden" id="rstImgPostNo1" class="rstImgPostNo" value="">
						<img id="rstImg1" class="rstImg" src="">
						<p id="rstImgP1" class="rstImgP"><b id="rstImgB11" class="rstImgB1">작성자</b> - <b id="rstImgB21" class="rstImgB2">글제목</b></p>
					</div>
				</td>
				<td id="rstTd2" class="rstTd">
					<div id="rstImgDiv2" class="rstImgDiv" onclick="toDetail('rst', '2');">
						<input type="hidden" id="rstImgPostNo2" class="rstImgPostNo" value="">
						<img id="rstImg2" class="rstImg" src="">
						<p id="rstImgP2" class="rstImgP"><b id="rstImgB12" class="rstImgB1">작성자</b> - <b id="rstImgB22" class="rstImgB2">글제목</b></p>
					</div>
				</td>
				<td id="rstTd3" class="rstTd">
					<div id="rstImgDiv3" class="rstImgDiv" onclick="toDetail('rst', '3');">
						<input type="hidden" id="rstImgPostNo3" class="rstImgPostNo" value="">
						<img id="rstImg3" class="rstImg" src="">
						<p id="rstImgP3" class="rstImgP"><b id="rstImgB13" class="rstImgB1">작성자</b> - <b id="rstImgB23" class="rstImgB2">글제목</b></p>
					</div>
				</td>
				<td id="rstTd4" class="rstTd">
					<div id="rstImgDiv4" class="rstImgDiv" onclick="toDetail('rst', '4');">
						<input type="hidden" id="rstImgPostNo4" class="rstImgPostNo" value="">
						<img id="rstImg4" class="rstImg" src="">
						<p id="rstImgP4" class="rstImgP"><b id="rstImgB14" class="rstImgB1">작성자</b> - <b id="rstImgB24" class="rstImgB2">글제목</b></p>
					</div>
				</td>
				<td id="rstTd5" class="rstTd">
					<div id="rstImgDiv5" class="rstImgDiv" onclick="toDetail('rst', '5');">
						<input type="hidden" id="rstImgPostNo5" class="rstImgPostNo" value="">
						<img id="rstImg5" class="rstImg" src="">
						<p id="rstImgP5" class="rstImgP"><b id="rstImgB15" class="rstImgB1">작성자</b> - <b id="rstImgB25" class="rstImgB2">글제목</b></p>
					</div>
				</td>
			</tr>
		</table>
	</form>
	<script>
		function toDetail(str, num) {
			$("#postNo").val($('#'+str+'ImgPostNo'+num).val()) ;
			$("#lecForm").submit() ;
		}
		
		//postNo가 0이면 list.lec 0이아니라 다른숫자면 detail.lec으로간다
		function whereFormGo(){
			var postNo = $("#postNo").val();
			if(postNo != 0 || postNo != '0') {
				$("#lecForm").attr("action", "detail.lec");
			}
		}
	</script>
</body>
</html>