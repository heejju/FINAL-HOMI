<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/reset.css" type="text/css">
<style>
	body{align:center; font-family: 'Nanum Gothic', sans-serif;}
	.listName{hegiht:100px; font-size:24px; margin:0px auto; text-align:left; padding:30px;}
	#imgWrapper{display:inline-block;}
	#imgWrapper > img{vertical-align:-20px; width:100px; height:100px;}
	
	#titleWrapper{display:inline-block; width:330px; text-align:right;}
	#title{font-weight:bold; color:#888c43}
	
	/* 목록 상세 */
	.list{background:rgb(255, 255, 255); width:420px; height:400px; margin:0px auto; overflow: scroll;}
	.listDetail{width:380px; clear: both; padding:10px 10px 0 10px; height:90px;}
	
	.userImgWrapper{display:inline-block; margin:0 5px;}
	#profileImg{width:80px; height:80px; vertical-align:middle;}
	
	#informWrapper{display:inline-block; width:220px; height:80px; margin:0 5px; font-size:15px;}
	#nickName{font-weight:bold; font-size:18px; color:#888c43;}
	#location{font-weight:bold; color:#675141;}
	
	#MsgBtnWarpper{display:inline-block; /* margin-left:15px; */}
	#sendMsgBtn{border-radius:80%; border:0px; width:50px; height:50px;
				color:white; font-weight:bold; font-size:18px; background:rgb(131, 171, 173);}
				
	#noApp{text-align:center; font-size:18px; font-weight:bold; line-height:400px;}
	
	button{border:0px; border-radius:5px;}
	.btnArea{margin:0px auto; align:center; width:100px; margin-top:20px;}
	#okBtn{width:90px; height:30px; font-weight:bold; font-size:16px; color:white; background:#888c43;}
</style>
</head>
<body> <!-- onresize="parent.resizeTo(500,650)" onload="parent.resizeTo(500,650) "-->
	<div style="background:#fff6f0; width:500px; height:630px;">
		<div class="listName">
			<div id="imgWrapper">
				<img src="${ contextPath }/resources/images/farmer2.png" id="profileImg">
				<div id="titleWrapper">
					<div id="title">${gf.title}</div><div style="padding-top:10px;">신청자 목록</div>
					<script>
						if($('#title').text().length > 16){
							$('#title').css('line-height','24px');
						}
					</script>
				</div>
			</div>
		</div>
		<c:if test="${ gfaList.size() eq 0 }">
			<div class="list">
				<div id="noApp">참여 인원이 없습니다.</div>
			</div>
		</c:if>
		<c:if test="${ gfaList.size() ne 0 }">
			<div class="list">
				<c:forEach var="gfa" items="${ gfaList }">
					<div class="listDetail">
							<div class="userImgWrapper">
								<c:if test="${ empty gfa.changeName }">
									<img id="profileImg" src="${ contextPath }/resources/images/almond.png"/>
								</c:if>
								<c:if test="${ !empty gfa.changeName }">
									<img id="profileImg" src="${ contextPath }/resources/uploadFiles/${ gfa.changeName }"/>
								</c:if>
							</div>
							<div id="informWrapper">
								<c:if test="${ gfa.mKind eq 2 }">
									<div style="font-weight:bold;"> 모종회원 </div>
								</c:if>
								<c:if test="${ gfa.mKind eq 1 }">
									<div style="font-weight:bold;"> 농부회원 </div>
								</c:if>
								<div id="nickName">${gfa.nickName}</div>
							</div>
							<div id="MsgBtnWarpper">
								<button id="sendMsgBtn" type="button" onClick="">쪽지</button>
							</div>
					</div>
				</c:forEach>
			</div>
			<script>
				$(".listDetail").mouseover(function(){
					$(this).css('background','RGBA(242, 219, 162, 0.5)');
				}).mouseout(function(){
					$(this).css({'background':'white'});
				});
			</script>
		</c:if>
		<div class="btnArea">
			<button type="button" id="okBtn" onClick="window.open('','_self').close();">확인</button>
			<script>
				$('.okBtn').mouseover(function(){
					$(this).css('cursor','pointer');
				}).click(function(){
					
				});
			</script>
		</div>
	</div>
	
	<script>
		var div = $(".userImgWrapper") // 이미지를 감싸는 div
		var img =$(".userImg") // 이미지
		var divAspect = div.height / div.width;
		var imgAspect = img.height / img.width;
		 
		if (imgAspect <= divAspect) {
		    // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
		    var imgWidthActual = div.offsetHeight / imgAspect;
		    var imgWidthToBe = div.offsetHeight / divAspect;
		    var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);
		    img.css({"width":"auto", "height":"100px", "margin-left":$(marginLeft)+"px"});
		    /* img.style.cssText = 'width: auto; height: 100%; margin-left: '
		                      + marginLeft + 'px;' */
		} else {
		    // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
		     img.css({"width":"100px", "height":"auto", "margin-left":"0"});
		    /* img.style.cssText = 'width: 100%; height: auto; margin-left: 0;'; */
		} 
	</script>
</body>
</html>