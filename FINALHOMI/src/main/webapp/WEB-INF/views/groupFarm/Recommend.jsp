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
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/reset.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>
	body{align:center; font-family: 'Nanum Gothic', sans-serif; background:#fff6f0;}
	button:hover {cursor:pointer;}
	#wrapper{width:500px; height:630px; background:#fff6f0; margin:0 auto;}
	h2{text-align:left; padding:5%; padding-top:5%; margin:0% 0% 0% 3%; }
	
	.recommendList{width:400px; height:530px; background:#e0e0e0; margin:0 auto; padding:10px;}
	.listDetail{margin:5% auto; width:420px; padding:10px; clear: both;}
	
	.imgWrapper{display:inline-block; margin:0 auto; vertical-align:middle;}
	#profileImg{width:120px;}
	
	#informWrapper{display:inline-block; width:200px; height:120px; margin:0 auto; vertical-align:middle; font-size:15px;}
	#informWrapper > div{padding:3px;}
	#T_nickName{font-weight:bold; font-size:18px; color:#888c43;}
	#recent_lecture, #location{font-weight:bold; color:#675141;}
	.nickName{color:#888c43;}
	
	#MsgBtnWarpper{display:inline-block;}
	.sendMsgBtn{border-radius:80%; border:0px; width:60px; height:60px;
				color:white; font-weight:bold; font-size:18px; background:rgb(131, 171, 173);}
	
	#btnWarpper{width:100%;}
	#closeBtn{border:0px; border-radius:5px; font-size:18px; font-weight:bold; color:white; background:#675141;
			 padding:5px; margin:30px auto;  width:80px; text-align:center; display:block;}
</style>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div id="wrapper">
		<h2>이런 강사님은 어떠세요?😳</h2>	
		<div class="recommendList">
			<c:if test="${ tList.size() eq 0 }">
				<div class="listDetail">
					<div class="list">
						<div id="noApp">추천 강사가 없습니다.</div>
					</div>
				</div>
			</c:if>
			<c:if test="${ tList.size() ne 0 }">
				<c:set var="i" value="0"/>
				<c:forEach var="teacher" items="${ tList }">
				<c:url var="userInfo" value="userInfo.fo">
					<c:param name="userId" value="${ teacher.userId }"/>
	                <c:param name="page" value="1"/>
	            </c:url>
					<div class="listDetail">
						<div class="imgWrapper">
							<img id="profileImg" src="${ contextPath }/resources/uploadFiles/${ teacher.changeName }">
						</div>
						<div id="informWrapper">
							<div id="T_nickName">
								<input type="hidden" id="teacherId" value="${ teacher.userId }">
								<span class="nickName" onclick="window.open('${ userInfo }','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');">
									${ teacher.nickName }
								</span>
								<script>
									$('.nickName').mouseover(function(){
										$(this).css('cursor','pointer');
									}).mouseout(function(){
										$(this).css('cursor','default');
									});
								</script>
							</div>
							<div id="recent_lecture">최근 강의</div>
							<div id="T_lecture">
									<c:if test="${ lecList.get(i) eq null }">
										<span>최근 강의가 없습니다.</span>
									</c:if>
									<c:if test="${ lecList.get(i) ne null }">
										<c:if test="${ lecList.get(i).writer eq teacher.userId }">
											<c:if test="${ fn:length(lecList.get(i).title) > 10 }">
												<span>${ fn:substring(lecList.get(i).title,0,10) }</span>
											</c:if>
											<c:if test="${ fn:length(lecList.get(i).title) < 10 }">
												<span>${ lecList.get(i).title }</span>
											</c:if>
										</c:if>
									</c:if>
							</div>
							<div id="location">지역</div>
							<div id="T_location">${ teacher.activeLoc }</div>
						</div>
						<div id="MsgBtnWarpper">
							<button class="sendMsgBtn" type="button">쪽지</button>
						</div>
					</div>
					<c:set var="i" value="${ i + 1 }"/>
				</c:forEach>
				<script>
					$('.sendMsgBtn').click(function(){
					
						var to = $(this).parent().prev().children().children().val();
						var postNo = '${ gf.postNo }';
						var title = '${ gf.title }';
						
						location.href="invite.msg?postNo="+postNo+"&title="+title+"&to="+to;
					})
					
				</script>
			</c:if>
		</div>
		
		<div id="btnWarpper">
			<button id="closeBtn" type="button" onClick="self.close()">닫기</button>
		</div>
	</div>
</body>
</html>