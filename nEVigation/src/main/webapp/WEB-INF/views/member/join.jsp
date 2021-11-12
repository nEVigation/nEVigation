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

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

<style type="text/css">
.hidden {
	display: none;
}
.help-container{
	display: inline-flex;
}
#helppannel{
	border: 1px solid grey;
	position:absolute;
	width: 20%;
	height: 20%;
	background-color:white;
}

</style>     
    
</head>
<body>
	<div class="container">
		<h1>회원가입 페이지</h1>
		<hr>
		<div id="joinForm" class="">
			<form action="/member/join" method="post" class="form-horizontal">
				<div class="form-group">
					<label for="id" class="col-xs-4 control-label">아이디 : </label>
					<div class="col-xs-4">
						<input type="text" class="form-control" id="id" name="userEmail"
							placeholder="아이디" />
					</div>
					<div class="help-container">
						<input id="emailCheck" type="button" value="중복확인" />
						<div class="hidden" id="emailCheckText"></div>
					</div>
				</div>
				<div class="form-group">
					<label for="nick" class="col-xs-4 control-label">닉네임 : </label>
					<div class="col-xs-4">
						<input type="text" class="form-control" id="nick" name="userNick"
							placeholder="아이디" />
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-xs-4 control-label">비밀번호 :
					</label>
					<div class="col-xs-4">
						<input type="text" class="form-control" id="password" name="userPw" placeholder="비밀번호" />
					</div>
				</div>
				<div class="form-group">
					<label for="chargeTypeSelector" class="col-xs-4 control-label" >충전타입 : </label>
					<div class="col-xs-4">
						<select class="form-control" name="chargeTypeNo">
							<option value="1">1 - AC단상 5핀</option>
							<option value="2">2 - AC3상 7핀 급속</option>
							<option value="3">3 - AC3상 7핀 완속</option>
							<option value="4">4 - DC차데모 10핀</option>
							<option value="5">5 - DC콤보 7핀</option>
						</select>
					</div>
					<div class="help-container">
					<span class="helpicon material-icons" style="margin-top: 5px;">help</span>
						<div class="hidden" id="helppannel">
							타입관련 설명 창 
						</div>
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<div class="col-xs-offset-5">
						<button class="btn btn-primary">회원가입</button>
						<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
$(document).on("mouseenter",".helpicon",function(){
	$('#helppannel').addClass('hidden');
	$(this).next('#helppannel').removeClass('hidden');
});

$(document).on("mouseleave","#helppannel", function(){
	$(this).addClass('hidden');
});

$(document).on("click","#emailCheck", function(){
	checkEmail();
});

function checkEmail(){
	var data;
	data = $("input#id").val();
	console.log(data);
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "/member/checkemail",
		data : JSON.stringify(data),
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			console.log("SUCCESS: ", data);
			$("#emailCheckText").removeClass('hidden');
			if(data > 0){
				$("#emailCheckText").html("이미 등록된 이메일 입니다");
			} else {
				$("#emailCheckText").html("사용 가능한 이메일 입니다");
			}
		},
		error : function(e) {
			console.log("ERROR: ", e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
}
</script>

</html>