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

</head>
<body>
	<div class="container">
		<h1>비밀번호 찾기</h1>
		<hr>
		<div>
			<form action="/member/findpassword" method="post" class="form-horizontal">
				<div class="form-group">
					<label for="id" class="col-xs-3 control-label">아이디 : </label>
					<div class="col-xs-6">
						<input type="text" class="form-control" id="id" name="userEmail"
							placeholder="아이디" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>