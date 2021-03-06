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

<style type="text/css">
.container {
	float : right;
	padding : 50px 10%;
	min-height: 400px;
	width : 80%; 
	display : flex;
	justify-content: center;
/* 	border: 1px solid red; */
}
table {
	table-layout: fixed;
	border-top : 1px solid #E2E2E2;
	border-bottom : 1px solid #E2E2E2;
}

table, th {
	text-align: center;
}
td{
	text-overflow: ellipsis;
}
#title{
	margin-right : 10px;	
	font-size:30px;
	font-weight:bold; 
	color:#404040;
}
</style>

</head>
<body>

<div class="page">

<c:import url="/WEB-INF/layout/navigationBar.jsp" />

<div class="container">
<div class="boardContainer">
<span id="title">충전소 리뷰</span>
<span style="text-align: bottom;">total : ${paging.totalCount }</span>
<hr style="margin-top:0px; float : clear;">

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 15%;">No.</th>
		<th style="width: 50%;">리뷰내용</th>
		<th style="width: 30%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="board">
	<tr>
		<td>${board.review_no }</td>
		<td><a href="/admin/stationReview?review_no=${board.review_no }">${board.review_content }</a></td>
		<td>${board.review_date }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<c:import url="/WEB-INF/layout/pagingStationReview.jsp" />
<hr style="margin:0 auto;">

</div><!-- .boardContainer -->
</div><!-- .container -->
</div><!-- page. -->

</body>
</html>