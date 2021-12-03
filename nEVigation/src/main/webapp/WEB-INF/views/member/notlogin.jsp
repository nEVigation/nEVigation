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
.container{
	margin-top: 58px;
}
</style>

	<div class="container">
		<h1 class="warning text-center">비로그인 접속 불가</h1>
		<hr>
		<div>
			5초 후 메인페이지로 이동합니다<br>
		</div>
	</div>

<script type="text/javascript">
$(document).ready(function(){
	window.setTimeout(function () {
        location.href = "/main";
    }, 5000);
});
</script>
<c:import url="../../layout/footer.jsp" />