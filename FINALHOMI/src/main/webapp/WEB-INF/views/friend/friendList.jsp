<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미 텃밭</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+And+White+Picture|Nanum+Brush+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap" rel="stylesheet">
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
    .f-menubar > li > a{font-size:2rem; line-height: 70px; font-family: 'Black Han Sans', sans-serif;}
    .f-menubar > li > a:hover{font-size:3.5rem;}
    .right-w{width:70%; margin-top:25px;}
    .h-right{width:50%;  float:right; height:80px;}
    .hr-serch{width:40%; height:30px;  box-sizing: border-box; margin-left: 30%; margin-top:-2px; font-size:20px;}
    .hr-btn{width:15%; height:30px;  background:rgb(162, 166, 78); color:#fff; font-weight: bold;}
    
    /*컨텐츠*/
     
    .content-one{width:80%; height:auto; margin:0 auto;}
    .friendBox{width:100%; background:#fff; margin:1%; height:120px; border:1px solid #000; float:left; box-sizing: border-box;}
    .check-box{float:left; margin-top:45px; margin-left:30px; margin-right:30px; width:20px; height:20px;}
    .user-img{width:8.5%; height:90px; margin:13px; border: 1px solid #000; box-sizing: border-box; border-radius: 60px; box-shadow: 5px 3px 6px 0.1px gray; float:left; margin-right:5%; overflow: hidden;}
    .i-img{width:100%; }
    .i-img > img {width:100%; height:100%;}
    .user-info{width:55%; height:inherit; float:left;}
    .msgBtn-box{width:15%; float: right;}
    .msg-btn{width:120px; height:50px; background:rgb(136, 140, 67); color:#fff; font-weight: bold; font-size:1.2rem; border-radius:10px;}
    .msg-btn:hover{cursor: pointer; background:#000; color:#fff;}
    #nickNameClick{cursor: pointer;}
    
    .listNull{text-align: center; margin-top: 50px; font-weight:700;}
    
    /*이미지 마우스 올렸을때*/
    .i-img{position:relative; cursor:pointer; /* background-color:#000; */ padding-top:100%; overflow:hidden; margin-bottom:15px;}
	.i-img img{position:absolute; top:0; opacity:0.8; filter:alpha(opacity=80);}
	.i-img .hover-op{-webkit-transition:transform 0.5s ease, opacity 0.5s ease, blur 0.5s ease; transition:transform 0.5s ease, opacity 0.5s ease, blur 0.5s ease; opacity:1; filter:alpha(opacity=100); z-index:1; -webkit-filter:blur(0px); filter:blur(0px);}
	.i-img:hover .hover-op{-webkit-transform:scale(1.2); transform:scale(1.2); opacity:0; filter:alpha(opacity=0); -webkit-filter:blur(1px); filter:blur(1px);}
    
    
    /*버튼*/
    .pageing-box{width:20%; height:30px; margin:0 auto;}
    .page-box1{float:left; background:#fff; margin-right:4%; font-size:1.5rem; width:9.71%; height:30px; line-height: 30px; text-align: center; border-radius: 5px; cursor: pointer;}
    .pre-box{line-height: 27px; background:rgb(103, 81, 65); color:#fff;}
    .next-box{line-height: 27px; background:rgb(103, 81, 65); color:#fff;}
    .pageing-box > div:nth-child(1){margin-left:4%;}
    .pageing-box > div:nth-child(2){background:rgb(136, 140, 67); color:#fff;}
    .numBox{font-size:1.2rem;}
    
    
    /*버튼2*/
    .btn-box{width:100%; margin: 30px 0 30px 0;}
    .whole-btn{width:8%; height:40px; float:left; font-size:1.2rem; line-height: 40px; text-align: center; margin-right:2%; background:#f39c12; margin-left:10.5%; font-weight:600; cursor: pointer; color:#fff;}
    .whole-btn:hover{background:#000; color:#f39c12;}
    .firendDelete{width:8%; height:40px; float:left; font-size:1.2rem; line-height: 40px; text-align: center; background:#675141; color:#fff; font-weight:600; cursor: pointer;}
    .firendDelete:hover{background:#000;}
    
    
</style>

</head>
<body>
	 <script>
	 	$('#bName').text(' 친구 ');
	 	$('#bNameAfter').text('목록');
	 </script>
	 <section>
        <div class="sc-header">
            <div class="h-left">
                <div class="right-w">
                    <input type="search" id="searchValue" class="hr-serch">
                    <button onclick="searchFriend();" class="hr-btn">검색</button>
                </div>
                <!-- <div class="h-img"></div>
                <div class="hf-txt">친구</div> -->
            </div>
            <div class="h-right">
                <ul class="f-menubar">
                    <li>
                        <a href="friend.fo">목록</a>
                    </li>
                    <li>|</li>
                    <li>
                        <a href="search.fo">찾기</a>
                    </li>
                    <li>|</li>
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
        <div class="btn-box">
            <div class="whole-btn" onclick="checkAll1();" name="checkAll">전체</div>
            <div class="firendDelete" onclick="deleteFriends();">삭제</div>
        </div>
        <script>
	        function checkAll1(){
				var checkbox = document.getElementsByName("checkbox");
				var checkAll = document.getElementsByName("checkAll");
				
				for(var i = 0; i < checkbox.length; i++){
					if(checkbox[i].checked == false){
						checkbox[i].checked = true;
					} else {
						checkbox[i].checked = false;
					}
				}
			}
        </script>
        <script>
        	function deleteFriends() {
	    	var count = 0 ;
	    	var checkbox = document.getElementsByName("checkbox");
			var userId = [] ;
	    	for(var i=1; i<=checkbox.length; i++) {
	    		if(checkbox[i-1].checked == true) {
	    			count++ ;
					userId.push($('.frNick'+i).val()) ;
				}
	    	}
	    	swal({
	    		   title: "정말 삭제하시겠습니까?",
	    		   text: "네 - 버튼을 눌러 삭제하세요",
    		      icon : "warning",
	    		   buttons: {
	    		      cancel : "아니요!",
	    		      defeat : {text:"네!", value:true},
	    		   }
	    		}).then((value) => {
	    		   if(value == true) {
	    			   $.ajax({
	   		    		method: 'POST',
	   		    		url: 'deleteFrd.fo',
	   		    		traditional : true,
	   		    		data: {'userId':userId},
	   		    		success: function(data) {
	   		    			if(data == 'true') {
	   		    				swal({
	   		    					title: '성공!',
	   		    					text: '친구 삭제에 성공하였습니다!',
	   		    					icon: 'success'
	   		    				}).then(function() {
	   		    					location.reload() ;
	   		    				}) ;
	   		    			} else {
	   		    				swal({
	   		    					title: '실패!',
	   		    					text: '계속 이 문제가 발생한다면, 관리자에게 직접 문의해 주세요!',
	   		    					icon: 'error'
	   		    				}).then(function() {
	   		    					location.reload() ;
	   		    				}) ;
	   		    			}
	   		    		}
	   		    	}) ;
	    		   } else {
	    		      swal({
	    		    	  title: "취소!",
	    		    	  text: "취소하셨습니다.",
	    		    	  icon: "error"
	    		      }) ;
	    		   }
	    		})
	    	
	    }
        </script>
        <div class="clear-both"></div>
        <div class="content-one">
            <c:if test="${ empty list }">
            	<div class="listNull">친구 목록이 비어있습니다.</div>
            </c:if>
        	
        	<c:if test="${ !empty list }">
        	<c:forEach var="f" items="${list}" varStatus="status">
            <div class="friendBox">
                <input type="checkbox" class="check-box" name="checkbox" value="${ f.userId }">
                    <c:url var="userInfo" value="userInfo.fo">
						<c:param name="userId" value="${ f.userId }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
                <div class="user-img">
                    <div class="i-img" onclick="window.open('${ userInfo }','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');">
                    	<img src="${contextPath}/resources/uploadFiles/${f.imgSrc}"  class="img-responsive hover-op"/>
                    	<img src="${contextPath}/resources/uploadFiles/${f.imgSrc}"  class="img-responsive hover-st"/>
                   	</div>
                </div>
                <div class="user-info">
                    <br>
                    <label>닉네임 : </label>
					<input type="hidden" class="frNick${status.count}" value="${f.userId}">
                    <label id="nickNameClick" onclick="window.open('${ userInfo }','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');" style="display:inline-block; font-weight:650;">${ f.nickName }${f.mKind}</label>&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
                    <c:if test="${f.mKind eq 0}">	
                    	<label style="display:inline-block; font-weight:500; font-family: 'Black Han Sans', sans-serif;">( 운 영 자 )</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${f.mKind eq 1}">
                    	<label style="display:inline-block; font-weight:500; font-family: 'Black Han Sans', sans-serif;">( 농 부 )</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${f.mKind eq 2}">
                    	<label style="display:inline-block; font-weight:500; font-family: 'Black Han Sans', sans-serif;">( 모 종 )</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if><br><br>
                    <label style="display:inline-block; font-weight:700; margin-bottom:8px;">자기소개 : </label>
                    <label>${ f.introduction }</label>
                </div>
                <div class="msgBtn-box">
                    <br><br>
                    <input type="button" value="쪽 지" class="msg-btn" onclick="window.open('insertForm.msg?to=${f.userId}','쪽지보내기','resizable = no, scrollbars = no, width = 500, height = 550');">
                </div>
            </div>
            </c:forEach>
            </c:if>
            
            <!-- 복붙박스 -->
        </div>
        <div class="clear-both"></div>     
    </section>
</body>
</html>