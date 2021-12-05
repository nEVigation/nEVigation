<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 메인 페이지</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">

<h1>임시 메인페이지 입니다</h1>
<hr>

<div>
<c:choose>
	<c:when test="${empty login }">
		<a href="/member/join"><button class="btn btn-primary">회원가입</button></a>
		<a href="/member/login"><button class="btn  btn-primary">로그인</button></a>
	</c:when>
	<c:when test="${login eq true }">
		<a href="/member/logout"><button class="btn btn-danger">로그아웃</button></a>
	</c:when>
</c:choose>

<hr>
<a href="/board/list">목록</a>

</div>
</div>
</body>
</html>