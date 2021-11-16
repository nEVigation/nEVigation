<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.grid {
    display: grid;
    grid-template-columns: 200px auto;
    grid-template-rows: 200px minmax(200px, auto) auto;
    grid-template-areas:
        'header header'
        'leftbar main'
        'footer footer';
    column-gap: 20px;
    row-gap: 20px;
}
.page-header {
  grid-area: header;
}
.page-leftbar {
  grid-area: leftbar;
}

.page-main {
  grid-area: main;
}
.page-footer {
  grid-area: footer;
}
.content {
  color: #242424;
  background-color: #f25fff;
  font-weight: 600;
  text-align: center;
  box-sizing: border-box;
  height: 100%;
  padding: 10px;
}
.warning{
	color: red;
}
</style>      
</head>
<body>
	<div class="container">
		<div class="grid">
			<header class="page-header">
				<div class="content">
					<h1>${nick }님 환영합니다</h1><br>
					<p>${status }</p>
				</div>
			</header>
			<aside class="page-leftbar">
				<div class="content">
					<p><a href="/mypage/chgnick">닉네임 변경</a></p>
					<p><a href="/mypage/chgcar">차량 정보 변경</a></p>
					<p><a href="/mypage/chgpw">비밀번호 변경</a></p>
					<p><a href="/mypage/favorite">즐겨찾기 충전소</a></p>
					<br>
					<p><a href="/mypage/delete">회원 탈퇴</a></p>
				</div>
			</aside>
			<main class="page-main">
				<div class="content">
					<p>Main</p>
				</div>
			</main>
			<footer class="page-footer">
				<div class="content">
					<p>Footer</p>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>