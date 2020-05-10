<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미 텃밭</title>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/reset.css" type="text/css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>

/* 
html5doctor.com Reset Stylesheet v1.6.1
Last Updated: 2010-09-17
Author: Richard Clark - http://richclarkdesign.com 
*/

html, body, div, span, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
abbr, address, cite, code,
del, dfn, em, img, ins, kbd, q, samp,
small, strong, sub, sup, var,
b, i,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section, summary,
time, mark, audio, video{
    margin:0; padding:0; border:0; outline:0; vertical-align:baseline; background:transparent; margin:0;}    

body { line-height:1em; }

.clear-both{clear: both;}

article,aside,details,figcaption,figure,
footer,header,hgroup,menu,nav,section { display:block; }

ul { list-style:none; }

blockquote, q { quotes:none;}

blockquote:before, blockquote:after,q:before, q:after { content:''; content:none;}

a { margin:0; padding:0; font-size:100%; vertical-align:baseline; background:transparent; text-decoration:none;	display:block;	-webkit-transition:0.5s ease-in; transition:0.5s ease-in; color:black;}
 
/* change colours to suit your needs */
ins {background-color:#ff9; color:#000;  text-decoration:none;}

/* change colours to suit your needs */
mark { background-color:#ff9; color:#000;  font-style:italic; font-weight:bold;}
del { text-decoration: line-through;}
abbr[title], dfn[title] { border-bottom:1px dotted; cursor:help;}
table {border-collapse:collapse; border-spacing:0;}
/* change border colour to suit your needs 
hr { display:block; height:1px;  border:0;  border-top:1px solid #cccccc; margin:0; padding:0;}*/
hr { display:block; border:0;  border-top:1px solid #F0F0F0; margin:0; padding:0;}
input, select {vertical-align:middle;}
img{	border:0;}

/**/
    #wrap{width:600px; background: rgb(253, 250, 234); height:700px;}
    header{width:100%; padding-top:50px;}
    .profile-img{width:150px; height:150px; margin:0 auto; background:#fff; border-radius:100px; box-shadow: 3px 3px 15px 1px; overflow: hidden;}
    .user-img{width:8.5%; height:150px; margin:13px; border: 1px solid #000; box-sizing: border-box; border-radius: 60px; box-shadow: 5px 3px 6px 0.1px gray; float:left; margin-right:5%; overflow: hidden;}
    .i-img{width:100%; }
    .i-img > img {width:100%;}
    .user{width:50%; margin:0 32%; margin-top:30px;}
    .user-id{width:70%; display: inline-block; text-align: center; font-size:1.8rem;}
    .repot{width:10%; display: inline-block; text-align: center; cursor: pointer; font-weight:600;}
    .repot > img {width:100%; transform: rotateY(180deg);}
    .repot > img:hover{transform: scale(0.85) rotateY(180deg)}
    .user-btn{width:100%;}
    .btn-wrap{width:50%; margin:0 auto; margin-top: 20px;}
    .mss-btn{width:34%; padding:10px 15px; font-weight:bold; font-size:1.2rem; color:#fff; float:left; text-align: center; background:rgb(136, 140, 67); margin-right:8%; border-radius: 10px; cursor: pointer;}
    .fd-btn{width:34%; padding:10px 15px; font-weight:bold; font-size:1.2rem; color:#fff; float:left; text-align: center; background:rgb(103, 81, 65); border-radius: 10px; cursor: pointer;}
    
    
    section{margin-bottom:40px;}
    .line-sc{width:70%; height:2px; background:#ccc; margin:30px auto; }
    .user-info{font-size:1.6rem; text-align: center; font-style: italic; line-height:1.6rem;}
    
    
    .content-wrap{width:100%;}
    .content-one{width:90%; height:30px; margin:0 auto; border:1px solid #000; box-sizing: border-box; border-radius: 10px; margin-bottom: 10px;}
    .c-sharing{text-align: center; font-weight:bold; font-size:1.1rem; height:30px; line-height: 28px; float:left;}
    .c-Number{width:15%;}
    .c-Title{width:60%;}
    .c-Date{width:25%;}
    
    .content-two{width:90%; height:30px; margin:0 auto;}
    .c2-sharing{float:left; text-align: center;}
    .c2-Number{width:15%;}
    .c2-Title{width:60%;}
    .c2-Date{width:25%;}
    
    
    footer{width:100%;}
    .close-btn{width:10%; padding:15px 35px; background:rgba(0,0,0, 0.7); color:#fff; margin:0 auto; font-size:1.5rem; text-align: center; cursor: pointer; border-radius: 5px;}
    .close-btn:hover{background:#000;} 
    
    
    /*이미지 마우스 올렸을때*/
    .i-img{position:relative; /* background-color:#000; */ padding-top:100%; overflow:hidden; margin-bottom:15px;}
	.i-img img{position:absolute; top:0; opacity:0.8; filter:alpha(opacity=80); height:100%; width:100%;}
	.i-img .hover-op{-webkit-transition:transform 0.5s ease, opacity 0.5s ease, blur 0.5s ease; transition:transform 0.5s ease, opacity 0.5s ease, blur 0.5s ease; opacity:1; filter:alpha(opacity=100); z-index:1; -webkit-filter:blur(0px); filter:blur(0px);}
	.i-img:hover .hover-op{-webkit-transform:scale(1.2); transform:scale(1.2); opacity:0; filter:alpha(opacity=0); -webkit-filter:blur(1px); filter:blur(1px);}
    
</style>
</head>

<body onload='resizeWindow(this)'>
	<div id="wrap">
        <header>
        	<div  class="profile-img">
           		<div class="i-img">
               		<img src="${contextPath}/resources/uploadFiles/${member.changeName}"  class="img-responsive hover-op"/>
               		<img src="${contextPath}/resources/uploadFiles/${member.changeName}"  class="img-responsive hover-st"/>
              	</div>
        	</div>
            <c:url var="report" value="report.fo">
            	<c:param name="userId" value="${ member.userId }"/>
            	<c:param name="page" value="${ pi.currentPage }"/>
            </c:url>
            <div class="user">
                <div class="user-id">${ member.nickName }</div>
                <div class="repot" onclick="rePort();" >
                	<img alt="신고" src="${ contextPath }/resources/images/icon.png">
                </div>
            </div>
            <script>
            	function rePort(){
            		
            		window.open('${report}','window신고팝업','width=600, height=787, menubar=no, status=no, toolbar=no');
            	}
            </script>
            <c:url var="userInfo" value="userInfo.fo">
				<c:param name="userId" value="${ member.userId }"/>
				<c:param name="page" value="${ pi.currentPage }"/>
			</c:url>
            <div class="user-btn">
                <div class="btn-wrap">
                    <div class="mss-btn" onclick="window.open('insertForm.msg?to=${member.userId}','쪽지보내기','resizable = no, scrollbars = no, width = 500, height = 550');">쪽지 전송</div>
                    <c:if test="${ empty member.fdStatus }"> 
                    	<div class="fd-btn">친구 요청</div>
                    </c:if>
                    <c:if test="${ member.fdStatus == '0' }">
                    	<div class="fd-btn">요청중</div>
                    </c:if>
                    <input type="hidden" value="${ member.userId }" class="hiddenName">
                </div>
                <script>
                $(".fd-btn").click(function(){    	    			 
                	var userId = $(this).parent().children(".hiddenName").val();	
	    			console.log(userId);
	    			$.ajax({
	    				url:"request.fo",
	    				data: {userId:userId},
	    				type:"post",
	    				success: function(data){
	    					if(data == "success"){
	    						location.href="userInfo.fo?userId=${member.userId}&page=1";
	    					}
	    				 }
	    			});
	    		});
                </script>
            </div>
            <div class="clear-both"></div>
        </header>
        <section>
            <div class="line-sc"></div>
            <c:if test="${!empty member.introduction }">
            	<h2 class="user-info">${ member.introduction }</h2>
            </c:if>
            <c:if test="${empty member.introduction }">
            	<h2 class="user-info" style="color:red;">자기소개 작성을 하지 않으셨습니다.</h2>
           	</c:if> 
            <div class="line-sc"></div>
            <div class="content-wrap">
                <div class="content-one">
                    <div class="c-Number c-sharing">No.</div>
                    <div class="c-Title c-sharing">모종 중</div>
                    <div class="c-Date c-sharing">시작일</div>
                </div>
                <div class="clear-both"></div>
                <c:if test="${ empty cList }">
                	<div class="listNull" align="center" style="margin-top:25px; color:#ccc; font-weight:600; font-size:20px;">현재 진행중인 수업이 없습니다</div>
                </c:if>
                <c:if test="${ !empty cList }">
                <c:forEach var="c" items="${ cList }">
                	<div class="content-two">
	                    <div class="c2-Number c2-sharing" style="color:#888c43; font-weight:600;">${ c.postNo }</div>
	                    <div class="c2-Title c2-sharing" style="color:#888c43; font-weight:600;">${ c.conTent }</div>
	                    <div class="c2-Date c2-sharing" style="color:#888c43; font-weight:600;">${ c.startDate }</div>
	                </div>
                </c:forEach>
                </c:if>
            </div>
            <div class="clear-both"></div>
        </section>
        <footer>
            <div class="close-btn" onclick="window.close();">닫기</div>
        </footer>
    </div>
</body>

</html>