<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
.images{
	padding-left: 50px;	
}
</style>

<div>
	<div
		style="position: relative; width: 100%; height: 80%; overflow: hidden; margin-top: 100px; margin-bottom: 150px">
		<iframe width="1000" height="200"
			src="https://www.youtube.com/embed/PXAf5cQUFN0"
			title="YouTube video player" frameborder="0"
			allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
			allowfullscreen></iframe>
	</div>
	<h1>추천 영화 예고편</h1>
	<div class="images" style="margin-bottom: 150px">
		<img src="${contextPath}/resources/images/proimg/but.jpg"><img
			src="${contextPath}/resources/images/proimg/mission.jpg"> <img
			src="${contextPath}/resources/images/proimg/hero.jpg"> <img
			src="${contextPath}/resources/images/proimg/min.jpg"> <img
			src="${contextPath}/resources/images/proimg/me.jpg">
			
	</div>
	<h1>추천 예능 예고편</h1>
	<div>
		<img src="${contextPath}/resources/images/proimg/gigu.jpg">
		<img src="${contextPath}/resources/images/proimg/criem.jpg">
		<img src="${contextPath}/resources/images/proimg/mongkie.jpg">
		<img src="${contextPath}/resources/images/proimg/mryou.jpg">
		<img src="${contextPath}/resources/images/proimg/solo.jpg">
	</div>
</div>
