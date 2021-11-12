<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#emailCheckText{
	color: red;
}
</style>
</head>
<body>
	<div class="container">
		<h1>비밀번호 찾기</h1>
		<hr>
		<div>
			<form action="/password/request" method="post" class="form-horizontal">
				<div class="form-group">
					<label for="userEmail" class="col-xs-3 control-label">이메일 : </label>
					<div class="col-xs-6">
						<input type="text" class="form-control" id="userEmail" name="userEmail"
							placeholder="이메일" />
					</div>
				</div>
				<div class="form-group">
				<div class="col-xs-6 col-xs-offset-3">
					<c:if test="${isNotJoin }">
						<div id="emailCheckText">유효하지 않거나, 가입하지 않은 이메일 입니다</div>
					</c:if>
				</div>
				</div>
				<div class="form-group">
					<div class="col-xs-offset-5">
						<button id="resetPw" class="btn btn-primary">비밀번호 초기화</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>