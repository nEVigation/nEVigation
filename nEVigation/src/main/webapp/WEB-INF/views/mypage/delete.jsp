<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:import url="../../layout/header.jsp" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
<style type="text/css">
.grid {
    display: grid;
    grid-template-columns: 200px auto;
    grid-template-rows: 130px minmax(130px, auto) auto;
    grid-template-areas:
        'header header'
        'leftbar main'
        'footer footer';
    column-gap: 20px;
    row-gap: 20px;
}
.page-header {
  grid-area: header;
  margin: 0;
}
.page-leftbar {
  grid-area: leftbar;
}
.container{
	margin-top: 58px;
}
.page-main {
  grid-area: main;
}
.content {
  color: #242424;
  background-color: none;
  font-weight: 600;
  text-align: center;
  box-sizing: border-box;
  height: 100%;
  padding: 10px;
}
#navi li{
	list-style-type: none;
	margin: 20px 0 20px 0;
	font-size: 1.3em;
}
.warning{
	color: red;
	font-size:1.5em;
}
.active{
    background: gainsboro;
    padding: 8px;
    color: black;
    border-radius: 15px;
    font-weight: 800;
}
</style>
</head>
<body>
	<div class="container">
	<div class="grid">
		<header class="page-header">
			<div class="content">
				<h1>${nick }님 환영합니다</h1>
				<div style="font-size:15px;">충전 타입 : 
				<c:choose>
					<c:when test="${chargeType ==1}">AC단상(5핀)</c:when>
					<c:when test="${chargeType ==2}">AC3상(7핀)</c:when>
					<c:when test="${chargeType ==3}">DC콤보(CSS Type 1)</c:when>
					<c:when test="${chargeType ==4}">DC콤보(CSS Type 2)</c:when>
					<c:when test="${chargeType ==5}">차데모</c:when>
					<c:when test="${chargeType ==6}">슈퍼차저</c:when>
				</c:choose>
				</div>
			</div>
		</header>
		<aside class="page-leftbar">
			<div class="content">
			<ul id="navi">			
				<li><a href="/mypage/chgnick">닉네임 변경</a></li>
				<li><a href="/mypage/chgcar">차량 정보 변경</a></li>
				<li><a href="/mypage/chgpw">비밀번호 변경</a></li>
<!-- 				<li><a href="/mypage/favorite">즐겨찾기 충전소</a></li> -->
				<li><a href="/mypage/delete" class="active">회원 탈퇴</a></li>
			</ul>
			</div>
		</aside>
		<main class="page-main">
			<div class="content">
			<form action="/mypage/delete" method="post" class="form-horizontal">
				<div class="form-group">
				<div class="col-xs-12">
					<div class="warning">
					회원 탈퇴는 되돌릴 수 없습니다.<br>
					정말로 탈퇴하시겠습니까?
					</div>
				</div>
				</div>
				<div class="form-group">
					<label for="userPw" class="col-xs-2 control-label"></label>
					<div class="col-xs-8">
						<input type="text" required class="form-control" id="userPw" name="userPw"
							placeholder="비밀번호 확인" />
					</div>
				</div>
				<div class="text-center form-group">
					<div class="">
						<button id="resetPw" class="btn btn-danger">회원 탈퇴 확인</button>
						<a href="/mypage" class="btn">돌아가기</a>
					</div>
				</div>
			</form>
		</div>
		</main>
	</div>
	</div>

<c:import url="../../layout/footer.jsp" />