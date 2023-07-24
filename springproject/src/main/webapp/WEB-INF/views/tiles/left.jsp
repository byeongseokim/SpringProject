<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="grade" value='<%=(String) session.getAttribute("grade")%>' />
<c:set var="user_id"
	value='<%=(String) session.getAttribute("userid")%>' />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link href="${contextPath}/resources/css/basic.css" rel="stylesheet">
<c:if test="${user_id==null}">
	<nav>
		<div class="Layout-module__content_area___b_3TU">
			<p style="color: black; text-align: center;">지금 당장 안전하게 네버를 이용하세요</p>
			<div class="MyView-module__my_login___tOTgr">
				<a href="/user/login.do"
					style="background-color: #2CA9E8; font-size: 35px; border-radius: 8px; color: black">NEVER
					로그인</a><br> <br> <br>
				<div>
					<a href="/user/new.do">회원가입&nbsp;</a><a href="/user/checkid.do">아이디/비밀번호찾기&nbsp;</a>
				</div>
			</div>
		</div>
	</nav>
</c:if>
<c:if test="${user_id!=null}">
	<c:choose>
		<c:when test="${grade=='2'}">
			<nav>
				<div class="Layout-module__content_area___b_3TU">
					<p style="color: black; text-align: center;">${user_id}님접속을
						환영합니다.</p>
						<p>관리자 모드입니다.</p>
					<div class="MyView-module__my_login___tOTgr">
						<a href="/user/logout.do"
							style="background-color: #2CA9E8; font-size: 35px; border-radius: 8px; color: black">로그아웃</a><br> <br> <br>
					</div>
				</div>
				<div>
				<a href="/">회원관리시스템</a>
				</div>
				<div>
				<a href="/">카테고리 추가기능</a>
				</div>
			</nav>
		</c:when>
		<c:otherwise>
			<nav>
				<div class="Layout-module__content_area___b_3TU">
					<p style="color: black; text-align: center;">${user_id}님접속을
						환영합니다.</p>
					<div class="MyView-module__my_login___tOTgr">
						<a href="/user/login.do"
							style="background-color: #2CA9E8; font-size: 35px; border-radius: 8px; color: black">${user_id}님
							접속을 환영합니다.</a><br> <br> <br>
					</div>
				</div>
				<div>
				<div>
				<a>회원정보조회</a>
				</div></div>
			</nav>
		</c:otherwise>
	</c:choose>
</c:if>