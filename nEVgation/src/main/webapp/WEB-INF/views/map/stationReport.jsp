<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url="/WEB-INF/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	$("#btnWrite").click(function(){		
		if(document.reportForm.report_title.value != "" && document.reportForm.report_content.value != ""){
			$("form").submit();	
		}else{
			if(document.reportForm.report_title.value == ""){
				alert("제목을 입력해주세요");
				return true;
			}
			
			if(document.reportForm.report_content.value == ""){
				alert("제보 내용을 입력해주세요");
				return document.reportForm.report_content.focus();
			}
		}
	});
	
	$("#cancel").click(function(){
		history.go(-1);
	});
});

</script>

<section style="padding-top:70px;">
<div class="container">

<h1 style="align:center;">충전소 제보 페이지</h1>
<hr>

<form name="reportForm" action="/map/report" method="post">
<div class="form-group">
	<label for="write">작성자</label>
	<input type="hidden" id="user_no" name="user_no" value="${user_no }"/>
	<input type="text" id="write" value="${nick }" class="form-control" readonly="readonly"/>
</div>
<div class="form-group">
	<label for="station">충전소 명</label>
	<input type="hidden" id="station_no" name="station_no" value="${stationInfo.station_no }"/>
	<input type="text" id="station" value="${stationInfo.station_name }" class="form-control" readonly="readonly"/>
</div>
<div class="form-group">
	<label for="title">제목</label>
	<input type="text" id="report_title" name="report_title" class="form-control"/>
</div>
<div class="form-group">
	<label for="content">본문</label>
	<textarea rows="10" style="width: 100%;" id="report_content" name="report_content"></textarea>
</div>
</form>
	<div class="text-center">
	<button class="btn btn-primary" id="btnWrite">제보하기</button>
	<input type="reset" id="cancel" class="btn btn-default" value="취소">
</div>
</div><!-- .container -->
</section>

<c:import url="/WEB-INF/layout/footer.jsp" />