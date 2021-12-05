<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
#navigation{
	position:fixed;
	left : 0;
	top : 0;
	width : 20%;
	height : 100vh;
	padding-top : 10px;
	overflow: hidden;
	background-color : #A1A1A1;
}
#navigationTitle{
	margin-left : 12px;	
	color : white;
	font-weight:bold; 
	font-size : 30px;
/* 	border: 1px solid red; */
}
#navigation ul{
	list-style : none;
	margin : 25px 0 0 0;
 	padding : 0;
 	height : 490px;
/* 	border: 1px solid yellow; */
}
#navigation li a{
	display : block;
	padding : 8px 12px;
	
	text-decoration:none;
	font-size : 20px;
	font-weight:bold; 
	color : gray;
	
	border-bottom: 2px solid #7D7D7D;
/* 	border: 1px solid blue; */
}
#navigation li a:hover{
	background-color : #E2E2E2;
	color:#404040;
}
</style>

<div id="navigation">
<span id="navigationTitle">nEVigation</span>
<ul>
	<c:if test="${currentPage eq 'userInfo'}">
		<li><a href="/admin/userInfoList" style="background-color : #404040; color:#E2E2E2;">회원 정보</a></li>		
	</c:if>
	<c:if test="${currentPage != 'userInfo'}">
		<li><a href="/admin/userInfoList">회원 정보</a></li>		
	</c:if>
	
	<c:if test="${currentPage eq 'EVstationInfo'}">
		<li><a href="/admin/EVstationInfoList" style="background-color : #404040; color:#E2E2E2;">충전소 목록</a></li>
	</c:if>
	<c:if test="${currentPage != 'EVstationInfo'}">
		<li><a href="/admin/EVstationInfoList">충전소 목록</a></li>		
	</c:if>

	<c:if test="${currentPage eq 'stationAdd'}">
		<li><a href="/admin/EVstationAdd" style="background-color : #404040; color:#E2E2E2;">충전소 추가</a></li>
	</c:if>
	<c:if test="${currentPage != 'stationAdd'}">
		<li><a href="/admin/EVstationAdd">충전소 추가</a></li>
	</c:if>
	
	<c:if test="${currentPage eq 'stationReport'}">
		<li><a href="/admin/stationReportList" style="background-color : #404040; color:#E2E2E2;">충전소 제보</a></li>
	</c:if>
	<c:if test="${currentPage != 'stationReport'}">
		<li><a href="/admin/stationReportList">충전소 제보</a></li>
	</c:if>
	
	<c:if test="${currentPage eq 'stationDec'}">
		<li><a href="/admin/stationDecList" style="background-color : #404040; color:#E2E2E2;">충전소 신고</a></li>
	</c:if>
	<c:if test="${currentPage != 'stationDec'}">
		<li><a href="/admin/stationDecList">충전소 신고</a></li>
	</c:if>
	
	<c:if test="${currentPage eq 'stationReview'}">
		<li><a href="/admin/stationReviewList" style="background-color : #404040; color:#E2E2E2;">리뷰</a></li>
	</c:if>
	<c:if test="${currentPage != 'stationReview'}">
		<li><a href="/admin/stationReviewList">리뷰</a></li>
	</c:if>
</ul>
</div>