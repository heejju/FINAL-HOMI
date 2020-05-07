<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/common/reset.css" type="text/css">
<style>
    .report-wrap{width:600px;}
    header > h1 {width:45%; height:50px; margin:0 auto; line-height: 50px;}
    header > p {width: 95%; font-size:12px; margin:0 auto; background: rgb(232, 232, 232); font-style: italic;}
    
    section{background:rgb(228, 233, 237); margin-top: 15px; padding: 15px 0;}
    footer{background:rgb(228, 233, 237); padding: 15px 0;}
    .admin-info, .login-u-info, .report-u-info, .reason, .url{width:90%; box-sizing: border-box; border: 1px solid rgb(217, 217, 217); margin:0 auto; margin-bottom: 20px;}
    .admin-title, .lu-title, .ru-title, .reason-title, .url-title{width:100%; box-sizing: border-box; border-bottom: 1px solid rgb(217, 217, 217); background: rgb(235, 233, 233);}
    .admin-title > p, .lu-title > p , .ru-title > p, .reason-title > p, .url-title > p{margin: 10px 0 10px 10px; display: inline-block; font-weight: bold;}
    .admin-content, .lu-content, .ru-content,.reason-content, .url-content{background: #fff; padding:10px 0;}
    .admin-id ,.lu-id, .ru-id{margin-left:10px; margin-bottom: 5px;}
    .report-tiem{margin-left:10px;}
    
    /*버튼*/
    .btn-wrap{width:220px; margin:0 auto;}
    #rSubmit{width:95px; margin-right:10px; cursor: pointer;}
    #rClose{width:95px; cursor: pointer;}
    
</style>
    <body>
    <form class="report-wrap" id="ReportForm" action="reportGo.fo" method="post">
        <header>
            <h1>신고 내역 입력</h1>
            <p>단, 신고내용이 허위인 경우에는 그에 상응하는 법적 책임을 신고자가 부담해야 합니다.</p>
        </header>
        <section>
            <div class="admin-info">
                <div class="admin-title">
                    <p>기본 정보</p>
                </div>
                <div class="admin-content">
                    <div class="admin-id">
                        <label style="margin-bottom: 5px; display: inline-block;">담당자 메일: admin999@naver.com </label><br>
                        <label>담당자 ID : admin</label>
                    </div>
                </div>
            </div>
            <div class="report-u-info">
                <div class="ru-title">
                    <p>유 저 정보</p>
                </div>
                <div class="ru-content">
                    <div class="ru-id">
                        <label>유 저 ID : </label>
                        <label>${ member.userId }</label>
                        <input type="hidden" name="userId" value="${ member.userId }">
                    </div>
                </div>
            </div>
            <div class="login-u-info">
                <div class="lu-title">
                    <p>신고자 정보</p>
                </div>
                <div class="lu-content">
                    <div class="lu-id">
                        <label>신고자 ID : </label>
                        <label>${ loginUser.userId }</label>
                    </div>
                    <div class="report-tiem">
                        <label>신고 일시 : </label>
                        <label class="tiem-list"></label>
                    </div>
                </div>
            </div>
            <div class="url">
                <div class="url-title">
                    <p>URL</p>
                </div>
                <div class="url-content">
                    <textarea name="url" style="width:500px; height:30px; display: inline-block; margin-left:20px; resize: none;" name="content"></textarea>
                </div>
            </div>
            <div class="reason">
                <div class="reason-title">
                    <p>사유</p>
                </div>
                <div class="reason-content">
                    <textarea name="reason" style="width:500px; height:80px; display: inline-block; margin-left:20px; resize: none;" name="content"></textarea>
                </div>
            </div>
        </section>
        <footer>
            <div class="btn-wrap">
                <input type="button" id="rSubmit" onclick="$('#ReportForm').submit();" value="신 고">
                <input type="button" id="rClose" onclick="window.close();" value="닫 기">
            </div>
            <script>
            (function printNow() {
            	  const today = new Date();

            	  const year = today.getFullYear();
            	  const month = today.getMonth() + 1;
            	  const date = today.getDate();
            	  let hour = today.getHours();
            	  let minute = today.getMinutes();
            	  let second = today.getSeconds();

            	  // 10미만인 분과 초를 2자리로 변경
            	  minute = minute < 10 ? '0' + minute : minute;
            	  second = second < 10 ? '0' + second : second;

            	  const now = year + '년' + month + '월' +  date + '일' + hour +':' + minute + ':' + second;

            	  console.log(now);
            	  setTimeout(printNow, 1000);
            	  $('.tiem-list').text(now);
            	}());
            
            </script>
        </footer>
    </form>
</body>
</head>
</html>