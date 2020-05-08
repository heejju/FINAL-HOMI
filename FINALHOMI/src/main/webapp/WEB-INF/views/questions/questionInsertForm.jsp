<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<title>#취미텃밭</title>
<style>
	.buttonG{width:120px; background-color:#888c43; color:#fff; border:none; padding:15px 0; text-align:center; font-size:20px; margin:4px; cursor:pointer; border-radius:5px;}
	.outer{
		width:70%; min-height:50px; padding-bottom: 50px;
		margin-left:auto; margin:auto; margin-top:50px; margin-bottom: 50px; 
	}
	#inputTitle{padding:7px; border:1px solid #7f7f7f; width:100%; font-size:40px; margin-bottmon:10px;}
</style>
</head>
<body style="background:#fff6f0;">
<c:import url='../common/boardCommon.jsp'/>
	<div class="outer">
		<form action="qinsert.qu" method="post">
			<div style="margin: 0 auto; width: 100%;">
				<!-- 제목 -->
					<input id="inputTitle" type="text" name="title" placeholder="제목을 입력해주세요" style="font-style: italic" onkeyup="changeFont();">
					<input type="hidden" name="writer" readonly value="${ loginUser.userId }">
			<div style=" width: 100%; border-top: 1px solid rgb(200, 200, 200); padding: 10px;"></div>
				<!-- 내용 -->
					<textarea name="content" id="summernote"></textarea>
			</div>
			<!-- 작성완료 버튼 -->
			<div style="text-align: center;">
				<button class="buttonG" onclick="checkForm();">게시글 등록</button>
			</div>
		</form>
	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$('#bName').text(' 1:1 ');
		$('#bName').css('cursor', 'pointer');
		$('#bNameAfter').text('문의게시판');
		$('#bNameAfter').css('cursor', 'pointer');
		
		$('#bName').click(function() {
			location.href="qlist.qu";
		});
		$('#bNameAfter').click(function() {
			location.href="qlist.qu";
		});
	/* 썸머노트 관련 설정 */
	$(document).ready(function() {
	     $('#summernote').summernote({
	             height: 500,                 // set editor height
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
	
	/* 제목에 내용이 들어갈 경우 폰트 기울기 변경 */
	function changeFont() {
		if($('#inputTitle').val() != "") {
			$('#inputTitle').css({"font-style":"normal"});
		} else {
			$('#inputTitle').css({"font-style":"italic"});
		}
	}
	
	function checkForm() {
		if($('#inputTitle').val() == "") {
			swal("제목을 써주세요!",{
				icon : "info",
				buttons : {
					확인 : true,
				}
			});
			event.preventDefault();
			$('#inputTitle').focus();
		}
	}
	
	</script>
</body>
</html>