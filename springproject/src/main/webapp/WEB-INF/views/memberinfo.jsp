<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="${contextPath}/resources/css/memberinfo.css">

<body>
	<br>
	<br>
	<a href="${contextPath}/main/main.do" target="_self" title="네버 홈페이지"> <img
		class="logo" src="${contextPath}/resources/images/nevermainimage.png"
		width="250" height="70"></a>
	<br>
	<br>
	<br>
	<div>
		<form>
			<div class="qjxms">
				<input type="button" value="아이디 찾기" onclick="searcid()"> <input
					type="button" value="비밀번호 찾기" onclick="searcpwd()">
			</div>
			<div id="searchidform" style="display: none">
				<div class="id_border">
					<p>
						<label for="idname">이름: </label> <input type="text" id="idname"
							placeholder="이름을 입력해주세요" autofocus>
					</p>
					<p>
						<label for="idphone">전화번호: </label> <input type="text"
							id="idphone" placeholder="입력예시: 010-1111-1111">
					</p>
				</div>
				<div id="idhidden" style="display: none">
					<label>찾은 아이디: </label> <input id="idhid" type="text"
						readonly="readonly">
				</div>
			</div>
			<div id="searchpwdform" style="display: none">
				<div class="pwd_border">
					<p>
						<label for="pwdname">이름: </label> <input type="text" id="pwdname"
							placeholder="이름을 입력해주세요">
					</p>
					<p>
						<label for="pwdid">아이디: </label> <input type="text" id="pwdid"
							placeholder="아이디를 입력해주세요">
					</p>
					<div id="pwdhidden" style="display: none">
						<label>변경된 비밀번호: </label> <input id="pwdhid" type="text"
							readonly="readonly">
					</div>
				</div>
			</div>
		</form>
		<button id="id_btn" style="display: none" type="button"
			onclick="searciddb()">아이디찾기</button>
		<button id="pwd_btn" style="display: none" type="button"
			onclick="searcpwddb()">비밀번호찾기</button>
	</div>
	<script>
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		function searcid() {
			$("#searchidform").css("display", "block");
			$("#id_btn").css("display", "block");
			$("#idname").focus();
			$("#searchpwdform").css("display", "none");
			$("#pwd_btn").css("display", "none");

		}
		function searcpwd() {
			$("#searchidform").css("display", "none");
			$("#id_btn").css("display", "none");
			$("#searchpwdform").css("display", "block");
			$("#pwd_btn").css("display", "block");
			$("#pwdname").focus();

		}
		function searciddb() {
			data = {
				"name" : $("#idname").val(),
				"phone" : $("#idphone").val()
			}
			console.log(JSON.stringify(data));
			$.ajax({
				type : "POST",
				url : "${contextPath}/user/idsearch",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				dataType : "text",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(data) {
					$("#idhidden").css("display", "block");
					$("#idhid").val(data);
					console.log(data);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
		function searcpwddb() {
			data = {
				"name" : $("#pwdname").val(),
				"id" : $("#pwdid").val()
			}
			console.log(JSON.stringify(data));
			$.ajax({
				type : "POST",
				url : "${contextPath}/user/pwdsearch",
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(data),
				dataType : "text",
				beforeSend : function(xhr) {
					xhr.setRequestHeader(header, token);
				},
				success : function(data) {
					$("#pwdhidden").css("display", "block");
					$("#pwdhid").val(data);
					console.log(data);
				},
				error : function(error) {
					console.log(error);
				}
			});
		}
	</script>