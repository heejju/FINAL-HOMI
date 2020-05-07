<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/reset.css" type="text/css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
<style>

    #wrap{width:600px; background:#ccc; height:700px;}
    header{width:100%; padding-top:50px;}
    .profile-img{width:150px; height:150px; margin:0 auto; background:#fff; border-radius:100px; box-shadow: 3px 3px 15px 1px;}
    .user{width:50%; margin:0 32%; margin-top:30px;}
    .user-id{width:70%; display: inline-block; text-align: center; font-size:1.8rem;}
    .repot{width:25%; display: inline-block; text-align: center;}
    .user-btn{width:100%;}
    .btn-wrap{width:50%; margin:0 auto; margin-top: 20px;}
    .mss-btn{width:34%; padding:10px 15px; font-weight:bold; font-size:1.2rem; color:#fff; float:left; text-align: center; background:rgb(136, 140, 67); margin-right:8%; border-radius: 10px; cursor: pointer;}
    .fd-btn{width:34%; padding:10px 15px; font-weight:bold; font-size:1.2rem; color:#fff; float:left; text-align: center; background:rgb(103, 81, 65); border-radius: 10px; cursor: pointer;}
    
    
    section{margin-bottom:40px;}
    .line-sc{width:70%; height:2px; background:#fff; margin:30px auto; }
    .user-info{font-size:1.6rem; text-align: center; font-style: italic;}
    
    
    .content-wrap{width:100%;}
    .content-one{width:90%; height:30px; margin:0 auto; border:1px solid #000; box-sizing: border-box; border-radius: 10px; margin-bottom: 10px;}
    .c-sharing{text-align: center; font-weight:bold; font-size:1.3rem; height:30px; line-height: 28px; float:left;}
    .c-Number{width:15%;}
    .c-Title{width:60%;}
    .c-Date{width:25%;}
    
    .content-two{width:90%; height:30px; margin:0 auto;}
    .c2-sharing{float:left; text-align: center;}
    .c2-Number{width:15%;}
    .c2-Title{width:60%;}
    .c2-Date{width:25%;}
    
    
    footer{width:100%;}
    .close-btn{width:10%; padding:15px 35px; background:#fff; margin:0 auto; font-size:1.5rem; text-align: center; cursor: pointer; border-radius: 5px;} 
    
    
</style>
</head>
<body>
	<div id="wrap">
        <header>
            <div class="profile-img"></div>
            <c:url var="report" value="report.fo">
            	<c:param name="userId" value="${ member.userId }"/>
            	<c:param name="page" value="${ pi.currentPage }"/>
            </c:url>
            <div class="user">
                <div class="user-id">${ member.userName }</div>
                <div class="repot" onclick="window.open('${ report }','window팝업','width=400, height=670, menubar=no, status=no, toolbar=no');">신고</div>
            </div>
            <div class="user-btn">
                <div class="btn-wrap">
                    <div class="mss-btn">쪽지 전송</div>
                    <div class="fd-btn">친구 요청</div>
                </div>
            </div>
            <div class="clear-both"></div>
        </header>
        <section>
            <div class="line-sc"></div>
            <h2 class="user-info">${ member.introduction }</h2> 
            <div class="line-sc"></div>
            <div class="content-wrap">
                <div class="content-one">
                    <div class="c-Number c-sharing">No.</div>
                    <div class="c-Title c-sharing">모종 중</div>
                    <div class="c-Date c-sharing">시작일</div>
                </div>
                <div class="clear-both"></div>
                <div class="content-two">
                    <div class="c2-Number c2-sharing">No.1</div>
                    <div class="c2-Title c2-sharing">쪼마난 마을의 레진 공예,민간 자격증 발...</div>
                    <div class="c2-Date c2-sharing">2020-03-20</div>
                </div>
                <div class="content-two">
                    <div class="c2-Number c2-sharing">No.1</div>
                    <div class="c2-Title c2-sharing">쪼마난 마을의 레진 공예,민간 자격증 발...</div>
                    <div class="c2-Date c2-sharing">2020-03-20</div>
                </div>
                <div class="content-two">
                    <div class="c2-Number c2-sharing">No.1</div>
                    <div class="c2-Title c2-sharing">쪼마난 마을의 레진 공예,민간 자격증 발...</div>
                    <div class="c2-Date c2-sharing">2020-03-20</div>
                </div>
            </div>
            <div class="clear-both"></div>
        </section>
        <footer>
            <div class="close-btn" onclick="window.close();">닫기</div>
        </footer>
    </div>
</body>

</html>