<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/layout/header.jsp" />    

<script type="text/javascript">


		
	
	
$(document).ready(function (){
	
	$("#btnWrite").click(function(){
		submitContents($("#btnWrite"));
	})
	$("form").submit();
})

}
	$("#cancel").click(function(){
		history.go(-1);
	})



</script>

<section style="padding-top:50px;">
 -->
<div class="container">

<h1 style="align:center;">충전소 신고</h1>
<hr>


<form action="/map/declaration" method="post" >
<!-- 
<div class="form-group">
	<label for="title" >신고글 제목</label>
	<input type="text" id="title" name="declaration_title" class="form-control" Placeholder="내용을 입력해주세요"/>
</div>
 -->
<!-- 
<div class="form-group">
	<label for="title" >충전소 이름</label>
	<input type="text" id="name" name="declaration_title" class="form-control" Placeholder="충전소 이름"/>
</div>
 -->
<div name = "dec" class="form-group">
	<label for="content" >신고 내용</label>
	<input type="text" style="width: 100%;" id="dec_type" name="dec_type" class="form-control" maxlength="20" Placeholder="신고할 내용을 20자 이내로 입력해주세요" required/>
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">신고하기</button>
	<input type="reset" id="cancel" class="btn btn-default" value="취소">
</div>

</form>


</section>

<c:import url="/WEB-INF/layout/footer.jsp" />    