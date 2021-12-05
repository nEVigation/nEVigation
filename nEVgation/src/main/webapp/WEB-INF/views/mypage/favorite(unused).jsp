<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:import url="../../layout/header.jsp" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<style type="text/css">
.warning{
	color: red;
}
table{
	width:60%;
	border-collapse: collapse;
}
td, th {
	border: 1px solid black;
	padding: 8px;
	text-align: center;
}
th{
	background-color: azure;
}
tr:hover{
	background-color: #ddd;
}

</style>
</head>
<body>
	<div class="container">
		<h1>즐겨찾는 충전소</h1>
		<hr>
		<div>
			<table>
				<tr>
					<th>번호</th>
					<th>충전소 이름</th>
					<th>충전소 위치</th>
				</tr>
				<c:forEach items="${list}" var="l" varStatus="status">
					<tr class="station" data-href="/link/map/${l.station_latitude},${l.station_longitude }">
						<td>${status.count }</td>
						<td>${l.station_name }</td>
						<td>${l.station_loc }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

<script type="text/javascript">
//카카오 map api "/link/map/위도,경도"
$(document).ready(function($) {
    $(".station").click(function() {
        window.location = $(this).data("href");
    });
});
</script>
<c:import url="../../layout/footer.jsp" />