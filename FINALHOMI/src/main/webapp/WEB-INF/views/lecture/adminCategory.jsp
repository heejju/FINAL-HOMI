<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#취미텃밭</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<style>
	body{background:#fff6f0; font-family: 'Nanum Gothic', sans-serif;}
	.green{color: rgb(136, 140, 67);}
	.brown{color: rgb(103, 81, 65);}
	
	#logoWrapper{margin:5% 0 3% 0;}
	#logo{width:30%; height:auto; vertical-align:middle;}
	#hobbyListSpan{font-size:52px; font-weight:bold; vertical-align:middle; padding:0 3%;}
	
	div{
		text-align: center; vertical-align: middle;
	}
	table{
		width: 1030px; margin: 0 auto; ce
	}
	table , tr , td{
		border: 2px solid #e0e0e0; border-radius: 5px; background: white;
		border-spacing: 5px; text-align: center; vertical-align: middle; display:inline-block;
	}
	tr{ padding:8px 0; border:none; width:90%;}
	td{
		font-size: 17px; font-weight: bold; cursor: pointer; line-height:35px; float:left; 
	}
	td.hobbyNo{
		width: 4%; height:4%; background: #A5C3CF; color: white /* rgb(103, 81, 65) */;
		border-radius:80%; border:none; 
	}
	td.hobbyName{
		width: 15%; height:4%; border:none; color: #888; text-align:left; padding-left:5px;
	}
	p{
		font-size: 16px; color: #f35212; font-weight: bolder;
	}
	input{
		border: none; border-radius: 5px; padding: 2px 5px 2px 5px; text-align:center; vertical-align:middle;
		font-size: 20px; font-weight: bold; height: 40px; box-sizing: border-box;
	}
	input.hobbyNo{
		width: 110px; text-align:center; padding:0 auto;
	}
	input.hobbyName{
		width: 350px; 
	}
	button{
		width:100px; height:40px; box-sizing: border-box; border: 0px; font-size: 18px; font-weight: bold; vertical-align: middle;
		color: white; border-radius: 5px; cursor:pointer; margin: 0 3px;
	}
	button.hobbyNo{
		background: #888;
	}
	button.insert{
		background: rgb(136, 140, 67);
	}
	button.delete{
		background: rgb(103, 81, 65);
	}

</style>
</head>
<body>
<script>
	$(function(){
		//만약 쓰이는 취미여서delete가 안됐다면
		if("${cantDel}" == "cantDel"){
			swal("사용되는 취미여서 삭제할수 없습니다.",{
				icon:"error",
				buttons: "확인"
			});
		}
	});
</script>
	<c:set var="cantDel" value='<%=request.getSession().getAttribute("cantDel") %>'/>
	<%request.getSession().setAttribute("cantDel", null); %>
	<form id="cateForm" action="adminCate.lec" method="post">
	<section>
		<div id="logoWrapper">
			<img id="logo" src="${ contextPath }/resources/images/Logo.png">
			<span id="hobbyListSpan">취미 목록</span>
		</div>
	<div>
		<div style="margin:4% 0 2% 0;">
			<input class="hobbyNo" id="hobbyNo" name="hobbyNo" type="Number" placeholder="번호 선택" readonly>
			<input class="hobbyName" id="hobbyName" name="hobbyName" type="text" placeholder="수정 혹은 추가할 취미를 적어주세요.">
			<button onclick="hobbyNoDel();" class="hobbyNo" type=button>Reset</button>
			<button class="insert" type=button onclick="updateOrInsert();">수정 /추가</button>
			<input id=delYN name="delYN" type=hidden value="N">
			<button class="delete" type="button" onclick="forDelete();">취미삭제</button>
		</div>
		<div style="text-align:right; width:1030px; margin:0 auto">
			<p>※번호 선택시 수정 / 번호 비 선택시 추가</p>
		</div>
	</div>
		<div>
			<table id="hobbyTable">
				<c:set var="i" value="1"/>
				<c:forEach items="${ hList }" var="hobby">
					<c:if test="${ i mod 5 eq 1 }">
						<tr>
							<td onclick="clickHobbyNo(this);" class="hobbyNo">${ hobby.hobbyNo }</td>
							<td onclick="clickHobbyName(this);" class="hobbyName">${ hobby.hobbyName }</td>
					</c:if>
					<c:if test="${ i mod 5 eq 2 }">
							<td onclick="clickHobbyNo(this);" class="hobbyNo">${ hobby.hobbyNo }</td>
							<td onclick="clickHobbyName(this);" class="hobbyName">${ hobby.hobbyName }</td>
					</c:if>
					<c:if test="${ i mod 5 eq 3 }">
							<td onclick="clickHobbyNo(this);" class="hobbyNo">${ hobby.hobbyNo }</td>
							<td onclick="clickHobbyName(this);" class="hobbyName">${ hobby.hobbyName }</td>
					</c:if>
					<c:if test="${ i mod 5 eq 4 }">
							<td onclick="clickHobbyNo(this);" class="hobbyNo">${ hobby.hobbyNo }</td>
							<td onclick="clickHobbyName(this);" class="hobbyName">${ hobby.hobbyName }</td>
					</c:if>
					<c:if test="${ i mod 5 eq 0 }">
							<td onclick="clickHobbyNo(this);" class="hobbyNo">${ hobby.hobbyNo }</td>
							<td onclick="clickHobbyName(this);" class="hobbyName">${ hobby.hobbyName }</td>
						</tr>
					</c:if>
					<c:set var="i" value="${ i + 1 }"/>
				</c:forEach>
			</table>
		</div>
	</section>
	</form>
	
	<script>
		//table에서 취미 번호 클릭시 해당 값 input에 넣기
		function clickHobbyNo(e){
			var hobbyNo = $(e)[0].innerText;
			var hobbyName = $(e).next()[0].innerText;
			$("#hobbyNo").val(hobbyNo);
			$("#hobbyName").val(hobbyName);
			$("#hobbyName").focus();
		}
		//table에서 취미 이름 클릭시 해당 값 input에 넣기
		function clickHobbyName(e){
			var hobbyNo = $(e).prev()[0].innerText;
			var hobbyName = $(e)[0].innerText;
			$("#hobbyNo").val(hobbyNo);
			$("#hobbyName").val(hobbyName);
			$("#hobbyName").focus();
		}
		//번호 삭제펑션
		function hobbyNoDel(){
			$("#hobbyNo").val("");
			$("#hobbyName").val("");
		}
		//삭제를 위한 Btn 메소드
		function forDelete(){
			var hobbyNo = $("#hobbyNo").val();
			var hobbyName = "";
			var hobbyNameCheck = $("#hobbyName").val();
			for(var i = 0; i < $("#hobbyTable").children().eq(0).children().length; i++){
				for(var j = 0; j < $("#hobbyTable").children().eq(0).children().eq(i).children().length; j++){
					var tr = $("#hobbyTable").children().eq(0).children().eq(i);
					if(hobbyNo == tr.children().eq(j)[0].innerText){
						hobbyName = tr.children().eq(j).next()[0].innerText;
					}
				}
			}
			if(hobbyNo == ""){
				swal("삭제할 취미를 골라주세요.",{
					icon : "warning",
					buttons : "확인"
				});
				return;
			}
			if(hobbyName != hobbyNameCheck){
				swal("삭제할 취미의 이름과 번호를 정확히 입력해주세요.",{
					icon : "warning",
					buttons : {
						button : "확인"
					}
				});
				return;
			}
			//var isTrue = confirm("정말로 "+hobbyName+"를 삭제하시겠습니까?");
			
			swal("정말로 "+hobbyName+"를 삭제하시겠습니까?",{
				icon : "warning",
				buttons : ["취소","확인"]
			}).then((YES) => {
				if(YES) {
					$("#delYN").val("Y");
					$("#cateForm").submit();
				} else {
					return;
				}
			});
		}
		//수정 혹은 추가전에 확인하는 메소드
		function updateOrInsert(){
			var hobbyNo = $("#hobbyNo").val();
			var hobbyName;
			var hobbyNameCheck = $("#hobbyName").val();
			
			for(var i = 0; i < $("#hobbyTable").children().eq(0).children().length; i++){
				for(var j = 0; j < $("#hobbyTable").children().eq(0).children().eq(i).children().length; j++){
					var tr = $("#hobbyTable").children().eq(0).children().eq(i);
					if(hobbyNo == tr.children().eq(j)[0].innerText){
						hobbyName = tr.children().eq(j).next()[0].innerText;
					}
				}
			}
			if(hobbyNo == ""){
				for(var i = 0; i < $("#hobbyTable").children().eq(0).children().length; i++){
					for(var j = 0; j < $("#hobbyTable").children().eq(0).children().eq(i).children().length; j++){
						var tr = $("#hobbyTable").children().eq(0).children().eq(i);
						if(hobbyNameCheck == tr.children().eq(j)[0].innerText){
							swal("해당 이름의 취미가 이미 존재합니다.",{
								icon : "warning",
								buttons : "확인"
							});
							return;
						}
					}
				}
				/*var isTrue = confirm(hobbyNameCheck+"를 정말로 추가하시겠습니까?");
				if(isTrue){
					$("#cateForm").submit();
				} else {
					return;
				}*/
				swal(hobbyNameCheck+"를 정말로 추가하시겠습니까?",{
					icon : "info",
					buttons : ["취소","확인"]
				}).then((YES) => {
					if(YES) {
						$("#cateForm").submit();
					} else {
						return;
					}
				});
			} else {
				if(hobbyName == hobbyNameCheck){
					swal("현재이름과 수정하려는 이름이 같습니다.",{
						icon : "warning",
						buttons : "확인"
					});
					return;
				} else {
					/*var isTrue = confirm(hobbyName+"을(를) "+hobbyNameCheck+"로 수정하시겠습니까?");
					if(isTrue){
						$("#cateForm").submit();
					} else {
						return;
					}*/
					swal(hobbyName+"을(를) "+hobbyNameCheck+"로 수정하시겠습니까?",{
						icon : "warning",
						buttons : ["취소","확인"]
					}).then((YES) => {
						if(YES) {
							$("#cateForm").submit();
						} else {
							return;
						}
					});
				}
			}
		}
		
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>