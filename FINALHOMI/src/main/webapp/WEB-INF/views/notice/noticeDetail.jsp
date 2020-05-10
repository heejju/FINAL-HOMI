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
section{width:70%; height:100%; margin:0 auto;}

/* 컨테이너 */
div.container{width:80%; height:80%; background-color:#fff; align:center; border:1px solid #fff; border-radius:1px; margin: 7% auto;}

/* 버튼 */
.buttonG{width:120px; background-color:#888c43; color:#fff; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}
.buttonB{width:120px; background-color:#675141; color:#fff; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}
.buttonGray{width:120px; background-color:lightgray; color:#000; border:none; padding:15px 0; text-align:center; font-size:18px; margin:4px; cursor:pointer; border-radius:5px;}

/* 제목 */
.title-box{width:80%; margin:80px auto;}
.title-box > div{float:left;}
.num{font-weight:bold; margin-left:1%;}
.title{width:60%; font-size:16pt; margin-left:5%;}
.count{color:#7f7f7f; font-size:12pt; display: inline-block; margin-left:1%;}
.date{color:#7f7f7f; font-size:12pt; display: inline-block; margin-left:3%;}
.title-line{width:100%; height:2px; background:#ccc; margin: 20px 0;}

/* 작성자 */
.writer-box{width:80%; margin:20px auto;}
.writer-box > div{float:left; text-align:center;}
.writer-title{font-size:13pt; margin-left:73%;}
.writer{font-size:13pt;}
img{width:6%;height:6%;}

/* 내용 */
.content{margin:25% 13%; width:70%; height:100%; min-height:300px; resize:none; padding:10px; border:none; font-size:12pt; line-height:25px;}
.button{margin-top:20px; margin-bottom:3%;}


</style>
</head>
<body>
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
	<!-- swal 선언 -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<section>
		<div class="container">
			<!-- 공지사항 제목 -->
			<div class="title-box">
				<div class="num">No. ${ notice.post_no }</div>
				<div class="title">${ notice.title }</div>
				<div class="count">조회수 ${ notice.view_count }</div>
				<div class="date">|&nbsp;&nbsp;&nbsp; ${ notice.write_date }</div>
				<div class="clear-both"></div>
				<div class="title-line"></div>
			</div>
			
			<div class="writer-box">
				<div class="writer-title">작성자
					<img src="${ contextPath }/resources/images/admin.png">
					<c:if test="${ notice.writer eq 'admin' }">
						관리자(admin)
					</c:if>
				</div>
				<div class="clear-both"></div>
			</div>
			
			<!-- 공지사항 내용 -->
			<div class="content">
				${ notice.content }
			</div>
			
			<c:url var="nupView" value="nupView.no">
				<c:param name="post_no" value="${ notice.post_no }"/>
				<c:param name="page" value="${ page }"/>
			</c:url>
			<c:url var="ndelete" value="ndelete.no">
				<c:param name="post_no" value="${ notice.post_no }"/>
			</c:url>
			<c:url var="nlist" value="nlist.no">
				<c:param name="page" value="${ page }"/>
			</c:url>
			
			<!-- 하단 버튼 -->
				<div align="center" class="button">
				<c:if test="${ loginUser.userId eq notice.writer }">
					<button class="buttonG" onclick="location.href='${ nupView }'">수정하기</button>
					<button class="buttonGray" onclick="ndelete();">삭제하기</button>
				</c:if>
					<button class="buttonB" onclick="location.href='${ nlist }'">목록으로</button>
				</div>
		</div>
	</section>
	
	<script>
		function ndelete(){
			swal("정말 삭제하시겠습니까?",{
				icon : "warning",
				buttons : ["취소", "확인"]
			}).then((result) => { 
				if(result) {
					location.href='${ ndelete }';
				}
			});
		}
	</script>
</body>
</html>