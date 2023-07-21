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
<link href="${contextPath}/resources/css/mainlayout.css" rel="stylesheet">
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
		<div class="body" style="margin: auto;">
			<tiles:insertAttribute name="body" />
		</div>
		<div class="footer" style=" display: grid;
  place-items: center; width: 100%">
			<tiles:insertAttribute name="footer" />
		</div>
</body>
</html>