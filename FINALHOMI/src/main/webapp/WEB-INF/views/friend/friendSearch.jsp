<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+And+White+Picture|Nanum+Brush+Script&display=swap" rel="stylesheet">
<c:import url="../common/boardCommon.jsp"/>
<style>
    body{background:rgb(255, 246, 240); font-family: 'Nanum Gothic', sans-serif;}
    section{width:70%; margin:0 auto; }
    .sc-header{width:100%; height:100px; /* border-bottom:1px solid #000; */ box-sizing: border-box;}
    .h-left{width:50%; height:80px; float:left;}
    .h-img{width:15%; background:#ccc; height:80px; float:left;}
    .hf-txt{width:15%; height:80px; font-size:2.5rem; float:left; line-height:70px; text-align: center; font-family: 'Nanum Gothic', sans-serif; font-weight:600;}
    .f-menubar{height:80px; float:right;}
    .f-menubar > li{display: inline-block; font-size:1.6rem;}
    .f-menubar > li > a{font-size:2rem; line-height: 70px; font-family: 'Black And White Picture', sans-serif; font-family: 'Nanum Brush Script', cursive;}
    .f-menubar > li > a:hover{font-size:3.5rem;}
    .right-w{width:70%; margin-top:25px;}
    .h-right{width:50%;  float:right; height:80px;}
    .hr-serch{width:40%; height:30px;  box-sizing: border-box; margin-left: 30%; margin-top:-2px; font-size:20px;}
    .hr-btn{width:15%; height:30px;  background:rgb(162, 166, 78); color:#fff; font-weight: bold;}
    
    
    /*컨텐츠*/
    .content-one{width:80%; height:auto; margin:0 auto;}
    .friendBox{width:48%; background:rgb(253, 250, 234); margin:1%; height:120px; border:2px dashed rgb(162, 166, 78); float:left; box-sizing: border-box;}
    .user-img{width:18%; overflow: hidden; height:90px; margin:13px; box-sizing: border-box; border-radius: 60px; box-shadow: 5px 3px 6px 0.1px gray; float:left; margin-right:5%;}
    .i-img{width:100%; }
    .i-img > img {width:100%;}
    .user-info{width:55%; height:inherit; float:left;}
    .uBtn-box{width:10%; float: left;}
    .u-btn{width:80px; height:30px; background:rgb(103, 81, 65); color:#fff; font-weight: bold;}
    
    /*버튼*/
    .pageing-box{width:20%; height:30px; margin:0 auto;}
    .page-box1{float:left; background:#fff; margin-right:4%; font-size:1.5rem; width:9.71%; height:30px; line-height: 30px; text-align: center; border-radius: 5px; cursor: pointer;}
    .pre-box{line-height: 27px; background:rgb(103, 81, 65); color:#fff;}
    .next-box{line-height: 27px; background:rgb(103, 81, 65); color:#fff;}
    .pageing-box > div:nth-child(1){margin-left:4%;}
    .pageing-box > div:nth-child(2){background:rgb(136, 140, 67); color:#fff;}
    .numBox{font-size:1.2rem;}
</style>
</head>
<body>
	<script>
	 	$('#bName').text(' 친구 ');
	 	$('#bNameAfter').text('찾기');
	 </script>
	<section>
        <div class="sc-header">
            <div class="h-left">
                <!-- <div class="h-img"></div>
                <div class="hf-txt">친구</div> -->
                <div class="right-w">
                    <input type="search" id="searchValue" class="hr-serch">
                    <button onclick="searchFriend();" class="hr-btn">검색</button>
                </div>
            </div>
            <div class="h-right">
                <ul class="f-menubar">
                    <li>
                        <a href="friend.fo">목록</a>
                    </li>
                    <li>&nbsp;|&nbsp;</li>
                    <li>
                        <a href="search.fo">찾기</a>
                    </li>
                    <li>&nbsp;|&nbsp;</li>
                    <li>
                        <a href="requestpage.fo">요청</a>
                    </li>
                    
                </ul>
            </div>
            <script type="text/javascript">
				function searchFriend(){
					var searchValue = $("#searchValue").val();
						location.href="friendSearch.fo?searchValue="+searchValue;
				}
			</script>
        </div>
        <div class="clear-both"></div>
        <div class="content-one">
            <c:forEach var="f" items="${ list }">
            <div class="friendBox">
                <div class="user-img">
                    <div class="i-img"><img src="${contextPath}/resources/uploadFiles/${f.changeName}"/></div>
                </div>
                <div class="user-info">
                    <br>
                    <label style="display:inline-block; font-weight:700; font-size:18px; margin-top:5px; margin-right:5px;">닉네임 : </label>
                    <c:url var="userInfo" value="userInfo.fo">
						<c:param name="userId" value="${ f.userId }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
                    <label id="nickNameClick" onclick="window.open('${ userInfo }','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');" style="display:inline-block; font-weight:650;">${ f.nickName }</label>&nbsp;&nbsp;
                    <c:if test="${f.mKind eq 0}">	
                    	<label style="display:inline-block; font-weight:900; font-family: 'Black And White Picture', sans-serif; font-family: 'Nanum Brush Script', cursive;">( 운 영 자 )</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${f.mKind eq 1}">
                    	<label style="display:inline-block; font-weight:900; font-family: 'Black And White Picture', sans-serif; font-family: 'Nanum Brush Script', cursive;">( 농 부 )</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${f.mKind eq 2}">
                    	<label style="display:inline-block; font-weight:900; font-family: 'Black And White Picture', sans-serif; font-family: 'Nanum Brush Script', cursive;">( 모 종 )</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if><br><br>
                    <label style="display:inline-block; font-weight:700; margin-bottom:8px;">자기소개 - </label><br>
                    <label>${ f.introduction }</label>
                    
                </div>
                <div class="msgBtn-box">
                    <br><br>
                    <input type="hidden" value="${ f.userId }" class="hiddenName">
                    <c:if test="${ f.fdStatus == '0' }">
                    	<div class="msg-btn2">진 행 중</div>
                    	<input type="button" value="취 소" class="msg-btn3">	
                    </c:if>
                    <c:if test="${ empty f.fdStatus }"> 
                    	<input type="button" value="요 청" class="msg-btn1">
                    </c:if>
                    
                    
                </div>
            </div>
            </c:forEach>
            <!-- 복붙박스 -->
            <script>
                    	
	                    $(".msg-btn1").click(function(){    	    			 
	                    	var userId = $(this).parent().children(".hiddenName").val();	
	    	    			console.log(userId);
	    	    			$.ajax({
	    	    				url:"request.fo",
	    	    				data: {userId:userId},
	    	    				type:"post",
	    	    				success: function(data){
	    	    					if(data == "success"){
	    	    						location.href="search.fo";
	    	    					}
	    	    				 }
	    	    			});
	    	    		});
	                    
	                    $(".msg-btn3").click(function(){    	    			 
	                    	var userId = $(this).parent().children(".hiddenName").val();	
	    	    			console.log(userId);
	    	    			$.ajax({
	    	    				url:"reSet.fo",
	    	    				data: {userId:userId},
	    	    				type:"post",
	    	    				success: function(data){
	    	    					if(data == "success"){
	    	    						location.href="search.fo";
	    	    					}
	    	    				}
	    	    			});
	    	    		});
	                    
	                    
                    </script>
            
           
        </div>
        <div class="clear-both"></div>
        <div class="pageing-box" style="text-align: center;">
            <!-- [이전] -->
				<c:if test="${ pi.currentPage < 1 }">
				</c:if>
				<c:if test="${ pi.currentPage >= 1 }">
					<c:url var="before" value="search.fo">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }" class="next-box page-box1">&lt;</a> &nbsp;
				</c:if>
				${ pi.endPage } ${ pi.startPage }
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="white" size="4"><b style="background:#888c43; display:inline-block; width:10%; padding:5px 0; border-radius: 5px;">${ p }</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="search.fo">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage <= pi.maxPage }">
				</c:if>
				<c:if test="${ pi.currentPage > pi.maxPage }">
					<c:url var="after" value="search.fo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }" class="next-box page-box1">&gt;</a>
				</c:if>
        </div>
        
    </section>
</body>
</html>