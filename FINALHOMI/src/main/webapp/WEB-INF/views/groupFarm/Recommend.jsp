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
	body{align:center; font-family: 'Nanum Gothic', sans-serif;}
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
				<c:forEach var="teacher" items="${ tList }">
					<div class="listDetail">
						<div class="imgWrapper">
							<img id="profileImg" src="${ contextPath }/resources/uploadFiles/${ teacher.changeName }">
						</div>
						<div id="informWrapper">
							<div id="T_nickName">
								<input type="hidden" id="teacherId" value="${ teacher.userId }">
								<span><a href="location.href='search.fo'">${ teacher.nickName }</a></span>
							</div>
							<div id="recent_lecture">최근 강의</div>
							<div id="T_lecture">
								<c:forEach var="lec" items="${ lecList }">
									<c:if test=" ${ lec eq null }">
										<span>최근 강의가 없습니다.</span>
									</c:if>
									<c:if test=" ${ lec ne null }">
										<c:if test="${ lec.writer eq teacher.userId }">
											<c:if test="${ fn:length(lec.title) > 10 }">
												<span>${ fn:substring(lec.title,0,10) }</span>
											</c:if>
											<c:if test="${ fn:length(lec.title) < 10 }">
												<span>${ lec.title }</span>
											</c:if>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
							<div id="location">지역</div>
							<div id="T_location">${ teacher.activeLoc }</div>
						</div>
						<div id="MsgBtnWarpper">
							<button class="sendMsgBtn" type="button">쪽지</button>
						</div>
					</div>
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
			
			<!-- 예시 -->
			<%-- 
			<div class="listDetail">
				<div class="imgWrapper">
					<img id="profileImg" src="${ contextPath }/resources/images/bilyong.jpg"/>
				</div>
				<div id="informWrapper">
					<div id="T_nickName">요리왕 비룡</div>
					<div id="recent_lecture">최근 강의</div>
					<div id="T_lecture">오..오옼 이맛은! 美! 味!</div>
					<div id="location">지역</div>
					<div id="T_location">서울특별시 강남구</div>
				</div>
				<div id="MsgBtnWarpper">
					<button id="sendMsgBtn" type="button" onClick="sendMsg();">쪽지</button>
				</div>
				
				<script>
					function sendMsg(){
						var writer = ${ gf.wirter };
						var postNo = ${ gf.postNo };
						var page = ${ page };
						
						location.href="invite.msg?postNo="+postNo+"page";
					}
					
				</script>
			</div>
			<div class="listDetail">
				<div class="imgWrapper">
					<img id="profileImg" src="${ contextPath }/resources/images/wadles.jpg"/>
				</div>
				<div id="informWrapper">
					<div id="T_nickName">와들스</div>
					<div id="recent_lecture">최근 강의</div>
					<div id="T_lecture">육식주의자를 위한 고기 요리 과외</div>
					<div id="location">지역</div>
					<div id="T_location">강남구 청담동</div>
				</div>
				<div id="MsgBtnWarpper">
					<button id="sendMsgBtn" type="button" onClick="">쪽지</button>
				</div>
			</div>
			<div class="listDetail">
				<div class="imgWrapper">
					<img id="profileImg" src="${ contextPath }/resources/images/cheif.jpg"/>
				</div>
				<div id="informWrapper">
					<div id="T_nickName">이산호 셰프</div>
					<div id="recent_lecture">최근 강의</div>
					<div id="T_lecture">힐링 셰프의 메인 디쉬 마스터</div>
					<div id="location">지역</div>
					<div id="T_location">강남구 역삼동</div>
				</div>
				<div id="MsgBtnWarpper">
					<button id="sendMsgBtn" type="button" onClick="">쪽지</button>
				</div>
			</div> --%>
		</div>
		
		<div id="btnWarpper">
			<button id="closeBtn" type="button" onClick="self.close()">닫기</button>
		</div>
	</div>
</body>
</html>