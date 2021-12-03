<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale= 1.0">

 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>nEVigation</title>

<style type="text/css">

.header {
	top: 0;
	display: flex;
	width: 100%;
	margin: auto;
	position: fixed;
}

.loginBtn {
display:inline-block;
}

footer {
	display: flex;
    font-size:15px;
    background-color: #f8f8f8;
}

.navbar{
	display:inline-block;
}

@media screen and (max-width: 1450px ){
	.navbar{
	display: inline-block;
	justify-content: space-between;
	align-items: center;
	}
	
@media (max-width: 768px) {
  .navbar-nav>li { display: inline; }
  .menu ul li { border-right: none; }
  .menu ul li:nth-child(1){ border-left: none; }
}

</style>

</head>
<body>

<header>
	<nav class="navbar navbar-default navbar-fixed-top bg-light">
		<div class="container-fluid" >
		<div class="navbar-header" >
			<button type="button" class="navbar-toggle"
			data-toggle="collapse" data-target="#navbar"
			aria-expanded="false">
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/main" >nEVigation</a>
		</div>
		<div class="navbar-collapse collapse" id="navbar">
			<ul class="nav navbar-nav">
				<li class="nav-item"><a href="/">충전소 찾기<span class="sr-only"></span></a></li>
				<li class="nav-item"><a href="/">길찾기</a></li>
				<li class="nav-item"><a href="/">충전 타입 설명</a></li>
			</ul>
 		 <div class="loginBtn" style="float:right; padding:8px; ">
				<c:choose>
					<c:when test="${empty login }">
						<a href="/member/join"><button class="btn btn-primary">회원가입</button></a>
						<a href="/member/login"><button class="btn  btn-primary">로그인</button></a>
					</c:when>
					<c:when test="${login eq true }">
						<a href="/mypage"><button class="btn  btn-primary">MY PAGE</button></a>
						<a href="/member/logout"><button class="btn btn-danger">로그아웃</button></a>
					</c:when>
				</c:choose>
		 </div>
		 </div>
		 </div>
	 	
 			<ul class="nav navbar-nav navbar-right" style="display: none;">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><span class="caret"></span></a>
					<ul class="nav navbar-nav">
						<li class="nav-item"><a href="/">충전소 찾기<span class="sr-only"></span></a></li>
						<li class="nav-item"><a href="/">길찾기</a></li>
						<li class="nav-item"><a href="/">충전 타입 설명</a></li>
					</ul>
			 		 <div class="loginBtn" style="padding:8px;">
						<c:choose>
							<c:when test="${empty login }">
								<a href="/member/join"><button class="btn btn-primary">회원가입</button></a>
								<a href="/member/login"><button class="btn btn-primary">로그인</button></a>
							</c:when>
							<c:when test="${login eq true }">
								<a href="/member/logout"><button class="btn btn-danger">로그아웃</button></a>
							</c:when>
						</c:choose>
		 			</div>
				</li>
			</ul>
		
	</nav>
</header>	