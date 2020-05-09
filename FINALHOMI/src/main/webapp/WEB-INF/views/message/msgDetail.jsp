<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	#title{text-align: center; border-bottom: 1px solid gray; color: #888c43;}
	
	#msgInsertForm{width: 100%; border-bottom: 1px solid gray; border-collapse: collapse;}
	
	#btnArea{text-align: center; padding: 10px;}
	.buttonO{width:100px; background-color:orange; color:#fff; border:none; padding:5px 0; text-align:center; font-size:16px; cursor:pointer; border-radius:5px;}
	.buttonG{width:100px; background-color:rgb(120, 120, 120); color:#fff; border:none; padding:5px 0; text-align:center; font-size:16px; cursor:pointer; border-radius:5px;}
	
	#goDetail{position: relative; left: 28%; width:200px; background-color:#888c43; color:#fff; border:none; padding:10px; text-align:center; font-size:20px; cursor:pointer; border-radius:5px;}
	#logo{width:110px; height:auto; vertical-align:middle;}
</style>
</head>
<body style="background: #fff6f0;">
<c:url var="get" value="msgList.msg"/>
	<c:url var="sent" value="sentMsgList.msg"/>
	<c:url var="delete" value="delegeMsg.msg"/>
	<c:url var="write" value="insertForm.msg"/>
	<c:url var="detail" value="detail.msg"/>
	
	<div>
		<div id="title"><h2># 쪽지</h2></div>
			<table id="msgInsertForm">
				<tr style="border-bottom: 1px solid gray;">
					<th style="width: 100px; padding: 5px; line-height: 20px;">제목</th>
					<td><input id="msgTitle" type="hidden" value="${message.msg_title}" style="width: 95%; border: 0; font-size: 13px;">${message.msg_title}</td>
				</tr>
				<tr style="border-bottom: 1px solid gray;">
					<c:if test="${loginUser.nickName == message.msg_to}">
						<c:url var="userInfo" value="userInfofo.mp">
							<c:param name="userId" value="${ message.msg_from }"/>
						</c:url>
						<th style="width: 100px; padding: 5px;">보낸사람</th>
						<td><input type="hidden" value="${message.msg_from}" style="width: 90%; border: 0; font-size: 13px;"><a href="${ userInfo }">${message.msg_from}</a></td>
					</c:if>
					<c:if test="${loginUser.nickName == message.msg_from}">
						<c:url var="userInfo" value="userInfofo.mp">
							<c:param name="userId" value="${ message.msg_to }"/>
						</c:url>
						<th style="width: 100px; padding: 5px;">받는사람</th>
						<td><input type="hidden" value="${message.msg_to}" style="width: 90%; border: 0; font-size: 13px;"><a href="${ userInfo }">${message.msg_to}</a></td>
					</c:if>
				</tr>
				<tr>
					<td colspan="2"><p style="height: 300px; overflow: hidden; margin: 15px;">${message.msg_content}</p></td>
				</tr>
			</table>
			
			<div id="btnArea">
				<c:if test="${loginUser.nickName == message.msg_to}">
					<button class="buttonO" onclick="location.href='${write}?nick=${message.msg_from}'">답장하기</button>
				</c:if>
				<button class="buttonG" onclick="location.href='${get}'">쪽지함</button>
			</div>
	</div>
	
	<script>
		$(function(){
			$('#logo').attr('src','${ contextPath }/resources/images/Logo.png');
		})
	</script>
</body>
</html>