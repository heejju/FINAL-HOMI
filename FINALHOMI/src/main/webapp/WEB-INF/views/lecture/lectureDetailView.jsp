<%@page import="java.util.Arrays"%>
<%@page import="org.springframework.context.annotation.Import"%>
<%@page import="finalProject.homis.hobbyFarm.lecture.model.vo.LectureBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
	LectureBoard lb = (LectureBoard)request.getAttribute("lb");
	request.setAttribute("lb", lb);
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@include file="../common/boardCommon.jsp"%>
<script>
	$('#bName').text('모종');
	$('#bNameAfter').text('구하기');
	
	
	$('#bName').click(function(){
 		location.href="list.lec";
 	}).mouseover(function(){
 		$(this).css('cursor','pointer');
 	});
	$('#bNameAfter').click(function(){
 		location.href="list.lec";
 	}).mouseover(function(){
 		$(this).css('cursor','pointer');
 	});
</script>
<style>
	body, html, div{padding: 0; margin:0;}
	br{line-height: 30%;}
	hr, h3{margin: 10px 0 10px 0;}
	p{margin-bottom: 10px; margin-top: 10px;}
	hr{color: gray;}
	.green{color: rgb(136, 140, 67);}
	.brown{color: rgb(103, 81, 65);}
	
	
	div.body{
		margin: 0 10px 0 3%;
		text-align: center; border: 0px solid lightgray; display: inline-block;
		width: 70%; height: auto; background: rgb(255,246,240); padding-bottom: 50px;
	}
	
	div.body2{
		border: 1px solid lightgray; margin: 0 auto;
		width: 100%; height: auto; background: white; padding-bottom: 50px;
	}
	
	div.header{
		padding-top: 20px;
		width: 100%;
	}
	
	div.header > div.imgDiv{
		width : 50%; height: 250px; border: 0px solid black; box-sizing:border-box;
		float: left; margin: 0 3% 0 3%;
	}
	
	div.header > div.imgDiv > img{
		width : auto; height: 100%; border: 0px solid black; box-sizing:border-box;
	}
	div.header > div.firstInfo{
		width: 40%; height: 250px; text-align: left;
		float: left; font-size: 22px;
	}
	button{
		border: 0px; background: white;
	}
	button:hover{
		border: 0px; background: white; cursor: pointer;
	}
	div.modifyButton{
		width: 100%; text-align: right; margin: 15px auto 15px auto;
	}
	button.modifyButton {
		padding: 5px 15px 5px 15px; color: white; border-radius: 5px;
		background: rgb(136, 140, 67);
	}
	button.deleteButton {
		padding: 5px 15px 5px 15px; color: white; border-radius: 5px;
		background: rgb(103, 81, 65);
	}
	button.listButton {
		padding: 5px 15px 5px 15px; color: white; border-radius: 5px;
		background: lightgray; 
	}
	button.modifyButton:hover{
		background: rgba(136, 140, 67, 0.65);
	}
	button.deleteButton:hover{
		background: rgba(103, 81, 65, 0.65);
	}
	button.listButton:hover{
		background: rgba(211, 211, 211, 0.65);
	}
	
	div.commentDiv{
		width: 80%; height: auto; margin: 10px auto 15px auto; background: white;
		padding: 20px; 
	}
	
	
	/* applyDIv ---------------------------------- */
	
	div.applyDiv{
		position: absolute;
		display: inline-block; background: rgb(255,246,240); width: 20%; height: auto;
		padding: 20px; border: 0px solid lightgray; text-align: center;
	}
	div.applyDiv > form > div.applyBody{
		background: white; width: 100%; height: 100%; border: 1px solid lightgray; padding: 0 0 20px 0;
	}
	
	select{
		height: 35px; border: 3px solid rgb(103, 81, 65); width: 130px; text-align: center; font-weight: bold; font-size: 18px;
		color: rgb(136, 140, 67); font-weight: bold; border-radius: 5px; text-align-last: center;
		
	}
	div.ableTime{
		height:30px; display: none;
		vertical-align: middle;
	}
	b.ableTime{
		cursor:pointer; border-bottom: 2px solid rgb(103, 81, 65);
	}
	textarea.replyContent{
		height: 60px; width: 70%; resize: none; font-size: 17px; border: 2px solid rgb(103, 81, 65); box-sizing: border-box;
		border-radius: 5px; padding: 5px; display: inline-block; vertical-align: middle;
	}
	button.replyInsertBtn{
		height: 50px; vertical-align: middle; width: 70px; font-size: 20px; font-weight: bold;
		background: rgb(136, 140, 67); border-radius: 5px; margin: 0px; color: white;
	}
	button.replyInsertBtn:hover{
		background: rgba(136, 140, 67, 0.65);
	}
	
	.replyWriteWrapper{position:relative; width:100%; border: 1px solid #b3b3b3;}
	#commentMain{min-height:130px; background-color: white; margin:10% auto;
				overflow:hidden; height:auto; padding:3% 6%; font-size: 16px;}
	.replyUpdate{cursor: pointer; font-size: 15px;}
	.replyDelete{cursor: pointer; font-size: 15px;}
	.contentTR{display:inline-block; margin: 5px 0 15px 0; word-break:break-all; wrap:hard;}
	.contentTd{width:100%;}
	
		/* 작성 */
		.replyWriteWrapper{position:relative; width:100%; border: 1px solid #b3b3b3;}
		#profileArea{ height:20px; padding:11px 82px 8px 14px; text-align: left;}
		#loginUser{position:absolute; top:11px; right:82px; bottom:0; left:15px; height:23px; 
						font-size:14px; font-weight:bold; color:#888c43; text-overflow:ellipsis;}
	
		#writeArea{overflow: hidden; max-width: 100%; padding-bottom: 8px;}
		#writeAreaInner{position: relative; padding: 0 15px;}
	/* 	#rContent{position:absolute; resize:none; float:left; width:100%; heigth:56px; display:block; */
		#rContent, #rModifyContent{display: block; overflow-x:hidden; overflow-y:auto; position:relative; font-size:15px;
					z-index: 1; float: left; width: 100%; height:80px; padding: 6px 0 0; margin:0; padding-right: 16px;
	    			border: none; line-height: 18px; -webkit-appearance: none; vertical-align: top;
	    			resize: none; -webkit-box-sizing: border-box; box-sizing: border-box;}
		#writeCount{float:right; padding:6px 20px 3px 0; color:gray;}
	  
	#uploadArea{height: 43px; border-top: 1px solid #ededed;}
	#replyBtn, #modifyBtn{width:80px; height:43px; background-color: #f39c12; margin:0px; color:white; margin-left:15px; float:right;
				font-size:18px; font-weight:bold; border:0px; position: absolute; right: -1px; z-index: 10; cursor:pointer;}
	#modifyBtn{background:#888c43; border-radius:0px;}
