<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ contextPath }/resources/css/reset.css" type="text/css">
<link rel="stylesheet" href="${ contextPath }/resources/css/menu.css" type="text/css">

<title>Insert title here</title>
<style>
	#logoWrapper{width:20%; float:right; margin-top:50px; margin-right:30px;}
	#logo{width:100%;}
	#subHeader{margin-bottom:50px;}
	#boardName{width:100%; height:70px; margin-top:10%; border-bottom: 1.5pt solid gray; text-align:center;
				font-size: 30pt; font-weight: bold; display : inline-table; }
</style>
</head> 
<body>
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<header>
        <div id="toggle">
            <div class="span" id="one"></div>
            <div class="span" id="two"></div>
            <div class="span" id="three"></div>
            <div class="span" id="four"></div>
        </div>
        <div id="logoWrapper">
            <img id="logo" alt="logo" src="${ contextPath }/resources/images/Logo.png" onclick="location.href='<%=request.getContextPath()%>'" style="cursor: pointer;">
        </div>
        
        <div id="subHeader">
			<div id="boardName">
				<label>#</label>
				<label id="bName" style="color:#888c43">동네</label>
				<label id="bNameAfter" style="color:#675141">텃밭</label>
			</div>
		</div>
        
        <c:url var="nlist" value="nlist.no"/><!-- 공지사항  -->
        <c:url var="gflist" value="blist.gf"/><!-- 모임텃밭 -->
        <c:url var="qlist" value="qlist.qu"/><!-- 1:1문의 -->
        <c:url var="lecList" value="list.lec"/><!-- a-모종구하기 -->
        <c:url var="mlist" value="mlist.ma"/><!-- 텃밭 관리 -->
        <c:url var="statistics" value="statistics.st"/><!-- 통계 -->
        <c:url var="reportList" value="reportList.fo"/>
        <c:url var="friend" value="friend.fo"/>
        <nav id="renav">
        <div class="nav-wrap">
            <div class="login" style="margin-bottom:10px; line-height:100px; padding-left:20px;">
					<c:if test="${empty sessionScope.loginUser}">
						<c:url var="login" value="loginView.me" />
						<c:url var="join" value="joinViewSelect.me" />
						<a href="${login}" class="login-btn">로그인</a>
						<a href="${join}" class="join-btn">회원가입</a>
					</c:if>
					<c:if test="${!empty sessionScope.loginUser}">
						<c:out value="${ loginUser.userName }님 환영합니다." />
						<c:url var="logout" value="logout.me" />
						<c:if test="${ loginUser.mKind == 1 }">
							<c:url var="myPage" value="studentPage.mp" />
						</c:if>
						<c:if test="${ loginUser.mKind == 2 }">
							<c:url var="myPage" value="teacherPage.mp" />
						</c:if>
						<c:if test="${ loginUser.mKind == 0 }">
							<c:url var="myPage" value="myinfo.me" />
							<!-- 운영자는 마이페이지 없이 개인정보 열람 페이지로 바로 이동하도록 함 -->
						</c:if>
						<a onclick="msgPopup();" style="cursor: pointer; display:inline-block; margin-left:10px;"> 
							<img style="width: 30px; margin-bottom:-10px;" src="${contextPath }/resources/images/message.png">
						</a>
						<a href="${friend}" style="cursor: pointer; display:inline-block; margin-left:10px;">
               				<img style="width: 30px; margin-bottom:-10px;" src="${contextPath }/resources/images/friends.png">
               			</a>
						<a href="${myPage}" class="login-btn">정보보기</a>
						<a href="${logout}" class="join-btn">로그아웃</a>
					</c:if>
				</div>
            <ul class="nav-menu">
                <li>
                    <a href="${ nlist }">공지사항</a>
                </li>
                <li class="main-menu">
                    <a href="${ lecList }" class="suv-menu-1">모종 구하기</a>
                </li>
                <li class="main-menu">
                    <a href="${ gflist }" class="suv-menu-3">동네 텃밭</a>
                </li>
                <li class="main-menu">
                    <a href="${qlist}" class="suv-menu-5">1:1 문의</a>
                </li>
                <li class="main-menu">
                    <a href="${mlist }" class="suv-menu-5">텃밭 관리</a>
                </li>
                <li class="main-menu">
                    <a href="${statistics }" class="suv-menu-5">텃밭 통계</a>
                </li>
            </ul>
        </div>
        
        <div class="nav-wrap2">
            <div class="binClass"></div>
            <div class="suv-menu-2">
                <div class="menu-line">
                    <a href="">서브 메뉴1</a>
                    <a href="">서브 메뉴2</a>
                </div>
            </div>
            <div class="suv-menu-4">
                <div class="menu-line">
                    <a href="${ reportList }">서브 메뉴3</a>
                    <a href="">서브 메뉴4</a>
                    <a href="">서브 메뉴5</a>
                </div>
            </div>
        </div>
    </nav>
    </header>
