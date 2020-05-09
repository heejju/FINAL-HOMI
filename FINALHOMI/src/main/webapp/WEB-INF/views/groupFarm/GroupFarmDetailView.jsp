<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	body{background-color: #fff6f0; font-family: 'Nanum Gothic', sans-serif;}
	#realMain{width:80%; height:auto; align:center; margin:0% auto; margin-top:5%;}
	
	/* 썸네일 */
	#postMain{background:white;}
	.thumbnailWrapper{width:100%; margin:0% auto;}
	.centered{width:100%; text-align:center;}
	.centered > img{width:70%; padding:5%;}
	
	/* 게시글 */
	.postWrapper{width:100%; margin:0% auto;}
	#title{font-size:3em; font-weight:bold; text-align:center;}
	#date{color:gray; text-align:right; margin:3%; margin-right:3%;}
	.border{border-bottom:1.2px solid gray; margin-bottom:3%;}
	#groupIntro{margin-left:3%; font-size:1.5em; font-weight:bold; margin:3%;}
	#contents{margin:0 5%; width:90%}
	#contents > p > img {width:auto}
	#groupInform{margin-left:3%; font-size:1.5em; font-weight:bold; margin:3%;}
	#informList{margin:0 5%;}
	#informList > li {padding:5px;}
	#personnelBtn{border-radius:10px; border:0px; background:powderblue; width:80px; height:25px; cursor:pointer;}
	#joinBtnArea{margin:0px auto; text-align:center; padding-bottom:3%;}
	#joinBtnArea input {border-radius:5px; border:0px; width:100px; height:40px; cursor:pointer;
						color:white; font-weight:bold; font-size:18px;}
	#enterBtn, #requestClassBtn, #cancleCloseBtn{background:#888c43;}
	#exeuntBtn, #closeBtn, #cancleClassBtn{background:#675141;}
			
	/* 버튼 */
	a{display:inline !important;}
	.buttonArea{float:right; margin:5% 0;}
	.buttonArea > button {border-radius:5px; border:0px;  width:80px; height:30px; 
							cursor:pointer; font-weight:bold; font-size:16px;}
	#list{background:lightgray; border-radius:5px; border:0px;  width:80px; height:35px; 
							cursor:pointer; font-weight:bold; font-size:15px;}
	#updateBtn{background:#888c43; color:white;border-radius:5px; border:0px;  width:80px; height:35px; 
							cursor:pointer; font-weight:bold; font-size:15px;}
	#deleteBtn{background:#675141; color:white;border-radius:5px; border:0px;  width:80px; height:35px; 
							cursor:pointer; font-weight:bold; font-size:15px;}
						
	/* 댓글 */
	#commentMain{min-height:130px; background-color: white; margin:10% auto;
				overflow:hidden; height:auto; padding:3% 6%; font-size: 16px;}
	#replyNickName{cursor: pointer; padding-left:5px;}
	.replyUpdate, .replyDelete{cursor: pointer; font-size: 15px;}
	.contentTR{display:inline-block; margin: 5px 0 15px 0; word-break:break-all; wrap:hard;}
	.contentTd{width:100%;}
	
		/* 작성 */
		.replyWriteWrapper{position:relative; width:100%; border: 1px solid #b3b3b3;}
		#profileArea{ height:20px; padding:11px 82px 8px 14px;}
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
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
</head>
<body>
	<header>
		<c:import url='../common/boardCommon.jsp'/>
		<script>
		 	$('#bName').text('동네');
		 	$('#bNameAfter').text('텃밭');
		 	
		 	$('#spanWrapper').click(function(){
		 		location.href="blist.gf";
		 	}).mouseover(function(){
		 		$(this).css('cursor','pointer');
		 	}).mouseout(function(){
		 		$(this).css('cursor','default');
		 	});
		</script>
	</header>
	
	<section>
		<div id="realMain">
			<div id="postMain">
				<form id="" method="POST">
				<div class="thumbnailWrapper">
					
					<div class="centered">
						<img id="thumbnailImg" alt="thumbnail" src="${ contextPath }/resources/uploadFiles/${ img.changeName }">
					</div>
					
					<!-- 썸네일 이미지 크기 조정 -->
					<script>
						var img = $("#thumbnail");
						
						if(img.height > img.width){
							img.css({"height":"70%", "width":"auto"});
						}
					</script>
				</div>
				
				<div class="postWrapper"> 
					<div id="title">${ gf.title}</div><br>
					<div id="date">${ gf.writeDate }</div>
					<div class="border"></div>
					<div id="groupIntro">모임소개</div>
					<div id="contents">
						<% pageContext.setAttribute("newLineChar", "\r\n"); %>
						${ fn:replace(gf.content, newLineChar, "<br>") }
					</div>
					<div class="border" style="width:50%; margin:3% auto;"></div>
					<div id="groupInform">상세정보</div>
					<ul id="informList">
						<li>지역 : ${ gf.location }</li>
						<li>인원 : 
							<b>
							<c:if test="${ gfaList.size() ne 0 }">
								<c:set var="loop_flag" value="true" />
								<c:forEach var="gfa" items="${ gfaList }" varStatus="status">
								    <c:if test="${ loop_flag }">
										<c:if test="${ gf.offerYN eq 'Y' && empty gf.teacher }">
											<span class="personnelCount">${ gfaList.size() }</span>
										</c:if>
										<c:if test="${ gf.offerYN eq 'Y' && !empty gf.teacher }">
										<%-- <c:if test="${fn:contains(gfa, 2)}">
										</c:if> --%>
											<span class="personnelCount"><c:out value="${ gfaList.size() - 1 }"/></span>
										</c:if>
							        	<c:set var="loop_flag" value="false" />
							    	</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${ gfaList.size() eq 0 }">
								<span class="personnelCount">0</span>
							</c:if>
							</b> 
								<c:url var="applicant" value="personnelList.gf">
									<c:param name="postNo" value="${ gf.postNo }"/>
									<c:param name="personnel" value="${ gfaList.size() }"/>
								</c:url>
							/ ${ gf.personnel }명 
							<button id="personnelBtn" type="button"
								onclick="window.open('${applicant}', 'personnelPOP', 'width=490, height=605, menubar=no, status=no, toolbar=no');">
								참여 인원
							</button>
							
						</li> 
						<li>기간 : ${ gf.startDate } ~ ${ gf.endDate }</li>
						<li>요일 : ${ gf.day }</li>
						<li>시간 : ${ gf.startHour } - ${ gf.endHour }</li>
						<li>강사 : 
							<c:if test="${ gf.offerYN eq 'Y' && empty gf.teacher }">
								<span id="teacher">구인중</span>
							</c:if>
							<c:if test="${ gf.offerYN eq 'Y' && !empty gf.teacher }">
								<c:forEach var="gfa" items="${ gfaList }">
									<c:if test="${ gfa.mKind == 2 }">
										<span id="teacher">${ gfa.nickName }</span>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${ gf.offerYN eq 'N'}">
								구인 안함
							</c:if>
						</li>
					</ul>
					<c:if test="${ (gf.offerYN eq 'N' && loginUser.mKind ne 2) 
								|| (gf.offerYN eq 'Y' && loginUser.mKind eq 2) }"> <!-- 강사를 구인 안하고 로그인한 회원이 강사회원이 아닐 때 -->
						<div class="border" style="width:50%; margin:3% auto;"></div>
					</c:if>
					<%-- ${ gf.closeYN eq 'N' && gf.personnel ne gfa.size() } --%>
					<div id="joinBtnArea">
						<!-- 작성자인 경우 -->
						<c:if test="${ loginUser.nickName eq gf.nickName }">
        						<input type="button" id="closeBtn" value="모임 마감" onclick="closeGroup();"/>
						</c:if>

						<!-- 작성자가 아닌 경우 -->
						<c:if test="${ loginUser.userId ne gf.writer }">
							<!-- 참가 인원이 없을 때 -->
							<c:if test="${ gfaList.size() eq 0}">
	         					<c:if test = "${ loginUser.mKind eq 1 }">
	         						<input type="button" id="enterBtn" value="모임 참가" onclick="enterGroup();"/>
								</c:if>
								<c:if test="${ gf.offerYN eq 'Y' && empty gf.teacher }">
		         					<c:if test = "${ loginUser.mKind eq 2 }">
		         						<input type="button" id="requestClassBtn" value="강의 신청" onclick="requestClass();"/>
										<!-- <button type="button" id="requestBtn" onclick="requestClass();">강의 신청</button> -->
									</c:if>
								</c:if>
							</c:if>
							
							<!-- New! -->
							<!-- 참가 인원이 있을 때 -->
							<c:if test="${ gfaList.size() ne 0 }">
								<c:set var="isId" value="false" />
								<c:set var="isIdAll" value="false" />
								<!-- 학생 -->
								<c:if test="${ loginUser.mKind eq 1 }">
									<c:forEach var="gfa" items="${ gfaList }">
										<!-- 참여자일 때 -->
										<c:if test="${ loginUser.userId eq gfa.userId }">
											<c:set var="isId" value="true"/>
											<c:set var="isIdAll" value="true"/>
										</c:if>
										<c:if test="${ isId }">
											<input type="button" id="exeuntBtn" value="모임 탈퇴" onclick="exeuntGroup();"/>
											<c:set var="isId" value="false"/>
										</c:if>
									</c:forEach>
									
									<!-- 참여자가 아닐 때 -->
									<c:if test="${ isIdAll eq false }">
										<c:choose>
											<c:when test="${ gf.offerYN eq 'N' && gfaList.size() ne gf.personnel}"><input type="button" id="enterBtn" value="모임 참가" onclick="enterGroup();"/></c:when>
											<c:when test="${ gf.offerYN eq 'Y' && empty gf.teacher && gfaList.size() ne gf.personnel }"><input type="button" id="enterBtn" value="모임 참가" onclick="enterGroup();"/></c:when>
											<c:when test="${ gf.offerYN eq 'Y' && !empty gf.teacher && gfaList.size() - 1 ne gf.personnel }"><input type="button" id="enterBtn" value="모임 참가" onclick="enterGroup();"/></c:when>
										</c:choose>
										<c:choose>
											<c:when test="${ gf.offerYN eq 'N' && gfaList.size() eq gf.personnel }"><div>모집 인원이 마감되었습니다</div></c:when>
											<c:when test="${ gf.offerYN eq 'Y' && empty gf.teacher && gfaList.size() eq gf.personnel }"><div>모집 인원이 마감되었습니다</div></c:when>
											<c:when test="${ gf.offerYN eq 'Y' && !empty gf.teacher && gfaList.size() - 1 eq gf.personnel }"><div>모집 인원이 마감되었습니다</div></c:when>
										</c:choose>
									</c:if>
								</c:if>
								
								<!-- 강사 -->
								<c:if test="${ loginUser.mKind eq 2 }">
									<c:if test="${ gf.offerYN eq 'Y' && empty gf.teacher }">
										<input type="button" id="requestClassBtn" value="강의 신청" onclick="requestClass();"/>
									</c:if>
									<c:if test="${ gf.offerYN eq 'Y' && !empty gf.teacher}">
										<c:forEach var="gfa" items="${ gfaList }">
											<!-- 참여자일 때 -->
											<c:if test="${ loginUser.userId eq gfa.userId }">
												<c:set var="isId" value="true"/>
												<c:set var="isIdAll" value="true"/>
											</c:if>
											<c:if test="${ isId }">
												<input type="button" id="cancleClassBtn" value="강의 취소" onclick="cancleClass();"/>
												<c:set var="isId" value="false"/>
											</c:if>
										</c:forEach>
									</c:if>
								</c:if>
							</c:if>
						</c:if>
						<c:if test="${ gf.closeYN eq 'Y'}">
							<div style="margin-top:10px;">마감된 모임입니다 </div><br>
							<!-- 작성자인 경우 -->
							<c:if test="${ loginUser.nickName eq gf.nickName }">
         						<input type="button" id="cancleCloseBtn" value="마감 취소" onclick="cancelClose();"/>
							</c:if>
						</c:if>
					</div>
				</div>

	        <!-- 모임 버튼 기능 -->
            <script>
               var personnelCount = ${ gfaList.size() };
               
               function enterGroup(){
                  var enter = confirm("모임에 참가하시겠습니까?");
                  
                  if(enter){
                     var page = ${ page };
                     var postNo = ${ gf.postNo };
                     var userId = "${ loginUser.userId }";
                     var mKind = ${ loginUser.mKind };
                     
                     $.ajax({
                        url: "enterGroup.gf",
                        type: "post",
                        data: {page:page, postNo:postNo, userId:userId, mKind:mKind},
                        success: function(data){
                           $('.personnelCount').text(Number($('.personnelCount').text()) + 1);
                           $('#enterBtn').attr("onclick","exeuntGroup();");
                           $('#enterBtn').val('모임 탈퇴');
                           $('#enterBtn').css('background', '#675141');
                           $('#enterBtn').attr('id', 'exeuntBtn');
                        }
                     });
                  }
               }
               
               function exeuntGroup(){
                  var enter = confirm("모임에 탈퇴하시겠습니까?");
                  
                  if(enter){
                     var page = ${page};
                     var postNo = ${gf.postNo};
                     var userId = "${ loginUser.userId }";
                     var mKind = ${ loginUser.mKind };
                     
                     
                     $.ajax({
                        url: "exeuntGroup.gf",
                        type: "post",
                        data: {page:page, postNo:postNo, userId:userId, mKind:mKind},
                        success: function(data){
                              $('.personnelCount').text(personnelCount-1);
                           
                           $('#exeuntBtn').attr("onclick","enterGroup();");
                           $('#exeuntBtn').val('모임 참가');
                           $('#exeuntBtn').css('background', '#888c43');
                           $('#exeuntBtn').attr('id', 'enterBtn');
                        }
                     });
                  }
               }
               
               function requestClass(){
               	   var enter = confirm("강의를 신청하시겠습니까?");
                      
                     if(enter){
                        var page = ${ page };
                        var postNo = ${ gf.postNo };
                        var userId = "${ loginUser.userId }";
                        var mKind = ${ loginUser.mKind };
                        var nickName = "${ loginUser.nickName }";
                        
                        $.ajax({
                           url: "requestClass.gf",
                           type: "post",
                           data: {page:page, postNo:postNo, userId:userId, mKind:mKind, nickName:nickName},
                           success: function(data){
                              $('#requestClassBtn').attr("onclick","cancleClass();");
                              $('#requestClassBtn').val('강의 취소');
                              $('#requestClassBtn').css('background', '#675141');
                              $('#requestClassBtn').attr('id', 'cancleClassBtn');
                           }
                        });
                     }
                  }
               
               function cancleClass(){
               	   var enter = confirm("강의를 취소하시겠습니까?");
                      
                      if(enter){
                         var page = ${ page };
                         var postNo = ${ gf.postNo };
                         var userId = "${ loginUser.userId }";
                         var mKind = ${ loginUser.mKind };
                         
                         $.ajax({
                            url: "cancleClass.gf",
                            type: "post",
                            data: {page:page, postNo:postNo, userId:userId, mKind:mKind},
                            success: function(data){
                               $('#cancleClassBtn').attr("onclick","requestClass();");
                               $('#cancleClassBtn').val('강의 신청');
                               $('#cancleClassBtn').css('background', '#888c43');
                               $('#cancleClassBtn').attr('id', 'requestClassBtn');
                            }
                         });
                      }
                  }
               
               
        	  /*  var gf = ${gf.personnel};
        	   var personnelCount;
        	   
        	   if('${ gf.teacher }' != ""){
            	   personnelCount = ${ gfaList.size() -1 };
               } else {
            	   personnelCount = ${ gfaList.size() };
               }
        	   
               if(gf == personnelCount && '${ gf.closeYN eq N }'){
            	  $(function(){
                	   var postNo = ${gf.postNo};
                	   var page = ${page};
                	   
               		   $.ajax({
                              url: "closeGroup.gf",
                              type: "post",
                              data: {page:page, postNo:postNo},
                              success: function(data){
                            	  swal("모집 인원이 모두 모여 모임이 자동으로 마감되었습니다", {
                            		  icon: "success",
                            		  button: true,
    	                		 }).then(확인 => {
                       			  //location.href='${refresh}';
                       		  	});
                              },
                              error: function(data){
                            	  swal("자동 마감에 실패했습니다",{
                            		  icon: "error",
                            		  button: false,
                            	  });
                              }
                       });
                   });
               } */
               
               
               
               function closeGroup(){
                  
                  var postNo = ${gf.postNo};
                  var page = ${page};
                  
                  swal({
            		  title: "모임을 마감하시겠습니까?",
            		  text: "해당 모임에 다른 회원들이 참가 할 수 없게 됩니다",
            		  icon: "warning",
            		  buttons: true,
            		  dangerMode: true,
            		  buttons: ["취소", "확인"]
            		})
            		.then(확인 => {
            		  if(확인){
            			 $.ajax({
                              url: "closeGroup.gf",
                              type: "post",
                              data: {page:page, postNo:postNo},
                              success: function(data){
                            	  swal("모임이 마감되었습니다", {
                            		  icon: "success",
                            		  button: true,
    	                		 }).then(확인 => {
                       			  location.href='${refresh}';
                       		  	});
                              },
                              error: function(data){
                            	  swal("마감에 실패했습니다",{
                            		  icon: "error",
                            		  button: false,
                            	  });
                              }
                           });
            		  } else {
            			  swal({title:"모집을 계속 진행합니다!"});
            		  }
                      
            		});
                  
               }
               
               function cancelClose(){
            	   var personnel = ${ gf.personnel };
            	   var postNo = ${gf.postNo};
                   var page = ${page};
                   
            	   var personnelCount;
                   if('${ gf.teacher }' != ""){
                	   personnelCount = ${ gfaList.size() -1 };
                   } else {
                	   personnelCount = ${ gfaList.size() };
                   }
            	   
                   if(personnel == personnelCount ){
            		   swal({
                           title: "마감 취소를 할 수 없습니다..! 😥",
                           text: "참여 인원이 찬 모임은 취소 할 수 없어요",
                           icon: "error",
            		   })
            	   } else {
            		   swal({
	                		  title: "모임 마감을 취소하시겠습니까?",
	                		  text: "해당 모임에 다른 회원들이 참가 할 수 있게 됩니다",
	                		  icon: "warning",
	                		  buttons: true,
	                		  dangerMode: true,
	                		  buttons: ["취소", "확인"]
	                		})
	                		.then(확인 => {
	                		  if(확인){
	                			 $.ajax({
	                                  url: "cancleClose.gf",
	                                  type: "post",
	                                  data: {page:page, postNo:postNo},
	                                  success: function(data){
	                                	  swal("모임을 진행합니다", {
	                                		  icon: "success",
	                                		  button: true,
	        	                		 }).then(확인 => {
                               			  location.href='${refresh}';
                               		  	});
	                                  },
	                                  error: function(data){
	                                	  swal("마감 취소에 실패했습니다",{
	                                		  icon: "error",
	                                		  button: false,
	                                	  });
	                                  }
	                               });
	                		  } else {
	                		    swal({title:"모집을 계속 진행합니다!"});
	                		  }
	                          
	                		});
            		   
            	   }
               }
            </script>

				<c:url var="refresh" value="bdetail.gf">
					<c:param name="postNo" value="${ gf.postNo }"/>
	                 <c:param name="page" value="${ page }"/>
				</c:url>				
			</form>
		</div>
			
			<!-- 버튼 모음 -->
			<c:url var="bmodify" value="modifyView.gf">
				<c:param name="postNo" value="${ gf.postNo }"/>
				<c:param name="page" value="${ page }"/>
			</c:url>
			<c:url var="bdelete" value="bdelete.gf">
				<c:param name="postNo" value="${ gf.postNo }"/>
				<c:param name="page" value="${ page }"/>
			</c:url>
			<c:url var="blist" value="blist.gf">
				<c:param name="page" value="${ page }"/>
			</c:url>
		
			<div class="buttonArea">
				<a href="blist.gf"><button id="list">목록으로</button></a>
				<c:if test="${ loginUser.nickName eq gf.nickName }">
					<button id="updateBtn">수정</button>
					<button id="deleteBtn">삭제</button>
				</c:if>
				
				
				<script>
					$('#updateBtn').click(function(){
						swal({
	                		  title: "글을 수정하시겠습니까?",
	                		  text: "모임 텃밭 수정에는 많은 제약이 있습니다.",
	                		  icon: "warning",
	                		  buttons: true,
	                		  dangerMode: true,
	                		  buttons: ["취소", "확인"]
	                		}).then(확인 => {
	                		  if(확인) {
	                		    swal("수정 페이지로 이동합니다", {
	                		      icon: "success",
	                		      button: false,
	                		    });
	                			  location.href='${ bmodify }';
	                		  }
	                		});
					});
					
					$('#deleteBtn').click(function(){
						swal({
	                		  title: "글을 삭제하시겠습니까?",
	                		  text: "모임이 끝나지 않았다면 참여 회원에게 정보가 제공되지 않습니다.",
	                		  icon: "warning",
	                		  buttons: true,
	                		  dangerMode: true,
	                		  buttons: ["취소", "확인"]
	                		}).then(확인 => {
	                		  if(확인) {
	                		    swal("게시글을 삭제합니다.", {
	                		      icon: "success",
	                		      button: false,
	                		    });
	                			  location.href='${ bdelete }';
	                		  }
	                		});
					});
				</script>
			</div>
			
			<div class="border" style="margin:3% auto;"></div>
			
			<!-- 댓글 작성 -->
			<div id = "commentMain">
				<div id= "replyTable" style="width:100%; height:auto; position:relative;">
					<table style="text-align:left;" id="replyList">
						<thead>
							<tr>
								<td colspan=2 style="padding-bottom:20px;"><b>댓글</b><span id="rCount"></span></td>
							</tr>
						</thead>
						<tbody>
							<%-- <tr style="">
								<td rowspan="2"><img alt="댓글" src="${ contextPath }/resources/images/almond.png" style="width:auto; height:10%; padding:5px;"></td>
								<td>
									<span style="font-weight: bold;">작성자</span>&nbsp; &nbsp; 
									<span style="font-size: 15px; color: rgb(190, 190, 190);">2020-02-25</span>&nbsp; &nbsp; 
									<span><input type="hidden" value='댓글번호'><span class="replyUpdate">수정</span>&nbsp;|&nbsp;<span class="replyDelete">삭제</span></span>
								</td>
							</tr>
							<tr>
								<td>
									<span>내용내용내용</span>
								</td>
							</tr> --%>
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
							<textarea id="rContent" rows="6" cols="130" placeholder="주제와 무관한 댓글, 악플은 삭제될 수 있습니다."></textarea>
						</div>
						<div id="writeCount"><span id="count">0</span>/300</div>
					</div>
					<div id="uploadArea">
						<button id="replyBtn">등록</button>
					</div>
				</div>
			</div>
		</div>
	
	</section>

	<script>
	
	// 미니 마이페이지 연결
	function miniMypage(e){
		var userId = $(e).children().eq(0).val();
		window.open('userInfo.fo?userId='+ userId + '&page=1','window팝업','width=600, height=702, menubar=no, status=no, toolbar=no');
	
	}

	
	// 댓글 리스트 불러오기
		function getReplyList(){
			var postNo = ${ gf.postNo };
			
			$.ajax({
				url: "rList.gf",
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
							//$rWriter = $('<span style="font-weight:bold;" onclick="window.open(\'location.href=userId=\'+data[i].rWriter+\'&page=1\', \'window팝업\', \'width=600, height=702\').text(decodeURIComponent(data[i].rNickName));
							$rWriteDate = $('<span style="font-size: 15px; color: rgb(190, 190, 190);">').text(data[i].rWriteDate);
							
							$rMoDel = $('<span>').html('<input type="hidden" value=' + data[i].rNo + '><span class="replyUpdate">수정</span> | <span class="replyDelete">삭제</span>');
							//$rModify = $('<span class="replyUpdate" onclick="replyUpdate(' + data[i].rNo + ', \''+decodeURIComponent(data[i].rContent.replace(/\+/g, " ")) + '\'' + ')">').text('수정');
							//$rModify = $('<input type="hidden" id="rNo" value=' + data[i].rNo + '/><span class="replyUpdate"').text('수정');
							//$rDelete = $('<span class="replyDelete">').text('삭제');
							
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
								/* $td.append("&nbsp;|&nbsp;");
								$td.append($rDelete); */
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
	
 		$(function() {
			getReplyList();
			
			var repeat = 
			setInterval(function() {
				if($('#rModifyContent')==""){
					getReplyList();
				} else {
					clearInterval(repeat);
				}
			}, 1000);
			
		});
		
		// 댓글 카운트
		$(function(){
			$('#rContent').keyup(function(){
				var inputLength = $(this).val().length;
				$('#count').html('<b>'+inputLength+'<b>');
				
				if(inputLength > 300){
					$('#count').css('color', 'red');
					//$('#replyBtn').attr('disabled', 'true');
				} else {
					$('#count').css('color', 'gray');
					//$('#replyBtn').attr('disabled', 'false');
				};
			});
		});
		
		//댓글 등록
		$('#replyBtn').on('click', function() {
			// addReply.bo 로 넘어가도록 ==> 댓글 내용, 게시글 번호를 꼭 가져가야함
			var rContent = $('#rContent').val();
			var refPno = ${gf.postNo};
			
			if(rContent.length = 0) { //내용이 없을 경우에 alert 후 아래 이벤트 실행 안되게 return
				alert('내용을 입력해주세요');
				return;
			} else if(rContent.length > 300){
				alert('300자 미만으로 작성해주세요');
				return;
			}
			
			$.ajax({
				url: "addReply.gf",
				data: {rContent:rContent, refPno:refPno},
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
						//$('#replyBtn').attr('disabled', 'true');
					} else {
						$('#rModifyCount').css('color', 'gray');
						//$('#replyBtn').attr('disabled', 'false');
					};
				});
			});
		    
		});
		
		
		//댓글 수정
		function replyUpdate(rNo){
		    var rContent = $('#rModifyContent').val();
		    
		    if(rContent.length = 0) { //내용이 없을 경우에 alert 후 아래 이벤트 실행 안되게 return
				alert('내용을 입력해주세요');
				return;
			} else if(rContent.length > 300){
				alert('300자 미만으로 작성해주세요');
				return;
			}
		    
		    $.ajax({
		        url : 'updateReply.gf',
		        type : 'post',
		        data : {'rContent' : rContent, 'rNo' : rNo},
		        success : function(data){
		        	getReplyList();
		        }
		    });
		}
		
		// 댓글 삭제
		$(document).on('click', '.replyDelete', function(){
			var rNo = $(this).parent().children().eq(0).val();
			console.log(rNo);
			if(confirm('댓글을 삭제하시겠습니까?')) {
				$.ajax({
			        url : 'deleteReply.gf',
			        type : 'post',
			        data : {'rNo' : rNo},
			        success : function(data){
			        	getReplyList();
			        }
			    });
			}
		});

	</script>
</body>
</html>