</style>
</head>
<body style="overflow-x: hidden; line-height: normal; min-width: 1100px;"><!-- div.body에 인라인블럭하니까 생겨서 없애줌 -->

	<br><br><br>
	<div class="body">
		
		<br><br><br>
		<form action="updateView.lec" id=thisForm>
			<input type="hidden" name="postNo" value='${ lb.postNo }'>
			<input type="hidden" name="sido" value="${ sido }">
			<input type="hidden" name="gugun" value="${ gugun }">
			<input type="hidden" name="searchTag" value="${ searchTag }">
			<input type="hidden" name="searchValue" value="${ searchValue }">
			<input type="hidden" name="hobbyNo" value="${ hobbyNo }">
			<input type="hidden" name="currentPage" value="${ currentPage }">
		
		<div class="body2">
			<div class="header">
				<div class="imgDiv">
					<img src="${pageContext.request.contextPath}/resources/uploadFiles/${ lb.changeName }">
				</div>
				<div class="firstInfo">
					<p>
					<label class="green"><b>By.</b></label>
					<label class="brown"><b>${ lb.nickName }</b></label>
					</p>
					<p>
					<b style="font-size: 18px;">${ lb.title }</b>
					</p>
					
					<p>
					<b class="green">수강료: </b><b class="brown">${ String.format('%,d',lb.otTuition * lb.otAllTime) }원</b>
					</p>
					
					
					<div style="text-align: left;">
						<div style="display: inline-block;">
						<i class="far fa-clock" style="color: rgb(136, 140, 67); width: 40px; height: 40px;"></i>
						</div>
						<div style="display: inline-block;">
							<b class="brown">총 ${ lb.otAllTime }회(${ lb.otTime }시간/회)<br>${ String.format('%,d',lb.otTuition) }원/회</b>
						</div>
					</div>
					
					<p>
					<b class="green">수강 대상: </b>
					<b class="brown">
						<c:if test='${ lb.learner.equals("low") }'>초급자</c:if>
						<c:if test='${ lb.learner.equals("middle") }'>중급자</c:if>
						<c:if test='${ lb.learner.equals("higt") }'>고급자</c:if>
					</b>
					</p>
				</div>
				
				<br clear="all">
				
				<hr>
			</div>
			
			<br>
			
			<div style="width: 70%; margin: 0 auto;">
				<b class="green" style="font-size: 35px;">수업소개</b><br><br>
				<hr>
				<div style="text-align: left;">${ lb.content }</div>
				
				<br>
				
				<b class="green" style="font-size: 35px;">강사정보</b><br><br>
				<hr>
				<div style="text-align: left;">${ lb.teacherInfo }</div>
				
				
				
			</div><!--  -->
		</div><!-- body2 -->
		
		<div class="modifyButton">
			<c:if test="${ lb.writer.equals(loginUser.userId) }">
				<button type="submit" class="modifyButton"><b>수정</b></button>
				<button type="button" class="deleteButton" onclick="deleteLecture();">삭제</button>
			</c:if>
			<button type="button" class="listButton" onclick="toList();"><b>목록</b></button>
		</div>
		<script>
			function toList(){
				$("#thisForm").attr("action", "list.lec");
				$("#thisForm").submit();	
			}
			
			async function deleteLecture(){
				var isTrue;
				await swal("정말 삭제하시겠습니까?",{
					icon : "warning",
					buttons : ["취소","확인"]
				}).then((YES) => {
					if(YES) {
						isTrue = true;
					} else {
						isTrue = false;
					}
				});
				 if(isTrue){
					$("#thisForm").attr("action", "deleteBoard.lec");
					$("#thisForm").submit();
				}
			};
		</script>
		</form>
		<hr>
		<!-- 연진누나댓글 -->
		<div id = "commentMain">
				<div id= "replyTable" style="width:100%; height:auto; position:relative;">
					<table style="text-align:left;" id="replyList">
						<thead>
							<tr>
								<td colspan=2 style="padding-bottom:20px;"><b>댓글</b><span id="rCount"></span></td>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					<br>
				</div>
				
				<div class="replyWriteWrapper">
					<div id="profileArea">
						<span id="loginUser">${ loginUser.nickName }</span>
					</div>
					<div id="writeArea">
						<div id="writeAreaInner">
							<textarea id="rContent" rows="6" cols="130"></textarea>
						</div>
						<div id="writeCount"><span id="count">0</span>/300</div>
					</div>
					<div id="uploadArea">
						<button type="button" id="replyBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
		<script>
		//댓글 스크립트
		// 댓글 리스트 불러오기
		function getReplyList(){
			var postNo = ${ lb.postNo};
			$.ajax({
				url: "rList.lec",
				data : {postNo:postNo},
				dataType: 'json',
				success: function(data) {
					$tableBody = $('#replyList tbody');
					$tableBody.html('');
					
					var $tr;
					var $rWriter;
					var $rContent;
					var $rCreateDate;
					
					$('#rCount').text('(' + data.length + ')');
					
					if(data.length > 0) {
						for(var i in data) {
							var rWriter = data[i].rWriter;
							var rNo = data[i].rNo;
							
							$id = '${loginUser.userId}';
							
							$tr = $('<tr>');
							$tr2 = $('<tr class="contentTR">');
							$td = $('<td>');
							$td2 = $('<td class="contentTd" id="rContent' + data[i].rNo +'">');
							
							$rImg = $('<img src="${ contextPath }/resources/uploadFiles/' + data[i].changeName + '" style="width:auto; height:6%; vertical-align:middle;">');
							$rWriter = $('<span style="font-weight:bold;" id="replyNickName" onclick="miniMypage(this);">').html(decodeURIComponent(data[i].rNickName)+"<input type='hidden' value='" + data[i].rWriter+"'>");
							$rWriteDate = $('<span style="font-size: 15px; color: rgb(190, 190, 190);">').text(data[i].rWriteDate);
							
							$rMoDel = $('<span>').html('<input type="hidden" value=' + data[i].rNo + '><span class="replyUpdate">수정</span> | <span class="replyDelete" onclick="replyDelete(this);">삭제</span>');
							
							$rContent = $('<span>').text(decodeURIComponent(data[i].rContent.replace(/\+/g, ' ')));
							
							$tr.append($td);
							$td.append($rImg);
							$tr.append($td);
							$td.append($rWriter);
							$td.append("&nbsp;&nbsp");
							$td.append($rWriteDate);
							$td.append("&nbsp;&nbsp");
							
							if($id == data[i].rWriter || $id == "admin") {
								$td.append($rMoDel);
							}
							
							$tr2.append($td2);
							$td2.append($rContent);
							
							$tableBody.append($tr);
							$tableBody.append($tr2);
						}
					} else {
						$tr = $('<tr>');
						$rContent = $('<td colspan=3>').text('등록된 댓글이 없습니다.');
						
						$tr.append($rContent);
						$tableBody.append($tr);
					}
				}
			});
		}
		
		//미니 마이페이지 연결 연진누나 감사합니다....
		function miniMypage(e){
			var userId = $(e).children().eq(0).val();
			window.open('userInfo.fo?userId='+ userId + '&page=1','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');
		
		}
		
		$(function() {
			getReplyList();
			/* setInterval(function() {
				getReplyList();
			}, 1000); */
		});
		
		// 댓글 카운트
		$(function(){
			$('#rContent').keyup(function(){
				var inputLength = $(this).val().length;
				$('#count').html('<b>'+inputLength+'<b>');
				
				if(inputLength > 300){
					$('#count').css('color', 'red');
				} else {
					$('#count').css('color', 'gray');
				};
			});
		});
		
		//댓글 등록
		$("#replyBtn").click(function() {
			// addReply.bo 로 넘어가도록 ==> 댓글 내용, 게시글 번호를 꼭 가져가야함
			var replyContent = $('#rContent').val();
			var postNo = ${lb.postNo};
			var rWriter = '${loginUser.userId}';
			if("${ loginUser == null }" == "true"){
				swal("로그인을 해주세요.",{
					icon : "warning",
					buttons : "확인"
				});
				return;
			}
			
			if(replyContent.length == 0) { //내용이 없을 경우에 alert 후 아래 이벤트 실행 안되게 return
				swal("내용을 입력해주세요.",{
					icon : "warning",
					buttons : "확인"
				});
				return;
			} else if(replyContent.length > 300){
				swal("300자 미만으로 작성해주세요.",{
					icon : "warning",
					buttons : "확인"
				});
				return;
			}
			$.ajax({
				url: "insertReply.lec",
				data: {replyContent:replyContent, postNo:postNo, rWriter:rWriter},
				success: function(data) {
					// 댓글창 새로고침
					getReplyList();
					
					// 등록 이후 textArea 초기화
					$('#rContent').text(""); //안됨
					$('#rContent').html(""); //안됨
					$('#rContent').val("");
					$('#count').text("0");
					$('#count').html("0");
					$('#count').val("0");
				}
			});
			
		});
		
		// 댓글 수정창
		$(document).on('click', '.replyUpdate', function(){
			var a ='';
			
			var rNo = $(this).prev().val();
			var content = $(this).parent().parent().parent().next().children().children().text();
			var contentTd = $(this).parent().parent().parent().next().children();
			
		    a += '<div class="replyWriteWrapper">';
		    a += '<div id="writeArea">';
		    a += '<div id="writeAreaInner">';
		    a += '<textarea id="rModifyContent" rows="6" cols="130">' + content + '</textarea></div>';
		    a += '<div id="writeCount"><span id="rModifyCount">' + content.length +'</span>/300</div></div>';
		    a += '<div id="uploadArea"><button id="modifyBtn" onclick="replyUpdate('+ rNo + ')">수정</button></div>';
		    a += '</div>';

		    $(contentTd).html(a);

		    // 수정 카운트
			$(function(){
				$('#rModifyContent').keyup(function(){
					var modifyLength = $(this).val().length;
					$('#rModifyCount').html('<b>'+modifyLength+'<b>');
					
					if(modifyLength > 300){
						$('#rModifyCount').css('color', 'red');
					} else {
						$('#rModifyCount').css('color', 'gray');
					};
				});
			});
		    
		});
		
		
		//댓글 수정
		function replyUpdate(rNo){
		    var rContent = $('#rModifyContent').val();
		    if(rContent.length = 0) { //내용이 없을 경우에 alert 후 아래 이벤트 실행 안되게 return
				swal("내용을 입력해주세요.",{
					icon : "warning",
					buttons : "확인"
				});
				return;
			} else if(rContent.length > 300){
				swal("300자 미만으로 작성해주세요.",{
					icon : "warning",
					buttons : "확인"
				});
				return;
			}
		    
		    $.ajax({
		        url : 'updateReply.lec',
		        type : 'post',
		        data : {'rContent' : rContent, 'rNo' : rNo},
		        success : function(data){
		        	getReplyList();
		        }
		    });
		}
		
		// 댓글 삭제
		 
		async function replyDelete(e){
			var rNo = $(e).parent().children().eq(0).val();
			await swal("댓글을 삭제하시겠습니까?",{
				icon : "warning",
				buttons : ["취소","확인"]
			}).then((YES) => {
				if(YES) {
					$.ajax({
				        url : 'deleteReply.lec',
				        type : 'post',
				        data : {'rNo' : rNo},
				        success : function(data){
				        	getReplyList();
				        }
				    });
				}
			});
		}
		</script>
		
	</div><!-- body -->
	
	<div class="applyDiv">
	<form action="applyLecture.lec" id="thisFrom2" method="post">
	<!-- 목록으로 돌아갈수있게하기위한 정보 -->
	<input type="hidden" name="searchSido" value="${ sido }">
	<input type="hidden" name="searchGugun" value="${ gugun }">
	<input type="hidden" name="searchTag" value="${ searchTag }">
	<input type="hidden" name="searchValue" value="${ searchValue }">
	<input type="hidden" name="searchHobbyNo" value="${ hobbyNo }">
	<input type="hidden" name="currentPage" value="${ currentPage }">
	
	<input type='hidden' name="userId" id="userId" value="${ loginUser.userId }">
	<input type="hidden" name="postNo" value="${ lb.postNo }">
		<div class="applyBody">
			<h3 class="brown">가능한 장소</h3>
			<div style="vertical-align: middle;">
				<div style="display: inline-block; vertical-align: middle;">
					<select class="selectSido" onchange="changeGugun();" name="selectSido">
						<c:forEach items="${ ablePlace }" var="able">
							<option value="${ able[0] }">${ able[0] } </option>
						</c:forEach>
					</select>
					<br>
					<select id="gugun" name="selectGugun" onchange="changeDong();">
						<option value="">구/군 선택</option>
					</select>
					<br>
					<select id="dong" name="selectDong">
						<option value="">동 선택</option>
					</select>
				</div>
				<c:set var="i" value="0"/>
				<c:forEach items="${ ablePlace }" var="able">
					<input type="hidden" id="ablePlace${ i }" value="${ Arrays.toString(able) }">
					<c:set var='i' value="${ i + 1 }"/>
				</c:forEach>
			</div>
			<hr style="margin: 10px 0 10px 0;">
			<h3 class="green">가능한 시간</h3>
			<div>
				<c:if test="${ ableTime[0].equals('AllDone') }">
					<div class="ableTime" hidden="">
						<label class="brown"><b class="ableTime" onclick="checkTime(this);">가능한 시간이 없습니다.</b></label>
					</div>
				</c:if>
				<c:if test="${ !ableTime[0].equals('AllDone') }">
					<c:forEach items="${ ableTime }" var="able">
						<div class="ableTime" hidden="">
							<input class="ableTime" type="radio" name="ableTime" value="${ able }" style="vertical-align: middle; margin: 0;">
							<label class="brown"><b class="ableTime" onclick="checkTime(this);">${ able }</b></label>
						</div>
					</c:forEach>
				</c:if>
				<label><b id="moreTime" class="green" style="cursor:pointer;" onclick="ableTimePlus(this);">--------- 더보기 ---------</b></label>
			</div>
			<script>
				// 가능한시간 text 클릭해도 radio버튼 클릭되게
				function checkTime(e){
					$(e).parent().prev()[0].checked = true;
				}
				// 가능한 시간 처음에는 3개만 보이기
				var ableTimeCount = 3;
				$(function(){
					if($("div[class='ableTime']").length < 4){
						$("#moreTime")[0].innerText = "--------- 끝 ---------";
					}
					
					for(var i = 0; i < ableTimeCount; i++){
						$("div[class='ableTime']").eq(i).attr("style","display:block");
					}
				});
				// 가능한 시간 5개추가로 보이게 만들기
				function ableTimePlus(e){
					ableTimeCount += 4;
					if(ableTimeCount >= $("div[class='ableTime']").length){
						$(e)[0].innerText = "--------- 끝 ---------";
					}
					for(var i = 0; i < ableTimeCount; i++){
						$("div[class='ableTime']").eq(i).attr("style","display:block");
					}
				}
				
				async function applyLecture(){
					if($("#userId").val() == ""){
						await swal("로그인 후 이용가능한 서비스입니다.",{
							icon : "warning",
							buttons : "확인"
						});
						return;
					}
					
					var isChecked = false;
					for(var i = 0; i < $("input[class='ableTime']").length; i++){
						if($("input[class='ableTime']").eq(i)[0].checked){
							if($("input[class='ableTime']").eq(i).val() == '가능한 시간이 없습니다.'){
								return;
							}
							isChecked = true;
						}
					}
					if(!isChecked){
						swal("원하는 시간을 선택해주세요.",{
							icon : "warning",
							buttons : "확인"
						});
						return;
					}
					
					if($("#userId").val() == '${ lb.writer }'){
						swal("자신이 쓴글은 신청할수 없습니다.",{
							icon : "warning",
							buttons : "확인"
						});
						return;
					}
					var isTrue = true;
					var checkBeforeApply = ${checkBeforeApply};
					if(checkBeforeApply != 0){
						await swal("이전에 들은 강의입니다. 한번 더 신청하시겠습니까?",{
							icon : "warning",
							buttons : ["취소","확인"]
						}).then((YES) => {
							if(YES) {
							} else {
								isTrue = false;
							}
						});
					}
					if(isTrue){
						$("#thisFrom2").submit();
					}
					return;
				}
			</script>
			
		</div>
		
		<div style="margin: 10px 0 10px 0">
			<button type='button' class="deleteButton" onclick="message2();">쪽지 보내기</button><!-- 쪽지보내기 연결 비로그인시 alert로그인해주세요 -->
			<button type='button' class="modifyButton" onclick="applyLecture();">신청하기</button>
		</div>
	</form>
	</div>
	<script>
		//메세지 보내기
		function message2(){
			//팝업설정하기
			if("${lb.writer}" == "${loginUser.userId}"){
				swal("자신에게는 쪽지를 보낼수 없습니다.",{
					icon : "warning",
					buttons : "확인"
				});
				return;
			}
			var url = "insertForm.msg?nick=${lb.nickName}";
			var option = "resizable = no, scrollbars = no, width = 500, height = 550";
			window.open(url, "쪽지함", option);
		}
	</script>
	
	<script>
		var b_box=0;
		var boxheight=0;
		var plus =0;

		$(function(){
			$('.option','.region').click(function(){
				if($('#region').hasClass('on')){
					boxheight=($(this).find('.box').height()+40);
					if($(this).hasClass('on')){
						$(this).removeClass('on');
						b_box=0;
					}else{
						$(this).siblings().removeClass('on');
						plus = boxheight;
						plus -= b_box;
						$(this).addClass('on');
						b_box=boxheight;
					}
				}
				else{
					boxheight=($(this).find('.box').height()+40);
					if($(this).hasClass('on')){;
						$( "#region" ).animate({ "height": "-="+boxheight+"px" }, "slow" );
						$(this).removeClass('on');
						b_box=0;
					}else{
						$(this).siblings().removeClass('on');
						plus = boxheight;
						plus -= b_box;
						$( "#region" ).animate({ "height": "+="+plus+"px" }, "slow" );
						$(this).addClass('on');
						b_box=boxheight;
					}
				}
			});

		});
		function more(event){
			var elm = event;

			if($('#region').hasClass('on')){
				$('#region').scrollTop(0);
				$('#region').addClass('on').height('130px');
				$('#region').removeClass('on').find('.option').removeClass('on');
				b_box=0;
				$(elm).removeClass('on').find('span').html("다른 일정 더보기");
			}
			else{
				$('#region').addClass('on').height('300px');
				$(elm).addClass('on').find('span').html("다른 일정 숨기기");
			}
		}
	</script>
	
	
	
	
