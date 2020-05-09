<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<style>
	.qTable{overflow:hidden; width:100%; margin:0 auto; padding: 5px; font-size: 18px; border: 1px solid rgb(200,200,200); border-radius: 10px; background: white;}
	.qTable th{height:30px; color: rgb(103,81,65);}
	.qTable td{ text-align: left;}
	
	.buttonG{width:80px; background-color:#888c43; color:#fff; border:none; padding:7px 0; text-align:center; font-size:20px; margin:4px; cursor:pointer; border-radius:5px;}
	.buttonB{width:80px; background-color: #675141; color:#fff; border:none; padding:7px 0; text-align:center; font-size:20px; margin:4px; cursor:pointer; border-radius:5px;}
	.buttonO{width:70px; height: 70px; background-color: orange; color:#fff; border:none; padding:5px 0; text-align:center; font-size:20px; margin:4px; cursor:pointer; border-radius:5px;}

	.outer{
		width:60%; min-height:50px; padding-bottom: 50px; margin: 5% auto;
	}
	
	.detailTable{margin: auto; text-align: center; width: 95%;}
	
	table{border-collapse: unset !important; border-spacing: none !important;}
	
</style>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:import url='../common/boardCommon.jsp'/>
	<div class="outer">
		<div style="width: 100%;">
			<div>
				<!-- 답변완료, 수정, 삭제 버튼 -->
				<div class="utilArea" style="position: relative; left: 60px;">
					<c:if test="${ loginUser.mKind == 0}">
						<c:if test="${question.report_yn eq 'N' }">
							<input type="checkbox" id="report_yn" name="report_yn"> 답변완료 처리하기
						</c:if>
						<c:if test="${question.report_yn eq 'Y' }">
							<input type="checkbox" id="report_yn" name="report_yn" checked disabled> 답변완료 처리하기
						</c:if>
					</c:if>
				</div>
			</div>
			<div style="clear:both;">
			<div>
			<table class="qTable"> <!-- 글 정보(글번호, 제목, 작성자, 게시일) -->
				<tr>
					<th>No.</th><td>${ question.post_no }</td>
					<th>제목</th><td style="width: 250px;">${ question.title }</td>
					<th>작성자</th>
						<td>
							<c:url var="userInfo" value="userInfo.fo">
								<c:param name="nickName" value="${ question.writer }"/>
								<c:param name="page" value="1"/>
							</c:url>
							<span style="cursor: pointer;"onclick="window.open('${ userInfo }','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');">${ question.writer }</span>
						</td>
					<th>게시일</th><td>${ question.modify_date }</td>
				</tr>
			</table>
			<div style="padding: 10px;"></div>
			<table class="qTable" style="min-height: 200px;"> <!-- 글 내용 -->
				<tr style="vertical-align: top;">
					<td>
						${ question.content }
					</td>
				</tr>
			</table>
				<div style="margin-top: 1.5%;">
					<c:if test="${ loginUser.nickName == question.writer || loginUser.mKind == 0}"> <!-- 운영자이거나 글쓴이의 경우에만 보이는 버튼 -->
						<c:url var="edit" value="qupdateView.qu">
							<c:param name="post_no" value="${question.post_no}" />
							<c:param name="page" value="${page}" />
						</c:url>
						
						<c:if test="${loginUser.nickName == question.writer}"> <!-- 글쓴이의 경우에만 보이는 버튼 -->
							<button onclick="location.href='${edit}'" class="buttonG" style="float: right; position: relative; right: 110px;">수정</button>
							<button onclick="deletethis();" class="buttonB" style="float: right; position: relative; right: -80px;">삭제</button>
						</c:if>
						<c:if test="${loginUser.nickName != question.writer}"> <!-- 운영자의 경우에만 보이는 버튼 -->
							<button onclick="deletethis();" class="buttonB" style="float: right; position: relative; right: 20px;">삭제</button>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
		<div style="padding: 20px;"></div>
		<div>
			<div class="commentList" style="text-align: left; font-size: 15px;">
			</div>
			<!-- 댓글 출력 부분 -->
			<table class="detailTable" id="rtb" style="text-align: left; font-size: 15px;">
					<tbody>
					</tbody>
			</table>
			<div style="padding: 10px;"></div>
			<!-- 댓글 -->
			<table class="detailTable" style="text-align: left;">
				<c:if test="${ loginUser != null}">
					<tr>
						<td>
							<textarea id="replyBox" cols=95 style="width: 97%; font-size: 17px; border: 1px solid rgb(220, 220, 220); height: 70px; resize: none;"></textarea>
						</td>
						<td>
							<button class="buttonO" id="replySubmit">등록</button>
						</td>
					</tr>
				</c:if>
			</table>
		</div>
	</div>
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
		
		// 게시글 삭제
		function deletethis() {
			var post_no = ${question.post_no};
			var page = ${page};
			swal("정말 삭제하시겠습니까?",{
				icon : "warning",
				buttons : ["취소", "확인"]
			}).then((YES) => {
				if(YES) {
					location.href='qdelete.qu?post_no='+post_no+'&page'+page;
				} else {
					return;
				}
			});
		};
		
		
		// 답변 완료 버튼
		$('#report_yn').on('click', function() {
			var post_no = ${question.post_no};
			
			$.ajax({
				url: "reportCng.qu",
				data: {post_no:post_no},
				success: function(data) {
					swal("답변이 완료되었습니다.",{
						icon : "success",
						buttons : {확인: true}
					});
					$('#report_yn').attr('disabled', true);
				},
				error: function(data) {
					alert("아니 나한테 왜그러는데");
				}
			});
		});
		
		// 리플 가져오기
		$(function() {
			getReplyList();
		});
		
		// 리플 등록
		$('#replySubmit').on('click', function() {
			var post_no = ${question.post_no}
			var rContent = $('#replyBox').val();
			if(rContent.length <= 0) { //내용이 없을 경우에 alert 후 아래 이벤트 실행 안되게 return
				swal("내용을 입력해주세요!",{
					icon : "warning",
					buttons : {
						확인 : true
					}
				});
				return;
			}
			$.ajax({
				url: "addReply.qu",
				data: {post_no:post_no, rContent:rContent},
				success: function(data) {
			// 등록 이후에는 textArea에 있는 내용 지워주기
					$('#replyBox').val("");
			// 등록 이후에는 getReplyList() 호출해서 댓글창 새로고침
					getReplyList();
				}
			});
			
		});
		
		// 댓글 리스트 불러오기
		function getReplyList() {
			var post_no = ${question.post_no};
			
			$.ajax({
				url: "rList.qu",
				data: {post_no:post_no},
				dataType: 'json',
				success: function(data) {
					$tableBody = $('#rtb tbody');
					$tableBody.html('');
					
					var $rNo;
					var $id;
					var $tr;
					var $rWriter;
					var $rContent;
					var $rmodifyDate;
					
					if(data.length > 0) {
						for(var i in data) {
							// 지금 로그인 한 아이디
							$id = '${loginUser.userId}';
							
							// 리플 객체 정보
							$rNo = data[i].rNo;
							$rWriter = data[i].rWriter;
							$rNickName = decodeURIComponent(data[i].rNickName.replace(/\+/g, ' '));
							$rCon = decodeURIComponent(data[i].rContent.replace(/\+/g, ' '));
							$rmodifyDate = data[i].rmodifyDate;
							
							// 리플 담을 곳
							var rp = '';
							
							if($id == data[i].rWriter) {
								rp += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
								rp += '<div><img src="${contextPath }/resources/uploadFiles/' + data[i].changeName + '" style="width: 30px;></div>'
				                rp += '<div class="commentInfo'+data[i].rNo+'">'+'<span style="font-size: 19px; font-weight: bold;">'+decodeURIComponent(data[i].rNickName.replace(/\+/g, ' '))+'</span>';
				                rp += '&nbsp;&nbsp;<span>'+data[i].rmodifyDate+'</span>';
				                rp += '&nbsp;&nbsp;<a style="display: inline; font-size: 14px; cursor: pointer;" onclick="commentUpdate('+data[i].rNo+',\''+decodeURIComponent(data[i].rContent.replace(/\+/g, ' '))+'\');"> 수정 </a>';
				                rp += '&nbsp;<a style="display: inline; font-size: 14px; cursor: pointer;" onclick="commentDelete('+data[i].rNo+');"> 삭제 </a> </div>';
				                rp += '<div class="commentContent'+data[i].rNo+'"> <p>'+decodeURIComponent(data[i].rContent.replace(/\+/g, ' ')) +'</p>';
				                rp += '</div></div>';

							} else {
								rp += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
								rp += '<div><img src="${contextPath }/resources/uploadFiles/' + data[i].changeName + '" style="width: 30px;></div>'
				                rp += '<div class="commentInfo'+data[i].rNo+'">'+'<span style="font-size: 19px; font-weight: bold; cursor: pointer;" onclick="miniMypage(this);">'+decodeURIComponent(data[i].rNickName.replace(/\+/g, ' '))+'</span>';
				                rp += '&nbsp;&nbsp;<span>'+data[i].rmodifyDate+'</span>';
				                rp += '<div class="commentContent'+data[i].rNo+'"> <p>'+decodeURIComponent(data[i].rContent.replace(/\+/g, ' ')) +'</p>';
				                rp += '</div></div>';
							}
							
							$tableBody.append(rp);
						} 
					} else {
						$tr = $('<tr>');
						$rContent = $('<td colspan=3>').text('등록된 댓글이 없습니다.');
						
						$tr.append($rContent);
						$tableBody.append($tr);
					}
				}
			})
		}
		// 미니 마이페이지 연결
		function miniMypage(e){
			var userId = $(e).text();
			window.open('userInfo.fo?nickName='+ userId + '&page=1','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');
		
		}
		
		// 댓글 수정 폼 나오도록
		function commentUpdate(rNo, content){
		    var a ='';
		    
		    a += '<div>';
		    a += '<textarea id="upReplyBox" name="content_'+rNo+'" cols=95 style="width: 85%; font-size: 17px; border: 1px solid rgb(220, 220, 220); height: 70px; resize: none;">'+content+'</textarea>';
		    a += '<button class="buttonG" style="width: 50px; float: right; bottom: 30px;" type="button" onclick="commentUpdateProc('+rNo+');">수정</button>';
		    a += '</div>';
		    
		    $('.commentContent'+rNo).html(a);
		    
		}
		
		//댓글 수정
		function commentUpdateProc(rNo){
		    var rContent = $('[name=content_'+rNo+']').val();
		    
		    if(rContent.length <= 0) { //내용이 없을 경우에 alert 후 아래 이벤트 실행 안되게 return
		    	swal("내용을 입력해주세요!",{
					icon : "warning",
					buttons : {
						확인 : true
					}
				});
				return;
			}
		    
		    $.ajax({
		        url : 'updateReply.qu',
		        type : 'post',
		        data : {'rContent' : rContent, 'rNo' : rNo},
		        success : function(data){
		            	getReplyList();//댓글 수정후 목록 출력 
		        }
		    });
		}

		//댓글 삭제 
		function commentDelete(rNo){
			swal("정말 삭제하시겠습니까?",{
				icon : "warning",
				buttons : ["취소", "확인"]
			}).then((YES) => {
				if(YES) {
				    $.ajax({
				        url : 'deleteReply.qu',
				        type : 'post',
				        data : {'rNo':rNo},
				        success : function(data){
				            	getReplyList(); //댓글 삭제후 목록 출력 
				        }
				    });
				} else {
					return;
				}
			});
		}

	</script>
</body>
</html>