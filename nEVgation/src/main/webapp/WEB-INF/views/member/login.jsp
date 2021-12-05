<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:import url="../../layout/header.jsp" />

<style type="text/css">
.hidden {
	display: none;
}
.container{
	margin-top: 58px;
}
.emailCheckText{
	display: inline-flex;
	color: red;
}
.text-right{
	text-align: right;
}
#findPw:hover{
	cursor:pointer;
}
</style>

	<div class="container">
		<h1 class="text-center">로그인</h1>
		<c:if test="${status == 4}">
			<div class="text-center" style="color:blue; font-size:24px">회원가입 완료</div>
		</c:if>
		<hr>
		<div id="loginForm">
			<form action="/member/login" method="post" class="form-horizontal">
				<div class="form-group">
					<label for="id" class="col-xs-3 control-label">아이디 : </label>
					<div class="col-xs-6">
						<input type="text" required class="form-control" id="id" name="userEmail"
							placeholder="아이디" value="${tempEmail }"/>
					</div>
					<div class="col-xs-6 col-xs-offset-3">
						<c:if test="${status == 2}">
							<div class="emailCheckText">입력한 이메일이 존재하지 않습니다</div>
						</c:if>
					</div>

				</div>
				<div class="form-group">
					<label for="password" class="col-xs-3 control-label">비밀번호 :
					</label>
					<div class="col-xs-6">
						<input type="text" required class="form-control" id="password"
							name="userPw" placeholder="비밀번호" />
					</div>
					<div class="col-xs-6 col-xs-offset-3">
						<c:if test="${status == 3}">
							<div class="emailCheckText">입력한 비밀번호가 올바르지 않습니다</div>
						</c:if>
					</div>
				</div>
				<div class="form-group text-right">
					<div class="col-xs-6 col-xs-offset-3">
					<a id="findPw">비밀번호 찾기</a>					
					</div>
				</div>
				<div class="text-center form-group">
					<div class="">
						<button class="btn btn-primary">로그인</button>
						<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
					</div>
				</div>
			</form>

		</div>

	</div>
<script type="text/javascript">
$(document).on("click","#findPw", function(){
	console.log("findPw clicked");
	location.href="/password/request"
});
</script>
<c:import url="../../layout/footer.jsp" />