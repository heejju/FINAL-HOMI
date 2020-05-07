<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/reset.css" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	body{align:center; font-family: 'Nanum Gothic', sans-serif; width:90%;}
	.listName{hegiht:100px; font-size:24px; margin:0px auto; text-align:left; padding:30px;}
	#imgWrapper{display:inline-block;}
	#imgWrapper > img{vertical-align:middle; width:100px; height:100px;}
	#user{font-weight:bold; color:#888c43}
	
	/* 목록 상세 */
	#list{background:rgb(255, 255, 255); width:420px; height:400px; margin:0px auto; overflow: scroll;}
	.listDetail{width:380px; clear: both; padding:10px 10px 0px 10px; height:80px;}
	
	.userImgWrapper{display:inline-block; margin:0 5px; vertical-align:middle;}
	#profileImg{width:60px; height:60px; vertical-align:middle;}
	
	#informWrapper{display:inline-block; width:200px; height:60px; margin:0 5px; font-size:15px;}
	#nickName{font-weight:bold; font-size:18px; color:#888c43;}
	#introduction{padding:5px 0px; font-family: 'Nanum Gothic', sans-serif; }
	
	#inviteBtnWarpper{display:inline-block; /* margin-left:15px; */}
	#inviteBtn{border-radius:30px; border:0px; width:80px; height:30px;
				color:white; font-weight:bold; font-size:15px; background:#888c43;}
	#cancleBtn{border-radius:30px; border:0px; width:80px; height:30px;
				color:white; font-weight:bold; font-size:15px; background:#675141;}		
		
	#noApp{text-align:center; font-size:18px; font-weight:bold; line-height:400px;}
	/* 
	#noApp{width:400px; text-align:center; padding:200px 0px;} */
	
	button{border:0px; border-radius:5px;}
	.btnArea{margin:0 auto; margin-top:30px; width:185px;}
	#okBtn, #closeBtn{width:90px; height:30px; font-weight:bold; font-size:16px; color:white;}
	#okBtn{background:#888c43;}
	#closeBtn{background:#675141;}
</style>
</head>
<body >
	<div style="background:#fff6f0; width:500px; height:630px;">
		<div class="listName">
			<div id="imgWrapper">
				<img src="${ contextPath }/resources/images/farmer2.png" id="profileImg">
			</div>
			<span id="user">${ loginUser.nickName }</span><span>님의 친구 목록</span>
		</div>
		<c:if test="${ list.size() eq 0 }">
			<div id="list">
				<div id="noApp">친구가 없습니다.</div>
			</div>
		</c:if>
		<c:if test="${ list.size() ne 0 }">
			<div id="list">
				<c:forEach var="friend" items="${ list }">
					<div class="listDetail">
						<div class="userImgWrapper">
							<c:if test="${ empty friend.changeName }">
								<img id="profileImg" src="${ contextPath }/resources/images/almond.png"/>
							</c:if>
							<c:if test="${ !empty friend.changeName }">
								<img id="profileImg" src="${ contextPath }/resources/uploadFiles/${ friend.changeName }"/>
							</c:if>
						</div>
						<div id="informWrapper">
							<div id="nickName">${friend.nickName}</div>
							<div id="introduction">${ friend.introduction }</div>
						</div>
						<div id="inviteBtnWarpper">
							<input type="hidden" class=friend value="${friend.userId}">
							<button id="inviteBtn" type="button" >초대 하기</button>
						</div>
					</div>
				</c:forEach>
				<input type="hidden" id="friends">
			</div>
		</c:if>
		
		
		<div class="btnArea">
			<button type="button" id="okBtn" onclick="DeliverInform();">확인</button>
			<button type="button" id="closeBtn" onClick="window.open('','_self').close();">닫기</button>
		</div>
		
		<script>

			$('#friends').val(window.opener.document.getElementById("inviteFriends").value);
			console.log($('#friends'));
			var invited = $('#friends').val().split(",");
			
			
			var idArr = [];
			
			$(document).on('click', '#inviteBtn', function(){	
				var userId = $(this).parent().children().eq(0).val();
				
                console.log("초대");
                
				idArr.push(userId);
				console.log(userId);
				console.log(idArr);
				
                $(this).css('background-color', '#675141');
                $(this).attr('id', 'cancleBtn');
                $(this).text('초대 취소');
               // console.log($(this));
			});
			
			$(document).on('click', '#cancleBtn', function(){	
				var userId = $(this).parent().children().eq(0).val();
				
				console.log("취소");
				
				// 해당 userId 삭제
				const idx = idArr.indexOf(userId);
				idArr.splice(idx, 1);
				
				console.log(userId);
				console.log(idArr);
				
                $(this).css('background-color', '#888c43');
                $(this).attr('id', 'inviteBtn');
                $(this).text('초대 하기');
               // console.log($(this));
			});

			console.log(idArr);
			/* $('#inviteBtn').click(function(){
			}); */
		
			function DeliverInform(){
				if(confirm("해당 친구들을 모임에 초대하실건가요?")){
					$('#friends').val(idArr);
					var friends = $('#friends').val();
					$("#inviteFriends", opener.document).val(friends);
					self.close();
				}
			}
		</script>
		
		
	</div>
</body>
</html>