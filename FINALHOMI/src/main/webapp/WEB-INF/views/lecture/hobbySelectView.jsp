<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	body{background:#fff6f0; font-family: 'Nanum Gothic', sans-serif;}
	.green{color: rgb(136, 140, 67);}
	.brown{color: rgb(103, 81, 65);}
	
	#logoWrapper{margin:5% 0 3% 0;}
	#logo{width:30%; height:auto; vertical-align:middle;}
	#hobbyListSpan{font-size:52px; font-weight:bold; vertical-align:middle; padding:0 3%;}
	
	div{
		text-align: center; vertical-align: middle;
	}
	table{
		width: 1030px; margin: 0 auto; ce
	}
	table , tr , td{
		border: 2px solid #e0e0e0; border-radius: 5px; background: white;
		border-spacing: 5px; text-align: center; vertical-align: middle; display:inline-block;
	}
	tr{ padding:8px 0; border:none; width:90%;}
	td{
		font-size: 17px; font-weight: bold; cursor: pointer; line-height:35px; float:left; 
	}
	td.hobbyNo{
		width: 4%; height:4%; background: #A5C3CF; color: white /* rgb(103, 81, 65) */;
		border-radius:80%; border:none; 
	}
	td.hobbyName{
		width: 15%; height:4%; border:none; color: #888; text-align:left; padding-left:5px;
	}
	p{
		font-size: 16px; color: #f35212; font-weight: bolder;
	}
	input{
		border: none; border-radius: 5px; padding: 2px 5px 2px 5px; text-align:center; vertical-align:middle;
		font-size: 20px; font-weight: bold; height: 40px; box-sizing: border-box;
	}
	input.hobbyNo{
		width: 110px; text-align:center; padding:0 auto;
	}
	input.hobbyName{
		width: 350px; 
	}
	button{
		width:100px; height:40px; box-sizing: border-box; border: 0px; font-size: 18px; font-weight: bold; vertical-align: middle;
		color: white; border-radius: 5px; cursor:pointer; margin: 0 3px;
	}
	button.hobbyNo{
		background: #888;
	}
	button.insert{
		background: rgb(136, 140, 67);
	}
	button.delete{
		background: rgb(103, 81, 65);
	}

</style>
</head>
<body>
	<section>
		<div id="logoWrapper">
			<img id="logo" src="${ contextPath }/resources/images/Logo.png">
			<span id="hobbyListSpan">취미 목록</span>
		</div>
		<div>
			<table id="hobbyTable">
				<c:set var="i" value="1"/>
				<c:forEach items="${ hList }" var="hobby">
					<c:if test="${ i mod 5 eq 1 }">
						<tr>
							<td onclick="clickHobbyNo(this);" class="hobbyNo">${ hobby.hobbyNo }</td>
							<td onclick="clickHobbyName(this);" class="hobbyName">${ hobby.hobbyName }</td>
					</c:if>
					<c:if test="${ i mod 5 eq 2 }">
							<td onclick="clickHobbyNo(this);" class="hobbyNo">${ hobby.hobbyNo }</td>
							<td onclick="clickHobbyName(this);" class="hobbyName">${ hobby.hobbyName }</td>
					</c:if>
					<c:if test="${ i mod 5 eq 3 }">
							<td onclick="clickHobbyNo(this);" class="hobbyNo">${ hobby.hobbyNo }</td>
							<td onclick="clickHobbyName(this);" class="hobbyName">${ hobby.hobbyName }</td>
					</c:if>
					<c:if test="${ i mod 5 eq 4 }">
							<td onclick="clickHobbyNo(this);" class="hobbyNo">${ hobby.hobbyNo }</td>
							<td onclick="clickHobbyName(this);" class="hobbyName">${ hobby.hobbyName }</td>
					</c:if>
					<c:if test="${ i mod 5 eq 0 }">
							<td onclick="clickHobbyNo(this);" class="hobbyNo">${ hobby.hobbyNo }</td>
							<td onclick="clickHobbyName(this);" class="hobbyName">${ hobby.hobbyName }</td>
						</tr>
					</c:if>
					<c:set var="i" value="${ i + 1 }"/>
				</c:forEach>
			</table>
		</div>
	</section>
	
	<script>
		//table에서 취미 번호 클릭시 해당 값 input에 넣기
		function clickHobbyNo(e){
			var hobbyNo = $(e)[0].innerText;
			var hobbyName = $(e).next()[0].innerText;
			$("#hobbyNo",opener.document).val(hobbyNo);
			$("#hobbyName",opener.document).val(hobbyName);
			window.close();
		}
		//table에서 취미 이름 클릭시 해당 값 input에 넣기
		function clickHobbyName(e){
			var hobbyNo = $(e).prev()[0].innerText;
			var hobbyName = $(e)[0].innerText;
			$("#hobbyNo",opener.document).val(hobbyNo);
			$("#hobbyName",opener.document).val(hobbyName);
			window.close();
		}
	</script>
	
	
	
	
	
</body>
</html>