<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
<meta charset="UTF-8">
<title>#취미텃밭</title>
<style>
    html, body {
      position: relative;
      height: 100%;
    }
    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 100%;
      height: 100%;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
</style>
</head>
<body>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	<div class="swiper-container" style="background: white;">
		<div class="swiper-wrapper">
			<c:forEach var="lb" items="${lbList}">
				<div class="swiper-slide">
				 			<a target="_blank" href="detail.lec?postNo=${lb.postNo}"><img class="thumbnail" src="${ contextPath }/resources/uploadFiles/${ lb.changeName }"></a>	
						<div style="position: absolute; bottom: 5px;">
							<input type="hidden" value="${lb.postNo}">
							${lb.title}
						</div>
				</div>
			</c:forEach>
	    </div>
	    <!-- Add Pagination -->
  		  <div class="swiper-pagination"></div>
  		  <!-- Add Arrows -->
   		 <div class="swiper-button-next"></div>
   		 <div class="swiper-button-prev"></div>
	</div>
	
	<script>
	 var swiper = new Swiper('.swiper-container', {
	      slidesPerView: 2, //한 페이지에 2개씩 보이도록 함
	      spaceBetween: 30,
	      pagination: {
	        el: '.swiper-pagination',
	        type: 'fraction',
	        clickable: true,
	      },
	      navigation: {
	          nextEl: '.swiper-button-next',
	          prevEl: '.swiper-button-prev',
	      }
	    });
	</script>
</body>
</html>