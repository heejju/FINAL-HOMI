<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   String applySuccess = "applySuccess";
   
   request.getSession().getAttribute("applySuccess");
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
<style type="text/css">
	body{
		line-height: 17px;
	}
   body, html, div{padding: 0; margin:0;}
   br{line-height: 30%;}
   hr, h3{margin: 5px 0 5px 0;}
   p{}
   hr{color: gray;}
   .green{color: rgb(136, 140, 67);}
   .brown{color: rgb(103, 81, 65);}
   
   div.body{
      margin: 0 auto;
      text-align: center; border: 0px solid lightgray;
      width: 80%; height: auto; padding-bottom: 50px;
   }
   
   select{
      height:30px; border: 3px solid rgb(103, 81, 65); width: 95px; text-align-last : center;
      color: rgb(136, 140, 67); font-weight: bold; border-radius: 5px; font-family: ;
   }
   div.search1{
      width: 100%; height: 100%; margin: 0 auto;
   }
   
   div.search1 > select{
      height:40px; border: 3px solid rgb(103, 81, 65); width: 95px; text-align-last : center;
      color: rgb(136, 140, 67); font-weight: bold; border-radius: 5px; font-size: 20px; width: 200px;
   }
   
   div.search1 > select > option{
      font-weight: bold;
   }
   div.search1 > select > option:first-child{
      font-weight: bold; color: lightgray;
   }
   
   form.search1{
      width: auto; height: auto;
   }
   
   svg{
      color: rgb(103, 81, 65);
   }
   
   div.content{
      background: white; width: 300px; height: 255px; display: inline-block;
      margin: 10px; border: 1px solid lightgray; cursor:pointer;
   }
   div.img{
      width:300px; height: 200px; background-size: 300px 200px;
      text-align: left;
   }
   .contentTitle{
      width: 190px; display: inline-block; font-weight: bold; display: inline-block; margin: 0; height: 100%;
   }
   div.contentTitle{
      width: 190px; font-weight: bold; text-overflow: ellipsis; display: inline-block;
      margin: 0; padding : 0 5px 0 5px;
      height: 100%; text-align: center; overflow: hidden; float: left;
   }
   div.contentWriter{
      display: inline-block; width: 90px; font-size: 12px; text-align: center;
   }
   p.contentTime{
      background: rgba(103, 81, 65, 0.8); color: rgb(136, 140, 67); width: auto;
      display: inline-block; padding: 0 10px 0 10px; margin: 5px 0 0 0; font-weight: bold;
   }
   p.contentPrice{
      background: rgba(136, 140, 67, 0.8); color: rgb(103, 81, 65); width: auto; 
      display: inline-block; padding: 0 10px 0 10px; margin: 5px 0 0 0; font-weight: bold;
   }
   p.contentCate{
      background: rgba(103, 81, 65, 0.8); color: rgb(136, 140, 67); width: auto; 
      display: inline-block; padding: 0 10px 0 10px; margin: 5px 0 0 0;
      vertical-align: bottom; font-weight: bold;
   }
   p.contentApply{
      background: rgba(136, 140, 67, 0.8); color: rgb(103, 81, 65); width: auto; 
      display: inline-block; padding: 0 10px 0 10px; margin: 5px 0 0 0;
      vertical-align: bottom; font-weight: bold;
   }
   
   div.BWrite{
      width: 92%; text-align: right; margin: 15px auto 15px auto;
   }
   button.write {
      padding: 5px 15px 5px 15px; color: white; border-radius: 5px; width: 90px; height: 35px; font-size: 18px;
      background: rgb(136, 140, 67); border: 0px; font-weight: bold; cursor: pointer;
   }
   button.write:hover{
      background: rgba(136, 140, 67, 0.65);
   }
   
   button.nextPBtn{
      border: 0px; border-radius: 5px; background: rgb(103, 81, 65); color: white;  width: 40px; height: 36px;
      padding: 7px 12px 7px 12px; cursor: pointer; font-size: 16px;
   }
   button.pagingBtn{
      border: 0px; border-radius: 5px; background: white; color: black; width: 42px; height: 36px;
      padding: 7px 12px 7px 12px; cursor: pointer; font-size: 16px;
   }
   button.pagingSelBtn{
      border: 0px; border-radius: 5px; background: rgb(136, 140, 67); color: white; font-weight: bold;
      padding: 7px 12px 7px 12px; font-weight: bolder; width: 42px; height: 36px; font-size: 16px;
   }
   
   div.search2 > input.searchValue {
      border: 3px solid rgb(103, 81, 65); border-radius: 5px; height: 34px; padding: 0px 10px;
      width: 320px; font-weight: bold; font-size: 20px; text-align: center;
   }
   div.search2 > select{
      height:40px; border: 3px solid rgb(103, 81, 65); width: 95px; text-align-last : center;
      color: rgb(136, 140, 67); font-weight: bold; border-radius: 5px; font-size: 20px; width: 120px;
   }
   div.search2 > select > option{
      font-weight: bold; font-size: 20px;
   }
   .jm-btn{padding-top:5px; display:inline-block;}
   input.hobbyName{
      width: 200px; height: 40px; border: 3px solid rgb(103,81,65); font-size: 20px;
      border-radius: 5px; text-align: center; box-sizing: border-box; font-weight: bold;
      color : rgb(136, 140, 67); cursor: pointer;
   }
   button.hobbyEmpty{
   		border: 3px solid rgb(103, 81, 65); background:white; color: rgb(136, 140, 67);
   		height: 40px; box-sizing: border-box; font-weight: bold; cursor: pointer; vertical-align: middle;
   		font-size: 20px; border-radius: 5px;
   }