</body>
	<script>
		$(document).ready(function(){
			// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
			var floatPosition = parseInt($("div.applyDiv").css('top'));
			// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

			$(window).scroll(function() {
				
				// 현재 스크롤 위치를 가져온다.
				var scrollTop = $(window).scrollTop();
				var newPositionVal = scrollTop + 100;
				var newPosition;
				if(newPositionVal > $("div[class='body2']")[0].offsetTop){
					newPosition = scrollTop + 100 + "px";
				} else {
					newPosition =$("div[class='body2']")[0].offsetTop+"px";
				}

				$("div.applyDiv").stop().animate({
					"top" : newPosition
				}, 500);

			}).scroll();
		});
	</script>

	<script>
		// servlet에서 받은 ${ ablePalce }를 담을 2차원 배열이다.
		var ablePlaceArr = new Array();
		$(function(){
			var place = new Array();
			var sidoArr = new Array();

			//처음 시도는 c:foreach문을 통해서 전부 생기게 하고 거기서 만날떄 sidoArr에 없는 이름은 추가해서 // 다시 전부지우고 sidoArr안의 값을 넣는다
			for(var i = 0; i < $("select[class='selectSido']").children().length; i++){
				var isIn = true;
				var sido = $("select[class='selectSido']").children();
				
				for(var j = 0; j < sidoArr.length; j++){
					
					if(sidoArr[j] == sido.eq(i).val()){
						isIn = false;
					}
				}
				
				if(isIn){
					sidoArr.push(sido.eq(i).val());
				}
			}
			
			$("select[class='selectSido']").empty();
			var sidoVal = "";
			for(var i = 0; i < sidoArr.length; i++){
				sidoVal += "<option value='"+sidoArr[i]+"'>"+sidoArr[i]+"</option>";
			}
			$("select[class='selectSido']").append(sidoVal);
			
			
			
			var abless = new Array();
			abless.push($("input[id^='ablePlace']").eq(0).val().substring(1, $("input[id^='ablePlace']").eq(0).val().length - 1).split(", "));
			for(var i = 0; i < $("input[id^='ablePlace']").length; i++){
				ablePlaceArr[i] = $("input[id^='ablePlace']").eq(i).val().substring(1, $("input[id^='ablePlace']").eq(i).val().length - 1).split(", ");
			}
			changeGugun();
			changeDong();
		});
		// 시도 바뀌면 구군바뀜
		function changeGugun(){
			var sido = $("select[class='selectSido']").val();
			$("#gugun").empty();
			for(var i = 0; i < ablePlaceArr.length; i++){
				if(ablePlaceArr[i][0] == sido){
					var option = "<option value='"+ ablePlaceArr[i][1] +"'>"+ablePlaceArr[i][1]+"</option>";
					$("#gugun").append(option);
				}
			}
			changeDong();
		}
		// 구군 바뀌면 동 바뀜
		function changeDong(){
			var gugun = $("#gugun").val();
			$("#dong").empty();
			var option = "";
			for(var i = 0; i < ablePlaceArr.length; i++){
				if(ablePlaceArr[i][1] == gugun){
					for(var j = 2; j < ablePlaceArr[i].length; j++){
						option += "<option value='"+ ablePlaceArr[i][j] +"'>"+ablePlaceArr[i][j]+"</option>";
					}
					$("#dong").append(option);
				}
			}
			
		}
	</script>


















</html>