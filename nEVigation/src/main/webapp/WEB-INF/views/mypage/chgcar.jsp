<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../../layout/header.jsp" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style type="text/css">
.grid {
    display: grid;
    grid-template-columns: 200px auto;
    grid-template-rows: 130px minmax(130px, auto) auto;
    grid-template-areas:
        'header header'
        'leftbar main'
        'footer footer';
    column-gap: 20px;
    row-gap: 20px;
}
.page-header {
  grid-area: header;
  margin: 0;
}
.page-leftbar {
  grid-area: leftbar;
}

.page-main {
  grid-area: main;
}
.content {
  color: #242424;
  background-color: none;
  font-weight: 600;
  text-align: center;
  box-sizing: border-box;
  height: 100%;
  padding: 10px;
}
#navi li{
	list-style-type: none;
	margin: 20px 0 20px 0;
	font-size: 1.3em;
}
.warning {
	color: red;
}
.order {
	font-weight: bold;
	font-size: large;
}
.helpicon {
	font-size:24px;
}
.hidden {
	display: none;
}
a:hover {
	cursor: pointer;
}
.chargeType {
	margin: 5px;
}
.active{
    background: gainsboro;
    padding: 8px;
    color: black;
    border-radius: 15px;
    font-weight: 800;
}
</style>

<div class="container">
	<div class="grid">
		<header class="page-header">
			<div class="content">
				<h1>${nick }님 환영합니다</h1>
				<div style="font-size:15px;">충전타입 : ${chargeTypeName }</div>
				<p>${status }</p>
			</div>
		</header>
		<aside class="page-leftbar">
			<div class="content">
			<ul id="navi">			
				<li><a href="/mypage/chgnick">닉네임 변경</a></li>
				<li><a href="/mypage/chgcar" class="active">차량 정보 변경</a></li>
				<li><a href="/mypage/chgpw">비밀번호 변경</a></li>
<!-- 				<li><a href="/mypage/favorite">즐겨찾기 충전소</a></li> -->
				<li><a href="/mypage/delete">회원 탈퇴</a></li>
			</ul>
			</div>
		</aside>
		<main class="page-main">
			<div class="content">
	<div class="order">
		현재 충전타입 :
		<c:choose>
			<c:when test="${chargeType ==1}">AC단상(5핀)</c:when>
			<c:when test="${chargeType ==2}">AC3상(7핀)</c:when>
			<c:when test="${chargeType ==3}">DC콤보(CSS Type 1)</c:when>
			<c:when test="${chargeType ==4}">DC콤보(CSS Type 2)</c:when>
			<c:when test="${chargeType ==5}">차데모</c:when>
			<c:when test="${chargeType ==6}">슈퍼차저</c:when>
		</c:choose>
	</div>
	<br>
	<div class="">
		<form id="chargeForm" action="/mypage/chgcar" method="post"	class="form-horizontal">
			<input type=hidden />
			<button id="type1" value="1" class="chargeType btn">AC단상(5핀)</button>
			<button id="type2" value="2" class="chargeType btn">AC3상(7핀)</button>
			<button id="type3" value="3" class="chargeType btn">DC콤보(CSS Type 1)</button>
			<br>
			<button id="type4" value="4" class="chargeType btn">DC콤보(CSS Type 2)</button>
			<button id="type5" value="5" class="chargeType btn">차데모</button>
			<button id="type6" value="6" class="chargeType btn">슈퍼차저</button>

			<div class="form-group hidden">
				<div class="col-xs-offset-5">
					<button id="chgCar" class="btn btn-primary">돌아가기</button>
				</div>
			</div>
		</form>
	</div>
	<br>
	<div class="helpicon">
		타입 구분 방식
		<span class="helpicon material-icons" style="margin-top: 5px;">help</span>
		<div id="helppannel" class="hidden">
			<img class="chargeImg" width="600px" src="/resources/image/charger_type.png" />
		</div>
	</div>
</div>
</main>
</div>
</div>
<script type="text/javascript">
	$('.chargeType').click(	
			function() {
				$('<input />').attr('type', 'hidden').attr('name',
						'chargeTypeNo').attr('value', $(this).val()).appendTo(
						'#chargeForm');
				$('#chargeForm').submit();
	});
	$(document).on("mouseenter", ".helpicon", function() {
		$('#helppannel').addClass('hidden');
		$(this).next('#helppannel').removeClass('hidden');
	});

	$(document).on("mouseleave", "#helppannel", function() {
		$(this).addClass('hidden');
	});
	$(document).ready(function(){
		var chargeType = "${sessionScope.chargeType}"
		if($('#type1').val()==chargeType){$('#type1').addClass('btn-primary');}
		if($('#type2').val()==chargeType){$('#type2').addClass('btn-primary');}
		if($('#type3').val()==chargeType){$('#type3').addClass('btn-primary');}
		if($('#type4').val()==chargeType){$('#type4').addClass('btn-primary');}
		if($('#type5').val()==chargeType){$('#type5').addClass('btn-primary');}
		if($('#type6').val()==chargeType){$('#type6').addClass('btn-primary');}
	})
</script>
<c:import url="../../layout/footer.jsp" />