<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	.clear-both{clear:both;}
	div{margin:0; padding:0;}
	body{background-color: #fff6f0; font-family: 'Nanum Gothic', sans-serif; margin:0; padding:0;}
	#searchFilter{align:center; width:80%; height:8%; background-color:#e0e0e0; padding:8px; margin:0% auto;}
	.locationArea{align:center; width:20%; height:5%; background-color:white; padding:0.5%;
					border-radius:5px; display:inline-block; margin:0px auto;}
	#hobbyArea{align:center; width:20%; height:5%; background-color:white; padding:0.5%;
				border-radius:5px; display:inline-block; margin:0% auto;}
	.selectLocation, #hobbyName, #searchSelect
			{border-raidus:5px; width:100%; height:100%; padding:5px; margin:0px auto; border:0px;
			font-size:14px; font-family: 'Nanum Gothic', sans-serif; font-weight:bold;}
	#hobbyName{width:95%;}
	#nextIcon{width:5%; height:5%; vertical-align:middle;}
	#filterBtn{padding:1%; display:inline-block; background-color:#3498db; vertical-align:middle;
				border-radius:5px; border:0px; color:white; margin-left:3%;
				font-family: 'Nanum Gothic', sans-serif; font-weight:bold; font-size:17px;}
				
	/* 게시글 부분 */			
	.postArea{width:80%; margin:0px auto; margin-top:5%; overflow:hidden;}
	.postDetail{width:25%; max-heigth:20%; height:20%; background-color:white; font-weight:bold; text-align:center;
				 display:inline-block; float:left; overflow:hidden; margin:20px 4%;}
	.group_status{padding:5%; color:#888c43; text-align:center; margin:5% auto;}
	.group_status:after{content: ""; text-align:center; display: block; width:80%; border-bottom: 1.5px solid gray; margin:5% auto;}
	.title{height:15%; font-size:1.5em; text-align:center; margin-top:5%; padding:5px; 
		 	line-height:160%; vertical-align: middle;}
	.location{font-size:14px; padding:5%; color:gray; font-weight:normal;}
	.user{font-size:14px; font-weight:normal; float:right; padding:10%; text-align:right;}
	
	.thumbnailWrapper{width:100%; overflow: hidden;}
	.centered{width:100%; height:160px;}
	.centered > img{width:100%; height:160px;}
	.thumbnail{vertical-align:middle;}
	.time{color:white; background-color:RGBA(136,140,67,0.7); font-size:15px; padding:15px 5px; z-index:3;
		 position: relative; top:-46px; clear: both; }
	#writeBtn{margin:2% 10% 0 10%; background-color:#888c43; float:right; color:white; font-size:18px;
				border:0px; width:7%; padding:8px; border-radius:5px; font-weight:bold; font-family: 'Nanum Gothic', sans-serif;}
	
	/* 페이징 */
	/* a{display:inline !important;} */
	#paging{margin: auto; width: 400px;}
	#buttonTab > button {width:40px; height:40px; border-radius:5px; border:0px; background-color:white; font-size:16px; padding:5px;}
	.startBtn, .endBtn, #pageNum, #before, #next {width:40px; height:40px; border-radius:5px; border:0px; background-color:white; font-size:16px; padding:5px;}
	button:hover{cursor:pointer;}
	.startBtn:hover{font-wieght:bold; background:#675141; color:white}
	.endBtn:hover{font-wieght:bold; background:#675141; color:white}
	
	/* 검색 */
	.searchArea{text-align:center; margin:0 20px 20px 20px;}
	.selectArea{margin-top:0px; display:inline-block; border:0.5px solid lightgray;}
	.searchSelect{width: 80px; height:27px; border:1px solid lightgray; padding:5px;}
	.wordArea{width:250px; margin-top:10px; border:1px solid lightgray; background:#fff; 
				display:inline-block; vertical-align:bottom;}
	#searchValue{font-size:12px; width:195px; height:auto; padding:5px; margin:3px 0 0 5px; border: 0px; outline:none; float:left;}
	#searchBtn{width:40px; border: 0px; border-radius:0px; padding:5px; 
				background-color: #888c43; outline: none; float:right; color: #fff;}
</style>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"/>
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
	<form id="listForm" action="blist.gf" method="get">
		<input type=hidden name="page" id="currentPage" value="1">
		<!-- 필터 검색 부분 -->
		<div id="searchFilter">
			<label style="margin-left:3%; font-weight:bold; font-size:20px; margin-right:1%; margin-left:4%;">지역</label>
			<div class="locationArea">
				<select name="sido" class="selectLocation" id="sido" onchange="categoryChange()">
					<option value=''>시/도 선택</option>
					<option value='서울특별시'>서울특별시</option>
					<option value='경기도'>경기도</option>
					<option value='인천광역시'>인천광역시</option>
					<option value='강원도'>강원도</option>
					<option value='충청북도'>충청북도</option>
					<option value='충청남도'>충청남도</option>
					<option value='대전광역시'>대전광역시</option>
					<option value='세종특별자치시'>세종특별자치시</option>
					<option value='전라북도'>전라북도</option>
					<option value='전라남도'>전라남도</option>
					<option value='광주광역시'>광주광역시</option>
					<option value='대구광역시'>대구광역시</option>
					<option value='경상북도'>경상북도</option>
					<option value='경상남도'>경상남도</option>
					<option value='울산광역시'>울산광역시</option>
					<option value='부산광역시'>부산광역시</option>
					<option value='제주특별자치도'>제주특별자치도</option>
				</select>
			</div>
			
			
			<script>
				// 만약 처음으로 list에 온게 아니라 검색으로 다시 왔을 경우 검색시 사용한 도시를 자동으로 셀렉
				$(function(){
					var $select = $("select[name=sido]").children();
					
					for(var i = 0; i < $select.length; i++){
						if('${ selectedSido }' == $select.eq(i).val()){
							$select.eq(i).attr("selected", "selected");
						}
						
					}
					categoryChange();
				});
			</script>
			
			<img src="${ contextPath }/resources/images/nextIcon.png" id="nextIcon"/>
			<div class="locationArea" id="gugunArea" >
				<select name="gugun" class="selectLocation" id="gugun">
				</select>
			</div>
			<!-- selectedSido selectedgugun -->
			<label style="margin-left:3%; font-weight:bold; font-size:20px; margin-left:3%; margin-right:1%;">취미</label>
			<c:url var="hList" value="hList.gf"/>
			<div id="hobbyArea">
				<c:if test="${ selectedHobby eq null }">

	               <input type="hidden" name='hobby' id='hobby'>
	               <input onclick="toHBSelView();" class="hobbyName" type="text" id='hobbyName' value="" placeholder="취미선택" readonly>
	            </c:if>
	            <c:if test="${ selectedHobby eq 0 }">
	               <input type="hidden" name='hobby' id='hobby'>
	               <input onclick="toHBSelView();" class="hobbyName" type="text" id='hobbyName' value="" placeholder="취미선택" readonly>
	            </c:if>
	            <c:if test="${ selectedHobby ne null }">
	               <c:forEach var="hobby" items="${ hlist }">
	                  <c:if test="${ selectedHobby eq hobby.hobbyNo }">
	                     <input type="hidden" name='hobby' id='hobby' value ="${ hobby.hobbyNo }">
	                     <input value="${ hobby.hobbyName }" onclick="toHBSelView();" class="hobbyName" type="text" id='hobbyName' value="" placeholder="취미선택" readonly>
	                  </c:if>
	               </c:forEach>
	            </c:if>
			</div>
			
			<button type="button" id="filterBtn" onclick="filterSearch();">필터 검색</button>
			
			<script>
			function toHBSelView(){
	               var height = $("body")[0].clientHeight+"px";
	               window.open('${hList}', '_blank','width=1100px, height=1000px, location=no, toolbars=no, scrollbars=no');
	            }
			
				function filterSearch(){
					var sido = $('#sido').val();
					var gugun = $('#gugun').val();
					var hobby = $('#hobby').val();
					
					if(sido == "" && gugun == "" && hobby == ""){
							swal({
			            		  title: "지역 및 취미를 선택해주세요!",
			            		  text: "필터 검색은 회원님이 선택하신 정보를 기반으로 진행됩니다.",
			            		  icon: "warning",
			            		});
					 } else if (sido != "" && gugun == ""){
						swal({
		            		  title: "시/군을 선택해주세요!",
		            		  text: "모임은 지역을 기반으로 진행됩니다.",
		            		  icon: "warning",
		            		});
					} else {
						$("#listForm").submit();
					}
					
				}
			</script>
			
		</div>

		<div>
			<div style="clear:both; overflow:hidden;">
				<c:url var="recommend" value="recommend.gf">
					<c:param name="postNo" value="${ gf.postNo }"/>
					<c:param name="location" value="${ gf.location }"/>
					<c:param name="hobbyNo" value="${ gf.hobbyNo }"/>
				</c:url>

				<script>
					$(function(){
						
					 	if('${ isNeededTeacher }' == 'Y'){
					 		window.open('${recommend}', 'recommend', 'width=490, height=685, menubar=no, status=no, toolbar=no');
					 	};
				 	});
				</script>
			
				<div class="postArea clear-both" >
					<c:forEach var="b" items="${ blist }">
						<div class="postDetail">
						
							<input type="hidden" value="${ b.postNo }"/>
							<%-- <c:set var="postNo" value="${ b.postNo }"/> --%>
						
							<div class="group_status">
								<c:if test="${ b.closeYN eq 'N'}">
									<span>열려있는 모임</span>
								</c:if>
								<c:if test="${ b.closeYN eq 'Y'}">
									<span style="color:#675141">마감된 모임</span>
								</c:if>
							</div>
							
							<div class="title">
								<c:choose>
									<c:when test="${fn:length(b.title) > 18}">
										<c:out value="${ fn:substring(b.title, 0, 18) }"/>...
					           		</c:when>
						           	<c:otherwise>
						           		<c:out value="${b.title}"/>
						           	</c:otherwise> 
					          	</c:choose>
							</div>
							
							<div class="location">${ b.location }</div>
							
							<div class="user">
								<span>리더 : ${ b.nickName }</span><br>
								<span>강사 : 
									<c:if test="${ b.offerYN eq 'Y' && empty b.teacher }">
										구인중
									</c:if>
									<c:if test="${ b.offerYN eq 'Y' && !empty b.teacher }">
										${ b.teacher }
									</c:if>
									<c:if test="${ b.offerYN eq 'N'}">
										모집 안함
									</c:if>
								</span>
							</div>

							<!-- 썸네일 -->
							<div class="thumbnailWrapper">
								<div class="centered">
									<c:forEach var="f" items="${ flist }">
										<c:if test="${ b.postNo eq f.postNo }">
											<img class="thumbnail"
												 	src="${ contextPath }/resources/uploadFiles/${ f.changeName }">
										</c:if>
									</c:forEach>
								</div>
							</div>
							
							<c:if test="${ b.closeYN eq 'N'}">
			                    <div class="time" style="background:RGBA(136,140,67,0.7)">
			                       <span>
			                          <fmt:formatDate value="${b.startDate}" pattern="MM월 dd일"/> | 
			                          ${ b.startHour } - ${ b.endHour } 
			                            	 참여가능
			                       </span>
			                    </div>
			                </c:if>
		                    <c:if test="${ b.closeYN eq 'Y'}">
		                       <div class="time" style="background:RGBA(103,81,65,0.7)">
			                       <span>
			                          <fmt:formatDate value="${b.startDate}" pattern="MM월 dd일"/> | 
			                          ${ b.startHour } - ${ b.endHour } 
			                             	참여마감
			                       </span>
		                       </div>
		                    </c:if>
						</div>
					</c:forEach>
				</div>
					
					<c:if test="${ !empty loginUser && loginUser.mKind eq 1}">
						<button type="button" id="writeBtn" onclick="location.href='insertView.gf';">글쓰기</button>
					</c:if>
			</div>
		</div>
	
		<div id="paging">
			<!-- 페이징 처리 -->
			<div align="center" id="buttonTab">
			
				<!-- 맨 앞으로 -->
		        <c:if test="${ pi.currentPage <= 1 }">
		           <button type="button" class="startBtn" style="background:#e0e0e0; color:black" disabled>&lt;&lt;</button>
		        </c:if>
		        <c:if test="${ pi.currentPage ne 1 }">
<%-- 		           <c:url var="first" value="blist.gf">
		              <c:param name="page" value="1"/>
		           </c:url> --%>
		           <button type="button" class="startBtn" style="background:#675141; color:white" onclick="paging(this);">&lt;&lt;</button>
		        </c:if>
		        
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					<button type="button" id="before" style="background:#e0e0e0; color:black" disabled>&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.gf">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<button type="button"style="background:#675141; color:white" id="before" onclick="paging(this);">&lt;</button>
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button type="button" style="font-weight:bold; background:#888c43; color:white" id="current">${ p }</button>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="blist.gf">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<button type="button" id=pageNum onclick="paging(this);"
							style="font-weight:normal; background:white; color:black;">${ p }</button>
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button type="button" id=next style="background:#e0e0e0; color:black" disabled>&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.gf">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<button type="button" id=next style="background:#675141; color:white" onclick="paging(this);">&gt;</button>
				</c:if>
				
				<!-- 맨 뒤로 -->
		        <c:if test="${ pi.currentPage >= pi.maxPage }">
		           <button type="button" class="endBtn" style="background:#e0e0e0; color:black" disabled>&gt;&gt;</button>
		        </c:if>
		        <c:if test="${ pi.currentPage < pi.maxPage }">
		           <c:url var="last" value="blist.gf">
		              <c:param name="page" value="${ pi.maxPage }"/>            
		           </c:url>
		              <button type="button" class="endBtn" style="background:#675141; color:white" onclick="paging(this);">&gt;&gt;</button>
		        </c:if>
			</div>
			
			<script>
				$("#pageNum").mouseenter(function(){
					$('#pageNum').css({'font-weight':'bold', 'background':'#888c43', 'color':'white'});
					$('#current').css({'font-weight':'normal', 'background':'white', 'color':'black'});
				});
				$("#pageNum").mouseout(function(){
					$('#pageNum').css({'font-weight':'normal', 'background':'white', 'color':'black'});
					$('#current').css({'font-weight':'bold', 'background':'#888c43', 'color':'white'});
				});
				
				
				function paging(e){
					if( 0 < $(e)[0].innerText){
						$("#currentPage").val($(e)[0].innerText);
					} else {
						if( $(e)[0].innerText == ">" ){
							$("#currentPage").val(${ pi.currentPage } + 1);
						} else if( $(e)[0].innerText == ">>" ){
							$("#currentPage").val(${ pi.maxPage });
						} else if( $(e)[0].innerText == "<" ){
							$("#currentPage").val(${ pi.currentPage } - 1);
						} else if( $(e)[0].innerText == "<<" ){
							$("#currentPage").val(1);
							console.log($('#currentPage').val());
						}
					}
					
					$("#listForm").submit();
					
				}
			</script>
		</div>
			
		<div>
			<div class="searchArea">
				<div class="selectArea">
					<select name="searchSelect" id="searchSelect" style="border-radius:0px;">
						<c:if test="${ searchSelect eq 'title' || searchSelect eq null}">
							<option value="title" selected>제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</c:if>
						<c:if test="${ searchSelect eq 'content'}">
							<option value="title">제목</option>
							<option value="content" selected>내용</option>
							<option value="writer">작성자</option>
						</c:if>
						<c:if test="${ searchSelect eq 'writer'}">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer" selected>작성자</option>
						</c:if>
					</select>
					<!-- <input type="hidden" name="searchSelect" id="searchSelect"> -->
				</div>
				<div class="wordArea">
					<input type="text" placeholder="검색어 입력" name="searchValue" id="searchValue" 
						value="${ searchValue }" onKeyDown="if(event.keyCode == 13) search();">
					<button type="button" id="searchBtn" onclick="search();">검색</button>
				</div>
			</div>
		</div>
	</form>
	</section>
	
	<script>
		function search(){
			var searchSelect= $("#searchSelect").val();
			var searchValue = $("#searchValue").val();
			
			if(searchValue == null){
				attr('검색어를 입력해주세요.');
			} else {
				$("#listForm").submit();
				/* location.href="blist.gf?searchSelect="+searchSelect+"&searchValue="+searchValue; */
			}
			
		}
		
		function categoryChange() {
			
			var sido = $("#sido").val();
			
		    var gugun = [];
		    var seoul = ['강남구','강동구','강북구','강서구','관악구','광진구',
						'구로구','금천구','노원구','도봉구','동대문구','동작구',
						'마포구','서대문구','서초구','성동구','성북구','송파구',
						'양천구','영등포구','용산구','은평구','종로구','중구','중랑구'];
		    var gyeonggi = ['고양시 덕양구','고양시 일산동구','고양시 일산서구','과천시','광명시',
							'광주시','구리시','군포시','김포시','남양주시','동두천시',
							'부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구',
							'성남시 수정구','성남시 중원구','수원시 권선구','수원시 영통구',
							'수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구',
							'안성시','안양시 동안구','안양시 만안구','양주시','오산시','용인시 기흥구',
							'용인시 수지구','용인시 처인구','의왕시','의정부시','이천시','파주시',
							'평택시','포천시','하남시','화성시','가평군','양평군','여주군','연천군'];
		    var incheon = ['계양구','남구','남동구','동구','부평구','서구', '연수구','중구','강화군','옹진군'];
		    var gangwon = ['강릉시','동해시','삼척시','속초시','원주시','춘천시',
					    	'태백시','고성군','양구군','양양군','영월군','인제군',
					    	'정선군','철원군','평창군','홍천군','화천군','횡성군'];
		    var chungcheong_b = ['제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군',
				 				 '영동군','옥천군','음성군','증평군','진천군','청원군'];
		    var chungcheong_n = ['계룡시','공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군',
								 '부여군','서천군','연기군','예산군','청양군','태안군','홍성군'];
		    var daejeon = ['대덕구','동구','서구','유성구','중구'];
		    var sejong = ['조치원읍', '연기면', '연동면', '부강면', '금남면', '장군면', '연서면', '전의면', 
		    			  '전동면', '소정면', '한솔동', '반곡동', '소담동', '보람동', '대평동', '가람동', 
		    			  '나성동', '새롬동', '다정동', '어진동', '종촌동', '고운동', '아름동', '도담동'];
		    var jeolla_b = ['군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군',
							'무주군','부안군','순창군','완주군','임실군','장수군','진안군'];
		    var jeolla_n = ['광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군',
							'담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군',
							'진도군','함평군','해남군','화순군'];
		    var gwangju = ['광산구','남구','동구','북구','서구'];
		    var daegu = ['남구','달서구','동구','북구','서구','수성구','중구','달성군'];
		    var gyeongsang_b = ['경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시',
								'영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군',
								'영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군'];
		    var gyeongsang_n = ['거제시','김해시','마산시','밀양시','사천시','양산시','진주시',
								'진해시','창원시','통영시','거창군','고성군','남해군','산청군',
								'의령군','창녕군','하동군','함안군','함양군','합천군'];
		    var ulsan = ['남구','동구','북구','중구','울주군'];
		    var busan = ['강서구','금정구','남구','동구','동래구','부산진구',
						'북구','사상구','사하구','서구','수영구','연제구',
						'영도구','중구','해운대구','기장군'];
		    var jeju = ['제주시','서귀포시'];
		    
		    switch(sido){
		    	case "" : gugun = gugun; break;
		    	case "서울특별시" : gugun = seoul; break;
		    	case "경기도" : gugun = gyeonggi; break;
		    	case "인천광역시" : gugun = incheon; break;
		    	case "강원도" : gugun=gangwon; break;
		    	case "충청북도" : gugun=chungcheong_b; break;
		    	case "충청남도" : gugun=chungcheong_n; break;
		    	case "대전광역시" : gugun=daejeon; break;
		    	case "세종특별자치시" : gugun=sejong; break;
		    	case "전라북도" : gugun=jeolla_b; break;
		    	case "전라남도" : gugun=jeolla_n; break;
		    	case "광주광역시" : gugun=gwangju; break;
		    	case "대구광역시" : gugun=daegu; break;
		    	case "경상북도" : gugun=gyeongsang_b; break;
		    	case "경상남도" : gugun=gyeongsang_n; break;
		    	case "울산광역시" : gugun=ulsan; break;
		    	case "부산광역시" : gugun=busan; break;
		    	case "제주특별자치도" : gugun=jeju; break;
		    }

		    $('#gugun').empty();
		    
		    if('${selectedSido}' == null || '${selectedSido}' == "" || sido == "" || sido == null){
		    	 $('#gugun').append("<option value='' selected>시/군 을 선택하세요</option>");
	    	}
		    
		    
    		for(var i = 0; i <= gugun.length; i++){
	    		if('${selectedgugun}' == gugun[i]){
				 	var option = $("<option value='"+gugun[i]+"' selected>"+gugun[i]+"</option>");
				} else {
				 	var option = $("<option value='"+gugun[i]+"'>"+gugun[i]+"</option>");
				}
	    		$('#gugun').append(option);
	    	
			}
			
		}
	</script>
	
	
	<script>
		var div = $(".thumbnailWrapper") // 이미지를 감싸는 div
		var img =$(".thumbnail") // 이미지
		var divAspect = div.height / div.width;
		var imgAspect = img.height / img.width;
		 
		if (imgAspect <= divAspect) {
		    // 이미지가 div보다 납작한 경우 세로를 div에 맞추고 가로는 잘라낸다
		    var imgWidthActual = div.offsetHeight / imgAspect;
		    var imgWidthToBe = div.offsetHeight / divAspect;
		    var marginLeft = -Math.round((imgWidthActual - imgWidthToBe) / 2);
		    img.css({"width":"auto", "height":"100%", "margin-left":$(marginLeft)+"px"});
		    /* img.style.cssText = 'width: auto; height: 100%; margin-left: '
		                      + marginLeft + 'px;' */
		} else {
		    // 이미지가 div보다 길쭉한 경우 가로를 div에 맞추고 세로를 잘라낸다
		     img.css({"width":"100%", "height":"auto", "margin-left":"0"});
		    /* img.style.cssText = 'width: 100%; height: auto; margin-left: 0;'; */
		} 
		
		
		// 게시글 제목
		var title = $(".title");
		/* console.log(title.eq(0)[0].innerText.length); */
		for(var k=0; k < title.length; k++){
			if(title.eq(k)[0].innerText.length < 16){
				$(title.eq(k)).css("line-height","160%");
			} else {
				$(title.eq(k)).css("line-height","160%");
			}
		}
		
		// 게시글 선택
		$(function(){

			var loginUser = "${ loginUser }";
			var isEmpty = function(val) {
					if(val == "" || val === null || val == undefined
							|| (val != null && typeof val === "object" && !Object.keys(val).length)){
						return true
					} else { 
						return false
					}
			};
			
			$(".postDetail").mouseover(function(){
				$(this).css({'background':'#F2DEA2', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).css({'background':'white'});
			}).click(function(){
				//console.log($(this).children($("#postNo")).val());
				if(isEmpty(loginUser)){
					alert("로그인 후 이용 가능한 서비스입니다.");
					location.href="loginView.me";
				} else {
					var postNo = $(this).children($("#postNo")).val();
					location.href="bdetail.gf?postNo="+ postNo +"&page="+${ pi.currentPage };
				}
			});
		});
	</script>
	
</body>
</html>