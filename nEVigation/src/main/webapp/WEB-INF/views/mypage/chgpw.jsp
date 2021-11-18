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
.order{
	font-weight: bold;
    font-size: large;
}
</style>

	<div class="container">
		<h1>비밀번호 변경</h1>
		<hr>
		<div>
			<form action="/mypage/chgpw" method="post" class="form-horizontal">
				<div class="form-group">
				<div class="col-xs-6 col-xs-offset-3">
					<div class="order">현재 비밀번호와 변경할 비밀번호를 입력해주세요</div>
				</div>
				</div>
				<div class="form-group">
					<label for="userPw" class="col-xs-3 control-label">현재 비밀번호 입력 : </label>
					<div class="col-xs-6">
						<input type="text" class="form-control" id="userPw" name="userPw"
							placeholder="현재 비밀번호" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-6 col-xs-offset-3">
						<c:if test="${status == 2}">
							<div class="warning">비밀번호가 올바르지 않습니다</div>
						</c:if>
					</div>
				</div>
				<div class="form-group">
					<label for="newPw" class="col-xs-3 control-label">변경 비밀번호 입력 : </label>
					<div class="col-xs-6">
						<input type="text" class="form-control" id="newPw" name="newPw"
							placeholder="변경 비밀번호" />
					</div>
				</div>
				<br>
				<div class="form-group">
					<div class="col-xs-offset-5">
						<button id="chgPw" class="btn btn-primary">비밀번호 변경 변경</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
<c:import url="../../layout/footer.jsp" />