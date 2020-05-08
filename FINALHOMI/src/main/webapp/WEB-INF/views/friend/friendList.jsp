<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    .friendBox{width:100%; background:#fff; margin:1%; height:120px; border:1px solid #000; float:left; box-sizing: border-box;}
    .check-box{float:left; margin-top:45px; margin-left:30px; margin-right:30px; width:20px; height:20px;}
    .user-img{width:8.5%; height:90px; margin:13px; border: 1px solid #000; box-sizing: border-box; border-radius: 60px; box-shadow: 5px 3px 6px 0.1px gray; float:left; margin-right:5%; overflow: hidden;}
    .i-img{width:100%; }
    .i-img > img {width:100%;}
    .user-info{width:55%; height:inherit; float:left;}
    .msgBtn-box{width:15%; float: right;}
    .msg-btn{width:120px; height:50px; background:rgb(136, 140, 67); color:#fff; font-weight: bold; font-size:1.2rem; border-radius:10px;}
    .msg-btn:hover{cursor: pointer; background:#000; color:#fff;}
    #nickNameClick{cursor: pointer;}
    
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
    .whole-btn{width:8%; height:40px; float:left; font-size:1.2rem; line-height: 40px; text-align: center; margin-right:2%; background:#fff; margin-left:82%;}
    .firendDelete{width:8%; height:40px; float:left; font-size:1.2rem; line-height: 40px; text-align: center; background:#fff;}
    
    
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
        <div class="content-one">
        	<c:forEach var="f" items="${list}" varStatus="status">
            <div class="friendBox">
                <input type="checkbox" class="check-box" name="checkbox" value="${ f.userId }">
                <div class="user-img">
                    <div class="i-img"><img src="${contextPath}/resources/uploadFiles/${f.imgSrc}" /></div>
                </div>
                <div class="user-info">
                    <br>
                    <label>닉네임 : </label>
                    <c:url var="userInfo" value="userInfo.fo">
						<c:param name="userId" value="${ f.userId }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<input type="hidden" class="frNick${status.count}" value="${f.userId}">
                    <label id="nickNameClick" onclick="window.open('${ userInfo }','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');" style="display:inline-block; font-weight:650;">${ f.nickName }${f.mKind}</label>&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
                    <c:if test="${f.mKind eq 0}">	
                    	<label style="display:inline-block; font-weight:900; font-family: 'Black And White Picture', sans-serif; font-family: 'Nanum Brush Script', cursive;">( 운 영 자 )</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${f.mKind eq 1}">
                    	<label style="display:inline-block; font-weight:900; font-family: 'Black And White Picture', sans-serif; font-family: 'Nanum Brush Script', cursive;">( 농 부 )</label>&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:if>
                    <c:if test="${f.mKind eq 2}">
                    	<label style="display:inline-block; font-weight:900; font-family: 'Black And White Picture', sans-serif; font-family: 'Nanum Brush Script', cursive;">( 모 종 )</label>&nbsp;&nbsp;&nbsp;&nbsp;
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
            <!-- 복붙박스 -->
        </div>
        <div class="clear-both"></div>
        <div class="btn-box">
            <div class="whole-btn" onclick="checkAll1();" name="checkAll">전체</div>
            <div class="firendDelete" onclick="deleteFriends();">삭제</div>
        </div>
        <div class="clear-both"></div>
        <script type="text/javascript">
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
       <%--  <div class="pageing-box" style="text-align: center;">
            <!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="friend.fo">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }" class="next-box page-box1">&gt;</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="white" size="4"><b style="background:#888c43; display:inline-block; width:10%; padding:5px 0; border-radius: 5px;">${ p }</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="friend.fo">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="friend.fo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }" class="next-box page-box1">&gt;</a>
				</c:if>
        </div> --%>
    </section>
</body>
</html>