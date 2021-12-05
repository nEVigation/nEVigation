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

<script type="text/javascript">
$(document).ready(function() {	
	$("#stationActivation").click(function() {
		$.ajax({
			type: "get"
			, url: "/admin/stationActivation"
			, data: { "station_no": '${viewBoard.station_no }' }
			, dataType: "text"
			, success: function(result) {
				console.log("성공");
				alert(result);
				
				$(".lbActivation").toggle();
				$(".stationActivation").toggle();
				$(".lbDisable").toggle();
				$(".stationdisabled").toggle();
			}
			, error: function() {
				console.log("실패");
			}
		}); //ajax end
		
	}); //$("#stationActivation").click() end
	
	$("#stationdisabled").click(function() {
		$.ajax({
			type: "get"
			, url: "/admin/statioDisabled"
			, data: { "station_no": '${viewBoard.station_no }' }
			, dataType: "text"
			, success: function(result) {
				console.log("성공");
				alert(result);
				
				$(".lbActivation").toggle();
				$(".stationActivation").toggle();
				$(".lbDisable").toggle();
				$(".stationdisabled").toggle();
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
	font-weight:bold; 
	color:#404040;
}
#stationUpdate{
	position : relative;
	top : 8px;
	float : right;
	padding : 3px;
	margin-right : 5px;
	width : 50px;
	
	border-radius : 5px;
	border: 0;
	outline: 0;
	background-color : #E2E2E2;
	
	color:#404040;
	font-weight: bold;
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
#stationActivation{
	border-radius : 5px;
	border: 0;
	outline: 0;
	background-color : #404040;
	
	color : white;
	font-weight: bold;
}
#stationdisabled{
	border-radius : 5px;
	border: 0;
	outline: 0;
	background-color : #404040;
	
	color : white;
	font-weight: bold;
}
#stationIcon{
	position: absolute;
	top : 100px;
	margin : 20px 0;
	width: 120px;
/* 	border : 1px solid blue; */
}
#infoVeiw{
	width : 95%; 
	margin: 60px auto;
	padding-top : 20px;
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
	height : 55px;
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

<c:import url="/WEB-INF/views/layout/navigationBar.jsp" />

<div class="container">
<div class="boardContainer">

<span id="title" style="font-size:30px;">주유소 정보</span>
<button id="stationDelete" onclick="location.href='/admin/stationDelete?station_no=${viewBoard.station_no }'">삭제</button>
<button id="stationUpdate" onclick="location.href='/admin/updateStation?station_no=${viewBoard.station_no }'">수정</button>
<hr style="margin-top:0px; float : clear; border: 1px solid #ababab; background-color : #ababab;">

<img id="stationIcon" src = "https://cdn-thumbs.imagevenue.com/a6/05/32/ME142Q65_t.png" alt ="station Icon">

<div id="infoVeiw">
<span id="title" style="position: relative; left : 120px; font-size:25px;">${viewBoard.station_name }</span>
<hr style="margin:0px 40px 17px 20px; border: 1px solid #9e9e9e; background-color : #9e9e9e;">

<table>
	<tr>
		<th>주유소 위치</th>
		<c:set var="Stationaddress" value="${viewBoard.station_address }"/>
		<c:set var="Stationloc" value="${viewBoard.station_loc }"/>
		<c:if test="${fn:contains(Stationloc, Stationaddress)}">
			<td>${Stationloc }</td>
		</c:if>
		
		<c:if test="${!fn:contains(Stationloc, Stationaddress)}">
			<td>${Stationaddress }<br>(${Stationloc })</td>
		</c:if>
	</tr>
	<tr>
		<th>이용가능 시간</th>
		<td>${viewBoard.station_start_time } ~ ${viewBoard.station_end_time }</td>
	</tr>
	<tr>
		<th>충전기 종류</th>
		<td>
			<c:if test="${viewBoard.slow_charger eq 1 || viewBoard.quick_charger eq 1}">
				<c:if test="${viewBoard.slow_charger eq 1}">
					완속 : ${viewBoard.slow_charger_cnt}
				</c:if>
				<c:if test="${viewBoard.quick_charger eq 1}">
					급속 : ${viewBoard.quick_charger_cnt}
				</c:if>
				&ensp;/&ensp;
			</c:if>
			${viewBoard.quick_charger_type }
		</td>
	</tr>
	<tr>
		<th>주차비용 여부</th>
		<c:if test="${viewBoard.parking_fee eq 1}">
			<td>Y</td>
		</c:if>
		<c:if test="${viewBoard.parking_fee != 1}">
			<td>N</td>
		</c:if>
	</tr>
	<tr>
		<th>운영 여부</th>
		<c:if test="${viewBoard.station_state eq 1}">
			<td>
				<label class="lbActivation">운영중&emsp;</label> 
				<button class="stationdisabled" id="stationdisabled">비활성화</button>
				<label class="lbDisable" style="display: none;">운영중단&emsp;</label> 
				<button class="stationActivation" id="stationActivation" style="display: none;">활성화</button>
			</td>
		</c:if>
		<c:if test="${viewBoard.station_state != 1}">
			<td>
				<label class="lbActivation" style="display: none;">운영중&emsp;</label> 
				<button class="stationdisabled" id="stationdisabled" style="display: none;">비활성화</button>
				<label class="lbDisable">운영중단&emsp;</label> 
				<button class="stationActivation" id="stationActivation">활성화</button>
			</td>
		</c:if>
	</tr>
</table>

</div>
<hr style="margin-top:0px; border: 1px solid #ababab; background-color : #ababab;">

</div><!-- .boardContainer -->
</div><!-- .container -->
</div><!-- page. -->

</body>
</html>