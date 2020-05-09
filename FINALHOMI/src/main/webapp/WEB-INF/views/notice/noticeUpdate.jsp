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
section{width:80%; height:100%; margin:0 auto;}

/* 버튼 */
.buttonG{width:120px; background-color:#888c43; color:#fff; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}
.buttonB{width:120px; background-color:#675141; color:#fff; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}
.buttonGray{width:120px; background-color:lightgray; color:#000; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}
.button{margin-top:20px; margin-bottom:3%;}

/* 제목 */
.title{margin:5% auto; width:1000px;}
.title>#titleText2{padding:8px; border:1px solid #7f7f7f; width:100%; font-size:50px; margin-bottmon:20px;}

/* 내용 */
.content{width:1000px; margin:5% auto;}
textarea{margin:0 auto; height:500px; border:1px solid #7f7f7f; resize:none; padding:10px; }

/* 상단 고정 */
.check{margin-bottom:20px; width:100%;}
input[type="checkbox"]{width:18px; height:18px; display: inline-block; float:left; margin-right:10px;}
.check > label{display:inline-block; float:left; margin-top:3px;}


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
	
	<form action="nupdate.no" method="post">
		<input type="hidden" name="page" value="${ page }">
		<input type="hidden" name="post_no" value="${ notice.post_no }">
		<section>
			<!-- 공지사항 제목 -->
			<div class="title" align="center">
				<div class="check">
					<input id="fix" type="checkbox" value="${ notice.post_fix }" name="post_fix" onchange="fixCheck12()"><label>게시글 상단 고정</label>
					<script>
						$(function(){
							var fixCheck = $("#fix").val();
							if(fixCheck == 'Y'){
								$("#fix")[0].checked = true;
							} else if(fixCheck == 'N'){
								$("#fix")[0].checked = false;
							}
							console.log($("#fix").val());
						});
						
						
						function fixCheck12(){
							console.log($("#fix").val());
							
							if($("#fix")[0].checked){
								$("#fix").val("Y");
							} else {
								$("#fix").val("N");
							}
							console.log($("#fix")[0].checked);
							console.log($("#fix").val());
						}
						
					</script>
					<div class="clear-both"></div>
					
				</div>
				<input type="text" id="titleText2" name="title" style="font-style: italic" value="${ notice.title }" onkeyup="changeFont();">
			</div>
			
			<!-- 공지사항 내용 -->
			<div class="content">
				<textarea name="content" id="summernote"></textarea>
			</div>
			
			<!-- 하단 버튼 -->
			<div align="center" class="button">
				<input type="submit" class="buttonG" value="수정하기" onclick="checkForm();">
				<c:url var="nlist" value="nlist.no">
					<c:param name="page" value="${ page }"/>
				</c:url>
				<button class="buttonGray" onclick="location.href='${ nlist }'">목록으로</button>
			</div>
		</section>
	</form>
	
	<script>
		var markupStr = '${ notice.content}';
		
		$(document).ready(function() {
		     $('#summernote').summernote({
		             height: 500,                 // set editor height
		    	 	 lang: 'ko-KR',
		             toolbar: [
		     		    ['style', ['style']],
		     		    ['font', ['bold', 'italic', 'underline', 'clear']],
		     		    ['fontname', ['fontname']],
		     		    ['color', ['color']],
		     		    ['para', ['ul', 'ol', 'paragraph']],
		     		    ['height', ['height']],
		     		    ['insert', ['link', 'hr']],
		     		  ]
		     }).summernote('code', markupStr); // 안에 이미 써있는 내용 넣기
		});
		
		/* 제목에 내용이 들어갈 경우 폰트 기울기 변경 */
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