</body>
<script>

$("#toggle").click(function(){
    $(this).toggleClass("on");
    $("#renav").toggleClass("active");	
});
    
    
    
$('.suv-menu-1').mouseover(function(){
    $('.nav-wrap2').css({'width':'15%', 'transition':'0.5s ease-in'});
    $('.suv-menu-2').css('display','block');
    $('.suv-menu-4').css('display','none');
    $(this).text('강의 구하기');
}).mouseout(function(){
    $(this).text('모종 구하기');
});

$('.suv-menu-2, .nav-wrap2').mouseout(function(){
     $('.nav-wrap2').css({'width':'0%', 'transition':'0.5s ease-in'});
//    $('.nav-wrap2').css('display', 'none');
//    $('.suv-menu-2').css({'transition':'5s ease-in','display':'none'});
});
$('.suv-menu-2').mouseover(function(){
     $('.nav-wrap2').css({'width':'15%', 'transition':'0.5s ease-in'});
//    $('.nav-wrap2').css('display','block');
    $('.suv-menu-2').css('display','block');
    
});
 $('.nav-wrap , .suv-menu-1').mouseout(function(){
     $('.nav-wrap2').css({'width':'0%', 'transition':'0.5s ease-in'});
//    $('.nav-wrap2').css('display', 'none');
//    $('.suv-menu-2').css({'transition':'5s ease-in','display':'none'});
});
    
$('.suv-menu-3').mouseover(function(){
     $('.nav-wrap2').css({'width':'15%', 'transition':'0.5s ease-in'});
//    $('.nav-wrap2').css('display', 'block');
    $('.suv-menu-4').css('display','block');
    $('.suv-menu-2').css('display','none');
    /*$('.text-menu>span').css('opacity','1');*/
});
$('.suv-menu-4, .nav-wrap2').mouseout(function(){
    $('.nav-wrap2').css({'width':'0%', 'transition':'0.5s ease-in'});
//    $('.nav-wrap2').css('display', 'none');
//    $('.suv-menu-4').css({'transition':'5s ease-in','display':'none'});
});
$('.suv-menu-4').mouseover(function(){
     $('.nav-wrap2').css({'width':'15%', 'transition':'0.5s ease-in'});
//    $('.nav-wrap2').css('display', 'block');
    $('.suv-menu-4').css('display','block');
});
 $('.nav-wrap , .suv-menu-3').mouseout(function(){
     $('.nav-wrap2').css({'width':'0%', 'transition':'0.5s ease-in'});
//    $('.nav-wrap2').css('display', 'none');
//    $('.suv-menu-4').css({'transition':'5s ease-in','display':'none'});
     /*$('.text-menu>span').css('opacity','0');*/
});

 function msgPopup() {
		
		var url = "msgList.msg";
		var option = "resizable = no, scrollbars = no, width = 500, height = 550";
		window.open(url, "쪽지함", option);
		
	}


</script>
</html>