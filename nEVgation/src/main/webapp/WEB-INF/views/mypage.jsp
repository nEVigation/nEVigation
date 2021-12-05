<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:import url="../layout/header.jsp" />

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
.container{
	margin-top: 58px;
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
.warning{
	color: red;
}
.table-container{
}
td, th {
	text-align: center;
}
th{
	background-color: azure;
}
tr:hover{
	background-color: #ddd;
}
.content p {
	font-size:20px;
	color:red;
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
				<li><a href="/mypage/chgcar">차량 정보 변경</a></li>
				<li><a href="/mypage/chgpw">비밀번호 변경</a></li>
<!-- 				<li><a href="/mypage/favorite">즐겨찾기 충전소</a></li> -->
				<li><a href="/mypage/delete">회원 탈퇴</a></li>
			</ul>
			</div>
		</aside>
		<main class="page-main">
			<div class="content">

				<br>
				<div class="table-container">
					<table class="table">
						<tr>
							<th>번호</th>
							<th>충전소 이름</th>
							<th>충전소 위치</th>
						</tr>
						<form action="/map" method="POST" id="mapForm">
						<c:forEach items="${list}" var="l" varStatus="status">
							<tr class="station"	data-href="/link/map/${l.station_latitude},${l.station_longitude }">
								<td>${status.count }</td>
								<td>${l.station_name }</td>
								<td>${l.station_loc }</td>
							</tr>
							<input class="goMap" type="hidden" value="${l.station_latitude}" name="station_latitude" />
							<input class="goMap" type="hidden" value="${l.station_longitude }" name="station_longitude" />
							<input class="goMap" type="hidden" value="${l.station_name }" name="station_name" />
						</c:forEach>
						<c:if test="${empty list}">
							<tr>
								<td colspan="3">즐겨찾기한 충전소가 없습니다
							</tr>
						</c:if>
						</form>
					</table>
				</div>
			</div>
		</main>
	</div>
</div>

<script type="text/javascript">
$('.station').click(function() {
	$('#mapForm').submit();
});

// //카카오 map api "/link/map/위도,경도"
// $(document).ready(function($) {
//     $(".station").click(function() {
//         window.location = $(this).data("href");
//     });
// });
</script>	
<c:import url="../layout/footer.jsp" />