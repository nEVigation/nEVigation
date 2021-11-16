<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<style type="text/css">
.warning{
	color: red;
}
.order{
	font-weight: bold;
    font-size: large;
}
.hidden{
	display:none;
}
a:hover{
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<h1>차량 정보 변경</h1>
		<hr>
		<div>
			<form id="chargeForm" action="/mypage/chgcar" method="post" class="form-horizontal">
				<div class="form-group">
					<input type=hidden />
					<div class="col-xs-6">
						<div class="order">충전 타입을 변경해 주세요</div>
					</div>
				</div>
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button"
						id="dropdownMenu1" data-toggle="dropdown" aria-expanded="false">
						<c:choose>
							<c:when test="${chargeType ==1}">AC단상(5핀)</c:when> 
							<c:when test="${chargeType ==2}">AC3상(7핀)</c:when> 
							<c:when test="${chargeType ==3}">DC콤보(CSS Type 1)</c:when> 
							<c:when test="${chargeType ==4}">DC콤보(CSS Type 2)</c:when> 
							<c:when test="${chargeType ==5}">차데모</c:when> 
							<c:when test="${chargeType ==6}">슈퍼차저</c:when> 
						</c:choose>
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu"
						aria-labelledby="dropdownMenu1">
						<li role="presentation" value="1" class="chargeType"><a role="menuitem" tabindex="-1"
							>AC단상(5핀)</a></li>
						<li role="presentation" value="2" class="chargeType"><a role="menuitem" tabindex="-1"
							>AC3상(7핀)</a></li>
						<li role="presentation" value="3" class="chargeType"><a role="menuitem" tabindex="-1"
							>DC콤보(CSS Type 1)</a></li>
						<li role="presentation" value="4" class="chargeType"><a role="menuitem" tabindex="-1"
							>DC콤보(CSS Type 2)</a></li>
						<li role="presentation" value="5" class="chargeType"><a role="menuitem" tabindex="-1"
							>차데모</a></li>
						<li role="presentation" value="6" class="chargeType"><a role="menuitem" tabindex="-1"
							>슈퍼차저</a></li>
					</ul>
				</div>
				<div class="help-container">
					<span class="helpicon material-icons" style="margin-top: 5px;">help</span>
					<div id="helppannel" class="hidden">
						<img class="chargeImg" width="600px" src="/resources/image/charger_type.png" /> 
					</div>
				</div>
				<div class="form-group hidden">
					<div class="col-xs-offset-5">
						<button id="chgCar" class="btn btn-primary">돌아가기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
$('.chargeType').click(function(){
    $('<input />').attr('type', 'hidden')
        .attr('name', 'chargeTypeNo')
        .attr('value', $(this).val())
        .appendTo('#chargeForm');
    $('#chargeForm').submit();
});
$(document).on("mouseenter",".helpicon",function(){
	$('#helppannel').addClass('hidden');
	$(this).next('#helppannel').removeClass('hidden');
});

$(document).on("mouseleave","#helppannel", function(){
	$(this).addClass('hidden');
});
</script>
</html>