<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 <c:set var="user_id" value='<%=(String)session.getAttribute("grade")%>' />
<link href="${contextPath}/resources/css/basic.css" rel="stylesheet">
<header>
	<div>
		<h1 class="css-transform" style="text-align: center;">NEVER</h1>
		<br>
	</div>
	<div>
	<form>
		<table>
			<tr colspan="2" >
			</tr>
			<td>
				<input type="text" placeholder="검색어를 입력해주세요"
				style="width: 500px; height: 50px; font-size: 45px">
			</td>
			<td>	
				<input type="submit" value="검색" style="width: 100px; height: 50px; font-size:30px">
			</td>
		</table>
	</form>

</div>
</header>
