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
						<div class="warning">유효하지 않거나, 가입하지 않은 이메일 입니다</div>
					</c:if>
					<c:if test="${status ne null }">
						<div class="warning">올바르지 않은 요청입니다. 다시 시도해 주기기 바랍니다</div>
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
	
<c:import url="../../layout/footer.jsp" />