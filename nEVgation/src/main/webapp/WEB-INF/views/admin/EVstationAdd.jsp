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
	//완속
	$('#slowCharger').click(function(){
		var checked = $('#slowCharger').is(':checked');
		if(checked){
// 			alert('체크됨');
			
			$(this).parent().children(".slowChargerCnt").toggle();
			$(this).parent().children(".LabchargeSlowCnt").toggle();	
		}
		if(!checked){
// 			alert('체크안됨');
			
			$(this).parent().children(".slowChargerCnt").toggle();
			$(this).parent().children(".LabchargeSlowCnt").toggle();
		}
	});
	
	//급속
	$('#quickCharger').click(function(){
		var checked = $('#quickCharger').is(':checked');
		if(checked){
// 			alert('체크됨');
			
			$(this).parent().children(".quickChargerCnt").toggle();
			$(this).parent().children(".LabchargeFastCnt").toggle();	
		}
		if(!checked){
// 			alert('체크안됨');
			
			$(this).parent().children(".quickChargerCnt").toggle();
			$(this).parent().children(".LabchargeFastCnt").toggle();	
		}
	});
	
	//주차비
// 	$('#parkingFeeExist').click(function(){
// 		checkedPark = $('#parkingFeeExist').is(':checked');
// 		if(checked){
// 			alert('체크됨');
			
// 			$(this).parent().children(".parking_fee").toggle();
// 			$(this).parent().children(".LabparkingFee").toggle();	
// 		}
// 		if(!checked){
// 			alert('체크안됨');
			
// 			$(this).parent().children(".parking_fee").toggle();
// 			$(this).parent().children(".LabparkingFee").toggle();
// 		}
// 	});
	
	//추가
	$("#stationAdd").click(function() {
		
		if(document.stationForm.station_name.value == ""){
			alert("충전소 이름을 입력해주세요");
			return document.stationForm.station_name.focus();
		}
		
		if(document.stationForm.station_loc.value == ""){
			alert("충전소 위치를 입력해주세요");
			return document.stationForm.station_loc.focus();
		}
		
		if(document.stationForm.station_address.value == ""){
			alert("설치시도명을 입력해주세요");
			return document.stationForm.station_address.focus();
		}
		
		if(document.stationForm.station_latitude.value == ""){
			alert("위도를 입력해주세요");
			return document.stationForm.station_latitude.focus();
		}
		
		if(document.stationForm.station_longitude.value == ""){
			alert("경도를 입력해주세요");
			return document.stationForm.station_longitude.focus();
		}
		
		if(document.stationForm.stationStartTime.value == ""){
			alert("이용가능 시간을 입력해주세요");
			return document.stationForm.stationStartTime.focus();
		}
		
		if(document.stationForm.stationEndTime.value == ""){
			alert("이용가능 시간을 입력해주세요");
			return document.stationForm.stationEndTime.focus();
		}
		
		var checked = $('#slowCharger').is(':checked');
		if(checked){
			if(document.stationForm.slowChargerCnt.value == ""){
				alert("완속 충전기 수를 입력해 주세요");
				return document.stationForm.slowChargerCnt.focus();
			}
		}
		
		var checked = $('#quickCharger').is(':checked');
		if(checked){
			if(document.stationForm.quickChargerCnt.value == ""){
				alert("급속 충전기 수를 입력해 주세요");
				return document.stationForm.quickChargerCnt.focus();
			}
		}
		
		
		var array = new Array();
		$('input:checkbox[name=chargeType]:checked').each(function(){
			array.push(this.value);
		});
	
		$("#arrayParam").val(array);
		if(document.stationForm.arrayParam.value == ""){
			alert("충전기 종류를 체크해주세요");
			return document.stationForm.arrayParam.focus();	
		}
		
		$("form").submit();
	})
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
#stationAdd{
	position : relative;
	top : 15px;
	float : right;
	padding : 3px;
	
	border-radius : 5px;
	border: 0;
	outline: 0;
	background-color : #404040;
	width : 50px;
	
	color : white;
	font-weight: bold;
}
#stationForm{
	width : 95%; 
	margin: 30px auto;
	padding-top : 10px;
	padding-bottom : 15px;
	border-radius : 15px;
	background-color : #E2E2E2;
