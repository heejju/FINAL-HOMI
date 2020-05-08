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
		}
		
		.rstImgP {
			color: white;
			background-color: #515050;
			padding: 10px 0;
			margin-top: -2%;
		}
		
        li {
            list-style: none;
        }
        a {
            font-family: "돋움";
            font-size: 12px;
            color: #000;
            text-decoration: none;
        }
        #visual {
            width: 1000px;
            margin: 0 auto;
            position: relative;
            top: 200px;
        }
        #pic {
            height: 563px;
            overflow: hidden;
            position: relative;
        }
        #pic>div {
            position: absolute;
            left: 0;
            top: 0;
            display: none;
        }
        #control {
            position: absolute;
            width: 100%;
            left: 0;
            bottom: 30px;
            text-align: center;
        }
        #control a {
            display: inline-block;
            width: 26px;
            height: 26px;
            background: #000;
            color: #fff;
            line-height: 26px;
            font-size: 0.8em;
            border-radius: 14px;
            margin: 0 2px
        }
        #control a.on {
            background: #ff6600;
        }
	</style>
<style type="text/css">
</style>
</head>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<body>
	<header>
		<jsp:include page="WEB-INF/views/common/boardCommon.jsp"/>
		<script>
	    	$('#subHeader').hide();
		</script>
	</header>
	<script>
		$(document).ready(function(){
			$("#control a").click(function(){
				var num = Number($(this).text()) - 1; //0,1,2,3
				$(this).addClass("on").siblings().removeClass("on");
				$("#pic > div").filter(":visible").stop(true).fadeOut(350).end().eq(num).stop(true).fadeIn(350);
			}); /* stop 안넣으면 마우스로 막 눌렀을때 쌓여서 계속 실행됨 */
			$("#control a:first").addClass("on").add("#pic > div:first").show();
			return false
		});
	</script>
	<div id="visual">
        <div id="pic">
            <div><a href="#"><img src="${ contextPath }/resources/images/f1.jpg" alt="1" style="width:1000px; "></a></div>
            <div><a href="#"><img src="${ contextPath }/resources/images/f2.jpg" alt="2" style="width:1000px; "></a></div>
            <div><a href="#"><img src="${ contextPath }/resources/images/f3.jpg" alt="3" style="width:1000px; "></a></div>
            <div><a href="#"><img src="${ contextPath }/resources/images/f4.jpg" alt="4" style="width:1000px; "></a></div>
        </div>
        <div id="control">
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
        </div>
    </div>
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<table class="rankTable">
		<tr>
			<td colspan="5">
				<h3>새로 등록된 강의</h3><hr style="border-top: 1px solid black;"><br>
			</td>
		</tr>
		<tr>
			<td id="newTd1" class="newTd">
				<div id="newImgDiv1" class="newImgDiv">
					<img id="newImg1" class="newImg" src="">
					<p class="newImgP"><b id="newImgB11" class="newImgB1">작성자</b> - <b id="newImgB21" class="newImgB2">글제목</b></p>
				</div>
			</td>
			<td id="newTd2" class="newTd">
				<div id="newImgDiv2" class="newImgDiv">
					<img id="newImg2" class="newImg" src="">
					<p class="newImgP"><b id="newImgB12" class="newImgB1">작성자</b> - <b id="newImgB22" class="newImgB2">글제목</b></p>
				</div>
			</td>
			<td id="newTd3" class="newTd">
				<div id="newImgDiv3" class="newImgDiv">
					<img id="newImg3" class="newImg" src="">
					<p class="newImgP"><b id="newImgB13" class="newImgB1">작성자</b> - <b id="newImgB23" class="newImgB2">글제목</b></p>
				</div>
			</td>
			<td id="newTd4" class="newTd">
				<div id="newImgDiv4" class="newImgDiv">
					<img id="newImg4" class="newImg" src="">
					<p class="newImgP"><b id="newImgB14" class="newImgB1">작성자</b> - <b id="newImgB24" class="newImgB2">글제목</b></p>
				</div>
			</td>
			<td id="newTd5" class="newTd">
				<div id="newImgDiv5" class="newImgDiv">
					<img id="newImg5" class="newImg" src="">
					<p class="newImgP"><b id="newImgB15" class="newImgB1">작성자</b> - <b id="newImgB25" class="newImgB2">글제목</b></p>
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
				<div id="rstImgDiv1" class="rstImgDiv">
					<img id="rstImg1" class="rstImg" src="">
					<p class="rstImgP"><b id="rstImgB11" class="rstImgB1">작성자</b> - <b id="rstImgB21" class="rstImgB2">글제목</b></p>
				</div>
			</td>
			<td id="rstTd2" class="rstTd">
				<div id="rstImgDiv2" class="rstImgDiv">
					<img id="rstImg2" class="rstImg" src="">
					<p class="rstImgP"><b id="rstImgB12" class="rstImgB1">작성자</b> - <b id="rstImgB22" class="rstImgB2">글제목</b></p>
				</div>
			</td>
			<td id="rstTd3" class="rstTd">
				<div id="rstImgDiv3" class="rstImgDiv">
					<img id="rstImg3" class="rstImg" src="">
					<p class="rstImgP"><b id="rstImgB13" class="rstImgB1">작성자</b> - <b id="rstImgB23" class="rstImgB2">글제목</b></p>
				</div>
			</td>
			<td id="rstTd4" class="rstTd">
				<div id="rstImgDiv4" class="rstImgDiv">
					<img id="rstImg4" class="rstImg" src="">
					<p class="rstImgP"><b id="rstImgB14" class="rstImgB1">작성자</b> - <b id="rstImgB24" class="rstImgB2">글제목</b></p>
				</div>
			</td>
			<td id="rstTd5" class="rstTd">
				<div id="rstImgDiv5" class="rstImgDiv">
					<img id="rstImg5" class="rstImg" src="">
					<p class="rstImgP"><b id="rstImgB15" class="rstImgB1">작성자</b> - <b id="rstImgB25" class="rstImgB2">글제목</b></p>
				</div>
			</td>
		</tr>
	</table>
	<script>
		$(function() {
			newList() ;
// 			rstList() ;
			setInterval(function() {
				newList() ;
// 				rstList() ;
			}, 5000) ;
		})
		
		function newList() {
			var $tableBody = "" ;
			$.ajax({
				url: 'newList.do',
				dataType: 'json',
				success: function(data) {
					for(var i=0; i<5; i++) {
						console.log(data[i]) ;
						$('#newImgB1'+(i+1)).text(data[i].nickName) ;
						$('#newImgB2'+(i+1)).text(data[i].title) ;
						$('#newImg'+(i+1)).attr("src", "${contextPath}/resources/uploadFiles/"+data[i].changeName) ;
					}
				}
			});
		}
		
		function rstList() {
			var $tableBody = "" ;
			$.ajax({
				url: 'rstList.do',
				dataType: 'json',
				success: function(data) {
					for(var i=0; i<5; i++) {
						console.log(data[i]) ;
						$('#rstImgB1'+(i+1)).text(data[i].nickName) ;
						$('#rstImgB2'+(i+1)).text(data[i].title) ;
						$('#rstImg'+(i+1)).attr("src", "${contextPath}/resources/uploadFiles/"+data[i].changeName) ;
					}
				}
			}) ;
		}
	</script>
</body>
</html>