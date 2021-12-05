<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	window.setTimeout(function () {
        location.href = "/main";
    }, 5000);
});
</script>
<style type="text/css">
div{
	text-align : center;
/* 	border: 1px solid green; */
}
img{
	width : 15%;
	margin-top : 50px;
	margin-bottom: -45px;
/* 	border: 1px solid red; */
}
label{
	font-size : 90%;
	font-weight : bold;
/* 	border: 1px solid blue; */
}
</style>
</head>
<body>
<div id="contatin">
<img src="https://cdn-thumbs.imagevenue.com/fe/cf/f3/ME145AOY_t.png" alt="noun-lock-4433127.png"/><br>
<label>권한이 없는 사용자입니다</label><br>
<label>5초 후 메인페이지로 이동합니다</label>
</div>
</body>
</html>