<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:import url="../../layout/header.jsp" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<style type="text/css">
.warning{
	color: red;
}

</style>
</head>
<body>
	<div class="container">
		<h1>회원 탈퇴</h1>
		<hr>
		<div>
			<form action="/mypage/delete" method="post" class="form-horizontal">
				<div class="form-group">
				<div class="col-xs-6 col-xs-offset-3">
					<div class="warning">회원 탈퇴는 되돌릴 수 없습니다. 정말로 탈퇴하시겠습니까?</div>
				</div>
				</div>
				<div class="form-group">
					<label for="userPw" class="col-xs-3 control-label">비밀번호 확인 : </label>
					<div class="col-xs-6">
						<input type="text" class="form-control" id="userPw" name="userPw"
							placeholder="비밀번호 확인" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-offset-5">
						<button id="resetPw" class="btn btn-danger">회원 탈퇴</button>
					</div>
				</div>
			</form>
		</div>
	</div>

<c:import url="../../layout/footer.jsp" />