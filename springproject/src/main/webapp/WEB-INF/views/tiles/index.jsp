<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<link rel="shortcut icon" href="${contextPath}/resources/images/nevermark.ico" type="image/x-icon">
<link href="${contextPath}/resources/css/mainlayout.css" rel="stylesheet">
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div class="container">
		<div class="header" style="margin: auto;">
			<tiles:insertAttribute name="header" />
		</div>
		<div class='sidebar' style="margin: auto;">
			<tiles:insertAttribute name="left" />
		</div>
		<div class="body" style="margin: auto;">
			<tiles:insertAttribute name="body" />
		</div>
		<div class="footer" style="margin: auto;">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>

</html>