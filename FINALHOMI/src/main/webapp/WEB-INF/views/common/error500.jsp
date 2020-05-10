<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<style>
	#errorImg{width:auto; display:block; align:center; margin:0 auto;}
	#btnArea{margin:3% auto;}
	button{width:120px; height:50px; border:0px; border-radius:5px; font-size:20px; font-weight:bold; color:white;}
	button:hover{cursor:pointer;}
	#previousBtn{background:#888c43;}
	#homeBtn{background:#675141;}
</style>
</head>
<body>
	<img id="errorImg" src="${ contextPath }/resources/images/500_errorPage.png">
	<div id="btnArea" align="center">
		<button id="previousBtn" onclick="location.href='${referUrl}'">이전 페이지</button>&nbsp;&nbsp;&nbsp;
		<button id="homeBtn" onclick="location.href='${contextPath}'">홈으로</button>
	</div>
</body>
</html>