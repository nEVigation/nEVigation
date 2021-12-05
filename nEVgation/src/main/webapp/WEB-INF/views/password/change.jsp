<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:import url="../../layout/header.jsp" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

	<div class="container">
		<h1>비밀번호 변경</h1>
		<hr>
		<div>
			<form action="/password/change" method="post" class="form-horizontal">
				<div class="form-group">
					<label for="password1" class="col-xs-3 control-label">신규 비밀번호 : </label>
					<div class="col-xs-6">
						<input type="text" class="form-control" id="password1" name="password"
							placeholder="비밀번호" />
					</div>
				</div>
				<div class="form-group">
					<label for="password2" class="col-xs-3 control-label">비밀번호 확인 : </label>
					<div class="col-xs-6">
						<input type="text" class="form-control" id="password2" name="password2"
							placeholder="비밀번호" />
					</div>
				</div>
				<div class="form-group">
					<div id="pwCheck" class="col-xs-6 col-xs-offset-3"></div>
				</div>
				<div class="form-group">
					<div class="col-xs-offset-5">
						<button id="changePw" class="btn btn-primary">비밀번호 변경</button>
					</div>
				</div>
			</form>
		</div>
	</div>

<script type="text/javascript">
$("input").keyup(function(){
// 	console.log("keyup detected");
	let pw1 = $("#password1").val();
	let pw2 = $("#password2").val();
// 	console.log("pw1 : " + pw1 + ", pw2 : " + pw2);
	if(pw1 == "" || pw2 == ""){
		$("#pwCheck").html("");
	} else {
		if (pw1 == pw2) {
			$("#pwCheck").html("비밀번호가 일치합니다");
			$("#pwCheck").css( "color", "blue" );
		} else {
			$("#pwCheck").html("비밀번호가 일치하지 않습니다");
			$("#pwCheck").css( "color", "red" );
		}
	}
});
</script>

<c:import url="../../layout/footer.jsp" />