</style>
</head>
<body>
<script>
   //신청하고왔따? 그럼 신청하고왔따뜸
   $(function(){
      if("${applySuccess}" == "applySuccess"){
         swal("신청이 완료되었습니다.",{
            icon : "success",
            buttons : "확인"
         });
      }
   });
</script>
<form action="list.lec" method="post" id="lecForm" style="width: 1300px; margin: 0 auto;" onsubmit="whereFormGo();">
<input type="hidden" name=currentPage id=currentPage value="${ currentPage }">
<input type="hidden" name="postNo" id="postNo" value="0">
<c:set var="applySuccess" value='<%=request.getSession().getAttribute("applySuccess") %>'/>
<script>
   //postNo가 0이면 list.lec 0이아니라 다른숫자면 detail.lec으로간다
   function whereFormGo(){
      var postNo = $("#postNo").val();
      if(postNo != 0){
         $("#lecForm").attr("action", "detail.lec");
      }
   }
</script>
<%request.getSession().setAttribute("applySuccess", null); %>
   <div class="body">
      <div class="search1">
         <br>
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
         <script>
            // 만약 처음으로 list에 온게 아니라 검색으로 다시 왔을 경우 검색시 사용한 도시를 자동으로 셀렉
            $(function(){
               var $select = $("select[name=sido]").children();
               for(var i = 0; i < $select.length; i++){
                  if('${ sido }' == $select.eq(i).val()){
                     $select.eq(i).attr("selected", "selected");
                  }
                  categoryChange();
                  
               }
            });
         </script>
         
         <i class="fas fa-arrow-alt-circle-right" style="vertical-align: middle; height: 40px; width: 40px;"></i>
         
         <select name="gugun" class="selectLocation" id="gugun">
            <option value=''>구/군 선택</option>
         </select>
         
         <div style="display: inline-block; line-height: 30px; font-size: 40px; vertical-align: middle; width:40px; height:40px; text-align: center">//</div>
         
         <c:url var="HBSel" value="selectHobbyView.lec"/>
         <div style="display: inline-block;">
            <c:if test="${ hobbyNo eq null }">
               <input type="hidden" name='hobbyNo' id='hobbyNo' value ="0">
               <input onclick="toHBSelView();" class="hobbyName" type="text" id='hobbyName' value="" placeholder="취미선택" readonly>
            </c:if>
            <c:if test="${ hobbyNo eq 0 }">
               <input type="hidden" name='hobbyNo' id='hobbyNo' value ="0">
               <input onclick="toHBSelView();" class="hobbyName" type="text" id='hobbyName' value="" placeholder="취미선택" readonly>
            </c:if>
            <c:if test="${ hobbyNo ne null }">
               <c:forEach var="hobby" items="${ hList }">
                  <c:if test="${ hobbyNo eq hobby.hobbyNo }">
                     <input type="hidden" name='hobbyNo' id='hobbyNo' value ="${ hobby.hobbyNo }">
                     <input value="${ hobby.hobbyName }" onclick="toHBSelView();" class="hobbyName" type="text" id='hobbyName' value="" placeholder="취미선택" readonly>
                  </c:if>
               </c:forEach>
            </c:if>
         </div>
         
         <i onclick="$('#lecForm').submit()" class="fas fa-search" style="background: rgb(136, 140, 67); padding: 3px; border-radius: 3px; height:40px; width:40px; vertical-align: middle; box-sizing: border-box; cursor: pointer;"></i>
         
         <i class="fas fa-times-circle" onclick="$('#hobbyNo').val(0); $('#hobbyName').val(''); $('#sido').val('');$('#gugun').val('');$('#searchValue').val('');" style="vertical-align: middle; height: 40px; width: 40px; cursor:pointer;"></i>
         
         <!-- admin만 보이는 cateinsertBtn -->
         <c:if test="${ loginUser.userId.equals('admin') }">
            <i onclick="insertCategory();" class="fas fa-plus-square" style="width:40px; height:40px; cursor:pointer; vertical-align: middle;"></i>
         </c:if>
         <c:url var="adminCate" value="adminCateView.lec"/>
         <script>
            //취미선택 누르면 hobbySelectView나옴
            function toHBSelView(){
               var height = $("body")[0].clientHeight+"px";
               window.open('${HBSel}', '_blank','width=1100px, height=1000px, location=no, toolbars=no, scrollbars=no');
            }
         
            //admin login시에 카테고리를 추가할수잇는 버튼 추가
            function insertCategory(){
               window.open('${adminCate}', '_blank','width=1100px, height=800px, location=no, toolbars=no, scrollbars=no');
            }
         </script>
      </div>
      
      <script>
         function categoryChange() {
            
            var sido = $("#sido").val();
            //------------구 군--------------------
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
           //------------동--------------------
              var dong;
             var gangnamgu = [];
             var gangdonggu = [];
             var gangbukgu = [];
             var gangsugu = [];
             var gyanakgu = [];
             var gyangjingu = [];
             var gulogu = [];
             var gumchungu = [];
             var nowongu = [];
             var dobonggu = [];
             var dongdemongu = [];
             var dongjakgu = [];
             var mapogu = [];
             var sudemongu = [];
             var suchogu = [];
             
             
             
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
             $('#gugun').append($("<option value=''>구/군 선택</option>"));
            for(var i = 0; i < gugun.length; i++){
               if('${ gugun }' == gugun[i]){
                  var option = $("<option value='"+gugun[i]+"' selected=selected>"+gugun[i]+"</option>");
               } else {
                  var option = $("<option value='"+gugun[i]+"'>"+gugun[i]+"</option>");
               }
               $('#gugun').append(option);
            }
            
         }
      </script>
      
      <br><br>
      
      <c:set var="i" value="1"/>
      <div class="listInfo" style="text-align: left; padding: 0 30px;">
         <c:forEach items="${ lbList }" var="lb">
            <c:if test="${ i  eq lbList.size() }">
               <div class="content" onclick="toDetail(this);">
                  <input type=hidden value="${ lb.postNo }">
                  <div class="img" style="background-image: url('${pageContext.request.contextPath}/resources/uploadFiles/${ lb.changeName }');">
                     <div style="width:300px; height: 100px; background: rgba(255, 255, 255, 0.3);">
                        <p class="contentPrice">\ ${ String.format('%,d',lb.otTuition * lb.otAllTime) }</p><br>
                        <p class="contentTime">${ lb.otAllTime } time</p>
                     </div>
                     <div style="width:300px; height: 60px; text-align: right; padding-top: 40px; background: rgba( 255, 255, 255,0.3);">
                        <p class="contentCate">${ lb.hobbyName }</p><br>
                        <p class="contentApply">농부 모집중</p>
                     </div>
                  </div>
                  <div>
                     <hr>
                  </div>
                  <div style="height: 33px;">
                     <div class="contentTitle">${ lb.title }</div>
                     <div class="contentWriter">
                        <div>
                        <label class="brown"><b>글쓴이</b></label><br><label class="green"><b>${ lb.nickName }</b></label>
                        </div>
                     </div>
                  </div>
                  <hr>
               </div>
            </c:if>
               
            <c:if test="${ i  ne lbList.size() }">
               <c:if test="${ i mod 3 eq 1 }">
                  <div class="content" onclick="toDetail(this);">
                     <input type=hidden value="${ lb.postNo }">
                     <div class="img" style="background-image: url('${pageContext.request.contextPath}/resources/uploadFiles/${ lb.changeName }');">
                        <div style="width:300px; height: 100px; background: rgba(255, 255, 255, 0.3);">
                           <p class="contentPrice">\ ${ String.format('%,d',lb.otTuition * lb.otAllTime) }</p><br>
                           <p class="contentTime">${ lb.otAllTime } time</p>
                        </div>
                        <div style="width:300px; height: 60px; text-align: right; padding-top: 40px; background: rgba( 255, 255, 255,0.3);">
                           <p class="contentCate">${ lb.hobbyName }</p><br>
                           <p class="contentApply">농부 모집중</p>
                        </div>
                     </div>
                     <div>
                        <hr>
                     </div>
                     <div style="height: 33px;">
                        <div class="contentTitle">${ lb.title }</div>
                        <div class="contentWriter">
                           <div>
                           <label class="brown"><b>글쓴이</b></label><br><label class="green"><b>${ lb.nickName }</b></label>
                           </div>
                        </div>
                     </div>
                     <hr>
                  </div>
               </c:if>
            </c:if>
            <c:if test="${ i  ne lbList.size() }">
               <c:if test="${ i mod 3 eq 2 }">
                  <div class="content" onclick="toDetail(this);">
                     <input type=hidden value="${ lb.postNo }">
                     <div class="img" style="background-image: url('${pageContext.request.contextPath}/resources/uploadFiles/${ lb.changeName }');">
                        <div style="width:300px; height: 100px; background: rgba(255, 255, 255, 0.3);">
                           <p class="contentPrice">\ ${ String.format('%,d',lb.otTuition * lb.otAllTime) }</p><br>
                           <p class="contentTime">${ lb.otAllTime } time</p>
                        </div>
                        <div style="width:300px; height: 60px; text-align: right; padding-top: 40px; background: rgba( 255, 255, 255,0.3);">
                           <p class="contentCate">${ lb.hobbyName }</p><br>
                           <p class="contentApply">농부 모집중</p>
                        </div>
                     </div>
                     <div>
                        <hr>
                     </div>
                     <div style="height: 33px;">
                        <div class="contentTitle">${ lb.title }</div>
                        <div class="contentWriter">
                           <div>
                           <label class="brown"><b>글쓴이</b></label><br><label class="green"><b>${ lb.nickName }</b></label>
                           </div>
                        </div>
                     </div>
                     <hr>
                  </div>
               </c:if>
            </c:if>
            <c:if test="${ i  ne lbList.size() }">
               <c:if test="${ i mod 3 eq 0 }">
                  <div class="content" onclick="toDetail(this);">
                     <input type=hidden value="${ lb.postNo }">
                     <div class="img" style="background-image: url('${pageContext.request.contextPath}/resources/uploadFiles/${ lb.changeName }');">
                        <div style="width:300px; height: 100px; background: rgba(255, 255, 255, 0.3);">
                           <p class="contentPrice">\ ${ String.format('%,d',lb.otTuition * lb.otAllTime) }</p><br>
                           <p class="contentTime">${ lb.otAllTime } time</p>
                        </div>
                        <div style="width:300px; height: 60px; text-align: right; padding-top: 40px; background: rgba( 255, 255, 255,0.3);">
                           <p class="contentCate">${ lb.hobbyName }</p><br>
                           <p class="contentApply">농부 모집중</p>
                        </div>
                     </div>
                     <div>
                        <hr>
                     </div>
                     <div style="height: 33px;">
                        <div class="contentTitle">${ lb.title }</div>
                        <div class="contentWriter">
                           <div>
                           <label class="brown"><b>글쓴이</b></label><br><label class="green"><b>${ lb.nickName }</b></label>
                           </div>
                        </div>
                     </div>
                     <hr>
                  </div>
               </c:if>
            </c:if>
            <c:set var="i" value="${ i + 1 }"/>
         </c:forEach>
      </div>
      <script>
         //글 클릭시 해당 글번호를 가지와 검색했던조건들을 가지고서 간다
         function toDetail(e){
            $("#postNo").val($(e).children().eq(0).val());
            $("#lecForm").submit();
         }
      
      </script>
      <c:if test="${ loginUser.mKind == 2 }">
      <div class="BWrite">
         <c:url var="write" value="write.lec"/>
         <button class="write" type="button" onclick="location.href='${ write }'">글쓰기</button>
      </div>
      </c:if>
      
      <div style="text-align: center;">
         <!-- 맨 처음과 이전 버튼 -->
         <c:if test="${ pi.currentPage <= 1 }">
            <button type="button" class="nextPBtn" style="background: lightgray; cursor: default;">&lt;&lt;</button>
            <button type="button" class="nextPBtn" style="background: lightgray; cursor: default;">&lt;</button>
         </c:if>
         <c:if test="${ pi.currentPage > 1 }">
            <button type="button" class="nextPBtn" onclick="paging(this);">&lt;&lt;</button>
            <button type="button" class="nextPBtn" onclick="paging(this);">&lt;</button>
         </c:if>
         <!-- 10개의 페이지목록 -->
         <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            <c:if test="${ p eq pi.currentPage }">
               <button type="button" class="pagingSelBtn">${ p }</button>
            </c:if>
            <c:if test="${ p ne pi.currentPage }">
               <button type="button" class="pagingBtn" onclick="paging(this);">${ p }</button>
            </c:if>
         </c:forEach>
         <!-- 맨끝으로버튼 -->
         <c:if test="${ pi.currentPage < pi.maxPage }">
            <button type="button" class="nextPBtn" onclick="paging(this);">&gt;</button>
            <button type="button" class="nextPBtn" onclick="paging(this);">&gt;&gt;</button>
         </c:if>
         <c:if test="${ pi.currentPage >= pi.maxPage }">
            <button type="button" class="nextPBtn" style="background: lightgray; cursor: default;">&gt;</button>
            <button type="button" class="nextPBtn" style="background: lightgray; cursor: default;">&gt;&gt;</button>
         </c:if>
      </div>
      <script>
         //버튼을 누른 알맞을 페이지로 이동시키기
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
               }
            }
            $("#lecForm").submit();
         }
      </script>
      
      <br><br>
      
      <div class="search2" style="text-align: center;">
         <c:if test="${ searchTag.equals('title') }">
            <select name="searchTag">
               <option value="title" selected="selected">제목</option>
               <option value="writer">작성자</option>
            </select>
         </c:if>
         <c:if test="${ searchTag.equals('writer') }">
            <select name="searchTag">
               <option value="title">제목</option>
               <option value="writer" selected="selected">작성자</option>
            </select>
         </c:if>
         <c:if test="${ searchTag.isEmpty()}">
            <select name="searchTag" onchange="otherSearch();">
               <option value="title">제목</option>
               <option value="writer">작성자</option>
            </select>
         </c:if>
         <input id="searchValue" type="text" class="searchValue" name="searchValue" value="${ searchValue }" onchange="otherSearch();">
         <div class="jm-btn">
            <i onclick="$('#lecForm').submit()" class="fas fa-search" style="background: rgb(136, 140, 67); padding: 3px; border-radius: 3px; width: 34px; height: 34px; cursor:pointer; vertical-align: middle;"></i>
         </div>
      </div>
      <script>
         //서치 val를 다른것으로 바꿀때 페이지는 1로
         function otherSearch(){
            $("#currentPage").val(1);
         }
         
      </script>
      
      
   </div>
</form>
</body>




</html>