/*  	border : 1px solid blue; */
}
.form-group{
 	width : 80%;
 	margin: 15px auto;
 	/*  	border : 1px solid red; */
}
</style>

</head>
<body>

<div class="page">

<c:import url="/WEB-INF/views/layout/navigationBar.jsp" />

<div class="container">
<div class="boardContainer">

<span id="title">충전소 추가</span>
<button id="stationAdd">추가</button>
<hr style="margin-top:0px; float : clear; border: 1px solid #ababab; background-color : #ababab;">

<div id="stationForm">
<form name="stationForm" class="form-stationAdd" action="/admin/EVstationAdd" method="post">
<div class="form-group">
	<label for="station_name">충전소 이름</label>
	<input type="text" id="station_name" name="station_name" class="form-control"/>
</div>
<div class="form-group">
	<label for="station_loc">충전소 위치</label>
	<input type="text" id="station_loc" name="station_loc" class="form-control"/>
</div>
<div class="form-group">
	<label for="station_address">설치시도명</label>
	<input type="text" id="station_address" name="station_address" class="form-control"/>
</div>
<div class="form-group">
	<label for="station_latitude">위도</label>
	<input type="number" id="station_latitude" name="station_latitude" class="form-control"/>
</div>
<div class="form-group">
	<label for="station_longitude">경도</label>
	<input type="number" id="station_longitude" name="station_longitude" class="form-control"/>
</div>
<div class="form-group">
	<label>이용가능시간</label><br>
	<input type="time" id="stationStartTime" name="stationStartTime" class="form-control" style="width:48%; display: inline;" value="00:00"/>
	~
	<input type="time" id="stationEndTime" name="stationEndTime" class="form-control" style="width:48%; display: inline;" value="23:59"/>
</div>
<div class="form-group">
	<label>충전기 종류</label>
	<hr style="margin:0px; float : clear; border: 1px solid #ababab; background-color : #ababab;">
	
	<label>완속</label>
	<input type="checkbox" id="slowCharger" name="slowCharger" value="slowOn"/>
	<label class="LabchargeSlowCnt" style="display: none; margin-left: 20px;">충전기 개수</label>
	<input type="number" class="slowChargerCnt" id="slowChargerCnt" name="slowChargerCnt" style="display : none;" />
	<br>
	
	<label>급속</label>
	<input type="checkbox" id="quickCharger" name="quickCharger" value="fastOn"/>
	<label class="LabchargeFastCnt" style="display: none; margin-left: 20px;">충전기 개수</label>
	<input type="number" class="quickChargerCnt" id="quickChargerCnt" name="quickChargerCnt" style="display : none;" />
	<br>
	
	<input type="hidden" id="arrayParam" name="arrayParam" />
	<c:forEach items="${list }" var="chargeList">
		<label style="width: 140px;">${chargeList.charge_type }
			<input type="checkbox" name="chargeType" style="" value="${chargeList.charge_type }"/>
		</label>
	</c:forEach>
	<hr style="margin:0px; float : clear; border: 1px solid #ababab; background-color : #ababab;">
</div>
<div class="form-group">	
	<label>주차비용 존재 여부</label>
	<input type="checkbox" id="parkingFeeExist" name="parkingFeeExist" value="parkOn"/>
<!-- 	<label class="LabparkingFee" style="display: none; margin-left: 20px;">주차비</label> -->
<!-- 	<input type="number" class="parking_fee" style="display : none;" /> -->
</div>
</form>

</div>
<hr style="margin-top:0px; border: 1px solid #ababab; background-color : #ababab;">

</div><!-- .boardContainer -->
</div><!-- .container -->
</div><!-- page. -->

</body>
</html>