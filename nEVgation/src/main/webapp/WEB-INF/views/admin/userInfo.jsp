<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {	
	$("#userBlock").click(function() {
		$.ajax({
			type: "get"
			, url: "/admin/userBlock"
			, data: { "user_no": '${viewBoard.user_no }' }
			, dataType: "text"
			, success: function(result) {
				console.log("성공");
				alert(result);
				
				$("#userBlock").toggle();
				$("#userUnblock").toggle();
				$("#lbToken").text('N');

			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#stationActivation").click() end
	$("#userUnblock").click(function() {
		$.ajax({
			type: "get"
			, url: "/admin/userUnblock"
			, data: { "user_no": '${viewBoard.user_no }' }
			, dataType: "text"
			, success: function(result) {
				console.log("성공");
				alert(result);
				
				$("#userBlock").toggle();
				$("#userUnblock").toggle();
				$("#lbToken").text('Y');
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#stationActivation").click() end
});
</script>

<style type="text/css">
.container {
	float : right;
	padding : 50px 10%;
	min-height: 400px;
	width : 80%; 
	display : flex;
	justify-content: center;
/*  	border: 1px solid red; */
}
.boardContainer{
/* 	border: 1px solid blue; */
	width : 100%;
}
#title{
	margin-right : 10px;	
	font-size:30px;
	font-weight:bold; 
	color:#404040;
}
#userBlock{
	position : relative;
	top : 15px;
	float : right;
	padding : 3px;
	margin-right : 5px;
	
	border-radius : 5px;
	border: 0;
	outline: 0;
	background-color : #E2E2E2;
	
	color:#404040;
	font-weight: bold;
}
#userUnblock{
	position : relative;
	top : 15px;
	float : right;
	padding : 3px;
	margin-right : 5px;
	
	border-radius : 5px;
	border: 0;
	outline: 0;
	background-color : #E2E2E2;
	
	color:#404040;
	font-weight: bold;
}
#userDelete{
	position : relative;
	top : 15px;
	float : right;
	padding : 3px;
	
	border-radius : 5px;
	border: 0;
	outline: 0;
	background-color : #404040;
	
	color : white;
	font-weight: bold;
}
#userIcon{
	position: absolute;
	top : 100px;
	margin : 20px 0;
	width: 120px;
/* 	border : 1px solid blue; */
}
#infoVeiw{
	width : 95%; 
	margin: 60px auto;
	padding-top : 10px;
	padding-bottom : 15px;
	border-radius : 15px;
	background-color : #E2E2E2;
/* 	border : 1px solid blue; */
}
table {
	width : 70%; 
	margin: 0 8% 0 22%;
}
tr{
	height : 40px;
/*  	border: 1px solid red; */
}
th{
	width : 25%;
	font-weight: bold;
	font-size: 17px;
/* 	border: 1px solid red; */
}
td{
	width : 45%;
/* 	border: 1px solid green; */
}
</style>

</head>
<body>

<div class="page">

<c:import url="/WEB-INF/layout/navigationBar.jsp" />

<div class="container">
<div class="boardContainer">

<span id="title">회원 정보</span>
<button id="userDelete" onclick="location.href='/admin/userDelete?user_no=${viewBoard.user_no }'">회원 삭제</button>
<c:if test="${viewBoard.token eq 'Y'}">
	<button id="userBlock">회원 블락</button>
	<button id="userUnblock" style="display: none;">회원 블락 해제</button>
</c:if>
<c:if test="${viewBoard.token eq 'N'}">
	<button id="userBlock" style="display: none;">회원 블락</button>
	<button id="userUnblock">회원 블락 해제</button>
</c:if>

<hr style="margin-top:0px; float : clear; border: 1px solid #ababab; background-color : #ababab;">

<img id="userIcon" src = "https://i.imgur.com/kdzYdO8.png" alt ="user Icon">

<div id="infoVeiw">
<span id="title" style="position: relative; left : 120px;">${viewBoard.user_nick }</span>
<hr style="margin:0px 40px 10px 20px; border: 1px solid #9e9e9e; background-color : #9e9e9e;">

<table>
	<tr>
		<th>이메일</th>
		<td>${viewBoard.user_email }</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${viewBoard.user_pw }</td>
	</tr>
	<tr>
		<th>회원 타입</th>
		<c:if test="${viewBoard.user_type eq 'member'}">
			<td>일반 회원</td>
		</c:if>
		<c:if test="${viewBoard.user_type eq 'admin'}">
			<td>관리자</td>
		</c:if>
	</tr>
	<tr>
		<th>충전 타입</th>
		<td>${chargeType }</td>
	</tr>
	<tr>
		<th>활성화여부</th>
		<td>
			<label id="lbToken" name="lbToken">${viewBoard.token }</label>
		</td>
	</tr>
</table>

</div>
<hr style="margin-top:0px; border: 1px solid #ababab; background-color : #ababab;">

</div><!-- .boardContainer -->
</div><!-- .container -->
</div><!-- page. -->

</body>
</html>