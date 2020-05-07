<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">
<title>#취미 텃밭</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
</style>
</head>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<body>
	<jsp:include page="WEB-INF/views/common/boardCommon.jsp"/>
	<script>
    	$('#subHeader').hide();
	</script>
</body>
</html>