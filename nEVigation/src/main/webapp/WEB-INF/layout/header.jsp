<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale= 1.0">
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

footer {
    background: #1f1f1f;
    left: 0;
    bottom: 0;
    width: 100%;
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    padding: 15px 0;
}

</style>


</head>
<body>


	<nav class="navbar navbar-default">
		<div class="container-fluid">
		<div class="navbar-header">
		
			<button type="button" class="navbar-toggle"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/main">nEVigation</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="nav-item"><a href="/">충전소 찾기<span class="sr-only"></span></a></li>
				<li class="nav-item"><a href="/">길찾기</a></li>
				<li class="nav-item"><a href="/">충전 타입 설명</a></li>
			<!-- 	<li style="background-color:blue;"><a href="/login">로그인</a></li> -->
			
			<!-- 	<div class="dropdown-menu"> 
					<a class="dropdown-item" href="#">Link 1</a> 
					<a class="dropdown-item" href="#">Link 2</a> 
					<a class="dropdown-item" href="#">Link 3</a>
				 </div>

 -->			
			</ul>
 		 <div class="loginBtn" style="float:left; padding:8px;">
				<c:choose>
					<c:when test="${empty login }">
						<a href="/member/join"><button class="btn btn-primary">회원가입</button></a>
						<a href="/member/login"><button class="btn  btn-primary">로그인</button></a>
					</c:when>
					<c:when test="${login eq true }">
						<a href="/member/logout"><button class="btn btn-danger">로그아웃</button></a>
					</c:when>
				</c:choose>
		 </div>
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