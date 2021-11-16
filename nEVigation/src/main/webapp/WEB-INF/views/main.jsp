<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width", initial-scale="1">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<title>nEVigation</title>

<style type="text/css">
.loginBtn {
display:inline-block;
}
</style>


</head>
<body>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/main">nEVigation</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/">충전소 찾기</a></li>
				<li><a href="/">길찾기</a></li>
				<li><a href="/">충전 타입 설명</a></li>
				<!-- 	<li style="background-color:blue;"><a href="/login">로그인</a></li> -->
			</ul>
			<div class="loginBtn" style="float: left; padding: 8px;">
				<c:choose>
					<c:when test="${empty login }">
						<a href="/member/join"><button class="btn btn-primary">회원가입</button></a>
						<a href="/member/login"><button class="btn  btn-primary">로그인</button></a>
					</c:when>
					<c:when test="${login eq true }">
						<a href="/mypage"><button class="btn btn-primary">개인설정</button></a>
						<a href="/member/logout"><button class="btn btn-danger">로그아웃</button></a>
					</c:when>
				</c:choose>
			</div>
		</div>

		<!-- <ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><span class="caret"></span></a>
				</li>
			</ul> -->

 		
	</nav>
<div class="video-area">
	<video width="100%" src="/resources/video/ev1.mp4" autoplay muted loop></video>
		
</div>




<footer>
<!-- 	<div class="footer_logo">
		<img width=100px; src='/resources/img/header_logo2.png' />
	</div> -->
	<div class="footer_content">
		nEVigation <br> TEAM. 강건, 김준홍, 박정서, 최유리, 최현준<br>
		COPYRIGHT 2021. nEVigation. ALL RIGHTS RESERVED.
	</div>
</footer>

</html>

</body>
</html>

