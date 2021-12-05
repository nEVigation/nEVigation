<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${viewBoard.station_state eq 1}">
	<td>운영중???</td>
</c:if>
<c:if test="${viewBoard.station_state != 1}">
	<td>운영중단??/&emsp; <button id="stationActivation" name="stationActivation">충전소 활성화</button></td>
</c:if>