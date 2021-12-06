<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="text-center">
	<ul class="pagination pagination-sm">

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a style="color:#404040;" href="/map/search?searchStationName=${searchStationName}">&larr; 처음</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a style="color:#404040;" href="/map/search?curPage=${paging.startPage - paging.pageCount }&searchStationName=${searchStationName}">&laquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li class="disabled"><a style="color:#404040">&laquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a style="color:#404040;" href="/map/search?curPage=${paging.curPage - 1 }&searchStationName=${searchStationName}">&lt;</a></li>
	</c:if>
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a style="border-color:#404040; color:white; background-color:#404040;" href="/map/search?curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a style="color:#404040;" href="/map/search?curPage=${i }&searchStationName=${searchStationName}">${i }</a></li>
	</c:if>
	</c:forEach>
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a style="color:#404040;" href="/map/search?curPage=${paging.curPage + 1 }&searchStationName=${searchStationName}">&gt;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a style="color:#404040;" href="/map/search?curPage=${paging.startPage + paging.pageCount }&searchStationName=${searchStationName}">&raquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li class="disabled"><a style="color:#404040;">&raquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a style="color:#404040;" href="/map/search?curPage=${paging.totalPage }&searchStationName=${searchStationName}">끝 &rarr;</a></li>	
	</c:if>
	
	</ul>
</div>