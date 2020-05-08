<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
	<h1 align="center">${ message }</h1>
	<c:set var="referUrl" value="${ header.referer }" />
	<div align="center">
		<button onclick="location.href='${referUrl}'">이전 페이지</button>&nbsp;&nbsp;
		<button onclick="location.href='${contextPath}'">홈으로</button>
	</div>
</body>
</html>