<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
/*  	border: 1px solid blue; */
	width : 100%;
}
#title{	
	margin-right : 10px;	
	font-size:30px;
	font-weight:bold; 
	color:#404040;
}
#stationDelete{
	position : relative;
	top : 8px;
	float : right;
	padding : 3px;
	width : 50px;
	
	border-radius : 5px;
	border: 0;
	outline: 0;
	background-color : #404040;
	
	color : white;
	font-weight: bold;
}
#infoVeiw{
	width : 100%; 
/* 	border : 1px solid red; */
}

td .active{
	width: 20%;
	font-weight: bold;
}
td:not(.active) {
	width: 30%;
}
#backList{
	position : relative;
	top : 15px;
	float : right;
	padding : 3px;
	margin-right : 5px;
	
	border-radius : 5px;
	border: 0;
	outline: 0;
	width : 55px;
	background-color : #404040;
	
	color : white;
	font-weight: bold;
}
#goTop{
	position : relative;
	top : 15px;
	float : right;
	padding : 3px;
	
	border-radius : 5px;
	border: 0;
	outline: 0;
	width : 55px;
	background-color : #E2E2E2;
	
	color:#404040;
	font-weight: bold;
}
</style>

</head>
<body>

<div class="page">

<c:import url="/WEB-INF/views/layout/navigationBar.jsp" />

<div class="container">
<div class="boardContainer">

<span id="title">${viewBoard.report_title }</span>
<button id="stationDelete" onclick="location.href='/admin/reportDelete?report_no=${viewBoard.report_no }'">삭제</button>
<hr style="margin-top:0px; float : clear; border: 1px solid #ababab; background-color : #ababab;">

<div class="table-responsive" id="infoVeiw">
<table class="table table-bordered">
<tr>
	<td class="active">글번호</td><td>${viewBoard.report_no }</td>
	<td class="active">확인 여부</td>
	<c:if test="${viewBoard.report_check eq 0}">
		<td id="reportCheck">N</td>
	</c:if>
	<c:if test="${viewBoard.report_check eq 1}">
		<td id="reportCheck">Y</td>
	</c:if>
</tr>
<tr>
	<td class="active">작성자</td><td><a href="/admin/userInfo?user_no=${viewBoard.user_no }">${userNick }</a></td>
	<td class="active">작성일</td><td>${viewBoard.report_date }</td>
</tr>
<tr>
	<td class="active">충전소 명</td><td colspan="3"><a href="/admin/EVstationInfo?station_no=${viewBoard.station_no }">${stationName }</a></td>
</tr>
<tr>
	<td class="active" colspan="4">제보 내용</td>
</tr>
<tr>
	<td colspan="4">${viewBoard.report_content }</td>
</tr>
</table>
</div>

<hr style="margin:0 auto; border: 1px solid #ababab; background-color : #ababab;">
<button id="goTop" onclick="location.href='#'">&#9650TOP</button>
<button id="backList" onclick="location.href='/admin/stationReportList'">목록</button>


</div><!-- .boardContainer -->
</div><!-- .container -->
</div><!-- page. -->

</body>
</html>