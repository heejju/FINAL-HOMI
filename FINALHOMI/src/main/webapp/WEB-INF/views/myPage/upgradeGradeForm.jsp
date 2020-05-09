<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/boardCommon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>#취미텃밭</title>
<style>
	.outer{
		width:900px; min-height:50px; padding-bottom: 50px;
		margin-left:auto; margin:auto; margin-top:50px; margin-bottom: 50px; 
	}
	
	#upCondition{border-bottom: 1px solid gray; text-align: center; 
					padding: 30px; font-size: 20px; line-height: 50px;}
	
	
	#Buttons{text-align: center; padding: 30px;}
	.buttonG{width:150px; background-color:#888c43; color:#fff; border:none; padding:10px 0; text-align:center; font-size:15px; margin:4px; cursor:pointer; border-radius:5px;}
	.buttonB{width:150px; background-color:rgb(150, 150, 150); color:#fff; border:none; padding:10px 0; text-align:center; font-size:15px; margin:4px; cursor:pointer; border-radius:5px;}
	
	button:hover{cursor:pointer;}
</style>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<c:import url='../common/boardCommon.jsp'/>
	<script>
	$('#bName').text(' 마이 ');
	$('#bNameAfter').text('페이지');
	$('#bName').css('cursor', 'pointer');
	$('#bNameAfter').css('cursor', 'pointer');
	
	$('#bName').click(function() {
		location.href="teacherPage.mp";
	});
	$('#bNameAfter').click(function() {
		location.href="teacherPage.mp";
	});
	</script>
	<div class="outer">
		<div id="upCondition">
			안녕하세요 강사님! <br>
			저희 <b>#취미텃밭</b>에서는 강사님들을 위한 연간회원 서비스를 제공하고있습니다.<br>
			연간회원에 가입하실 경우<br>
			1. 아이콘이 붙습니다 깐지나죠<br>
			2. 모종을 뿌릴 수 있습니다.<br>
			3. 인생이 즐거워집니다<br>
			4. 어깨춤이 절로 춰집니다<br>
			이 모든 서비스를 이용하고 싶으실 경우 하단의 <b>결제하기</b>를 눌러주세요!
		</div>
		<div id="Buttons">
			<button class="buttonG" id="kakaoPay">결제하기</button>
			<button class="buttonB" onclick="location.href='teacherPage.mp'">돌아가기</button>
		</div>
	</div>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		
		$('#kakaoPay').on('click', function() {
			var IMP = window.IMP;
			IMP.init('imp60321546');
			var msg;
			
			IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : 'VIP 업그레이드',
				amount : 50000,
				buyer_email : '이메일 받아오기',
				buyer_name : '이름 받아오기',
				buyer_tel : '번호 불러오기'
			}, function(rsp) {
				if( rsp.success ) {
					jQuery.ajax({
						url: "upgradeVip.mp",
						type: 'POST',
						dataType: 'json',
						data : {
							imp_uid : rsp.imp_uid
						}
					}).done(function(data) {
						if(everythings_fine) {
						}
					});
					 location.replace("<%=request.getContextPath()%>/teacherPage.mp?msg=true");
				} else {
					swal("결제가 취소되었습니다.",{
						icon : "info",
						buttons : {
							confirm : true,
						}
					});
				}
			})
		});
		
	</script>
</body>
</html>