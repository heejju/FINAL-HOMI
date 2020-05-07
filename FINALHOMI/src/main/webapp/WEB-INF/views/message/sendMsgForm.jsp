<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>#취미텃밭</title>
<style>
	input:focus {outline:none;}
	textarea:focus {outline:none;}
	#title{text-align: center; border-bottom: 1px solid gray; color: #888c43;}
	
	#msgInsertForm{width: 100%; border-bottom: 1px solid gray; border-collapse: collapse;}
	
	#btnArea{text-align: center; padding: 10px;}
	.buttonG{width:100px; background-color:#888c43; color:#fff; border:none; padding:5px 0; text-align:center; font-size:15px; cursor:pointer; border-radius:5px; font-weight: bold;}
	
	
	#msgTitle{background: none; width: 95%; border: 0; font-size: 15px;}
	#msg_to{background: none; width: 90%; border: 0; font-size: 15px;}
	#addFriends{background: #F2A62A; border: none; color: white; font-size: 17px; font-weight: bold; border-radius: 5px;}

	<!-- 팝업 -->
	#modal{
  display:none;
  position:fixed; 
  width:100%; height:100%;
  top:0; left:0; 
  background:rgba(0,0,0,0.3);
}
.modal-con{
  display:none;
  border: 1px solid rgb(200, 200, 200);
  position:fixed;
  top:50%; left:50%;
  transform: translate(-50%,-50%);
  width: 80%;
  height: 90%;
  background:#fff;
}
.modal-con .title{
  margin: 0px;
  font-size:20px; 
  padding: 20px; 
  background :  gold;
}
.modal-con .con{
  font-size:15px; line-height:1.3;
  padding: 30px 30px 10px 30px;
}
.modal-con .close{
  display:block;
  position:absolute;
  width:30px; height:30px;
  text-align:center; line-height: 30px;
  text-decoration:none;
  color:#000; font-size:20px; font-weight: bold;
  right:10px; top:18px;
}


#addBtn{
	background: gold; 
	border: 1px solid rgb(200, 200, 200); 
	font-size: 13px; 
	border-radius: 50px; 
	padding: 10px 30px 10px 30px; 
	position: fixed; 
	top: 90%; left: 38%;}

input[type="checkbox"] {display: none;}

input[type="checkbox"] + label {
display: inline-block; width:17px; height: 17px;
cursor: pointer; border: 1px solid rgb(200, 200, 200); border-radius: 50%;float: right;}
input[type="checkbox"]:checked + label {
background:url(${contextPath}/resources/images/checkIcon.png) gold no-repeat center/10px 10px; float: right}

#thumbnail{width: 40px; height: 40px; border-radius: 10px;}
</style>
</head>
<body style="background: #fff6f0;">
	<div>
		<div id="title"><h2># 쪽지쓰기</h2></div>
		<form action="insertMsg.msg" onsubmit="sentMsg();">
			<table id="msgInsertForm" style="line-height: 30px;">
				<tr style="border-bottom: 1px solid gray;">
					<th style="width: 100px; padding: 5px;">제목</th>
					<td colspan="2"><input id="msgTitle" name="msg_title" type="text" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr style="border-bottom: 1px solid gray;">
					<th style="width: 100px; padding: 5px;">받는사람</th>
						<td><input type="text" id="msg_to" name="msg_to" value="${message.msg_to}" required readonly></td>
					<td style="width: 10px;"><button type="button" id="addFriends" onclick="friendsPopup('open');">+</button></td>
				</tr>
				<tr>
					<td colspan="3">
					<textarea rows="13" name="msg_content" style="font-size: 15px; width: 95%; margin: 10px; border: none; resize:none;" placeholder="내용을 입력해주세요"></textarea>
					</td>
				</tr>
			</table>
			
			<div id="btnArea">
				<button class="buttonG">쪽지쓰기</button>
			</div>
		</form>

		<!-- 팝업 레이어 (친구창) -->
		<div id="modal"></div>
		<div class="modal-con open">
			<a href="javascript:;" class="close">X</a>
			<p class="title">친구</p>
			<div class="con" style="height: 330px; overflow: scroll; border-bottom: 1px solid rgb(200, 200, 200);">
				<table>
					<c:if test="${empty friendList}">
						<tr>
							<td colspan="3">친구가.. 없어요...</td>
						</tr>
					</c:if>
					<c:if test="${!empty friendList}">
						<c:forEach var="friendList" items="${friendList}">
							<tr>
								<td style="width: 20%;">
									<img id="thumbnail" src="${ contextPath }/resources/uploadFiles/${friendList.imgSrc}">
								</td>
								<td style="width: 90%;">${friendList.nickName}</td>
								<td style="width: 10%;">
									<input type="checkbox" id="${friendList.userId}" name="checkbox" value="${friendList.userId}" onclick="fCheck();">
									<label for="${friendList.userId}"></label>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
				<button id="addBtn">초대하기</button>
		</div>
		<!-- 팝업 레이어 (친구창) 끝 -->
	</div>
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	
	function sentMsg() {
		if($('#msg_to').val() == "") {
			swal("받는 사람을 입력해주세요!",{
				icon : "warning",
				buttons : {
					confirm : true,
				}
			});
			event.preventDefault();
		} else { // 활성화가 안됨!
			swal("쪽지 전송 완료!",{
				icon : "success",
				buttons : {
					confirm : true,
				}
			});
		}
	}
	
	function friendsPopup(open) {
		  document.get
		  $("#modal").fadeIn(300);
		  $("." + open).fadeIn(300);
	}

	$("#modal, .close").on('click',function(){
		  $("#modal").fadeOut(300);
		  $(".modal-con").fadeOut(300);
	});
	
	function fCheck() {
		var DATA = "";
	      $('input:checkbox[name=checkbox]').each(function() {
	    	 if(DATA != ""){
		         if($(this).is(':checked')) DATA += ","+($(this).val());
	    	 } else {
		         if($(this).is(':checked')) DATA += ($(this).val());
	    	 }
	         console.log(DATA);
	      });
		/* var checkbox = document.getElementsByName("checkbox");
		for(var i = 0; i < checkbox.length; i++) {
			if(checkbox[i].checked == true) {
				alert('체크!');
			}
		console.log(checkbox);
		} */
		$('#addBtn').click(function() {
			$('#msg_to').val(DATA);
				  $("#modal").fadeOut(300);
				  $(".modal-con").fadeOut(300);
		});
	}
	</script>
</body>
</html>