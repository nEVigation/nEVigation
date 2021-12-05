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
	border-top : 1.5px solid #E2E2E2;
	border-bottom : 2px solid #E2E2E2;
}

table, th {
	text-align: center;
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

<c:import url="/WEB-INF/views/layout/navigationBar.jsp" />

<div class="container">
<div class="boardContainer">
<span id="title">회원 정보</span>
<span style="text-align: bottom;">total : ${paging.totalCount }</span>
<hr style="margin-top:0px;">

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%;">No.</th>
		<th style="width: 50%;">NickName</th>
		<th style="width: 20%;">회원 타입</th>
		<th style="width: 20%;">활성화여부</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="board">
	<tr>
		<td>${board.user_no }</td>
		<td><a href="/admin/userInfo?user_no=${board.user_no }">${board.user_nick }</a></td>
		<c:if test="${board.user_type eq 'member'}">
			<td>일반 회원</td>
		</c:if>
		<c:if test="${board.user_type eq 'admin'}">
			<td>관리자</td>
		</c:if>
		<td>${board.token }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<c:import url="/WEB-INF/views/layout/pagingUserInfo.jsp" />
<hr>
</div><!-- .boardContainer -->
</div><!-- .container -->
</div><!-- page. -->

</body>
</html>