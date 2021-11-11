<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>

<div class="container">

<h1>로그인 페이지</h1>
<hr>

<div id="loginForm">
<form action="/member/login" method="post" class="form-horizontal">
<div class="form-group">
	<label for="id" class="col-xs-3 control-label">아이디 : </label>
	<div class="col-xs-6">
		<input type="text" class="form-control" id="id" name="userEmail" placeholder="아이디" />
	</div>
</div>
<div class="form-group">
	<label for="password" class="col-xs-3 control-label">비밀번호 : </label>
	<div class="col-xs-6">
		<input type="text" class="form-control" id="password" name="userPw" placeholder="비밀번호" />
	</div>
</div>
<div class="form-group">
	<div class="col-xs-offset-5">
		<button class="btn btn-primary">로그인</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
</div>
</form>

</div>

</div>

</body>
</html>