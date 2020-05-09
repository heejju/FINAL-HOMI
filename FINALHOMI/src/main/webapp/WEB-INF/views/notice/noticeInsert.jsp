<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- include libraries(jQuery, bootstrap) -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<title>#취미텃밭</title>
<style>
section{width:70%; height:100%; margin:0 auto;}

/* 버튼 */
.buttonG{width:120px; background-color:#888c43; color:#fff; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}
.buttonB{width:120px; background-color:#675141; color:#fff; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}
.buttonGray{width:120px; background-color:lightgray; color:#000; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}
.button{margin:20px auto;}

/* 제목 */
.title{margin:5% auto; width:1000px;}
.title>#titleText2{padding:7px; border:1px solid #7f7f7f; width:100%; font-size:40px; margin-bottmon:10px;}

/* 내용 */
.content{width:1000px; margin:2% auto;}
textarea{margin:0 auto; height:500px; border:1px solid #7f7f7f; resize:none; padding:10px; }



</style>
</head>
<body style="background:#fff6f0;">
	<c:import url='../common/boardCommon.jsp'/>
	<script>
		$('#bName').text('공지');
		$('#bNameAfter').text('사항');
		
		$('#bName').css('cursor', 'pointer');
		$('#bNameAfter').css('cursor', 'pointer');
		
		$('#bName').click(function() {
			location.href="nlist.no";
		});
		$('#bNameAfter').click(function() {
			location.href="nlist.no";
		});
	</script>
	<div class="outer">
		<form action="ninsert.no" method="post">
			<section>
				<!-- 공지사항 제목 -->
				<div class="title" align="center">
					<input type="text" id="titleText2" name="title" style="font-style: italic" placeholder="제목을 입력해주세요." onkeyup="changeFont();">
				</div>
				
				<!-- 작성자 -->
				<input type="hidden" name="writer" value="${ loginUser.userId }">
				
				<!-- 공지사항 내용 -->
				<div class="content">
					<textarea id="summernote" name="content"></textarea>
				</div>
				
				<!-- 하단 버튼 -->
				<div align="center" class="button">
					<input type="submit" value="글쓰기" class="buttonG" onclick="checkForm();">
					<input type="button" class="buttonGray" value="목록으로" onclick="location.href='nlist.no'">
				</div>
			</section>
		</form>
	</div>
	<script>
		/* 썸머노트 관련 설정 */
		$(document).ready(function() {
		     $('#summernote').summernote({
		             height: 600,                 // set editor height
		             toolbar: [
			     		    ['style', ['style']],
			     		    ['font', ['bold', 'italic', 'underline', 'clear']],
			     		    ['fontname', ['fontname']],
			     		    ['color', ['color']],
			     		    ['para', ['ul', 'ol', 'paragraph']],
			     		    ['height', ['height']],
			     		    ['insert', ['link', 'hr']],
			     		  ]
		     });
		});
	
		function changeFont() {
			if($('#titleText2').val() != "") {
				$('#titleText2').css({"font-style":"normal"});
			} else {
				$('#titleText2').css({"font-style":"italic"});
			}
		}
		
		function checkForm() {
			if($('#titleText2').val() == "") {
				alert('제목이 입력되지 않았어요!');
				event.preventDefault();
				$('#titleText2').focus();
			}
		}
	</script>
</body>
</html>