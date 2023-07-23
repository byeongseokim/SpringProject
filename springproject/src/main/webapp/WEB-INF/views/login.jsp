<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>네버 로그인</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="icon" href="/resources/images/nevermark.png" style="width:20; height: 20 ">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
		<div class="main">
			<!--웹페이지 상단-->
			<header>
				<!--language select-->

				<div class="select-lang">
					<select id="id-lang" class="selectbox" name="lang"
						onchange="chageLangSelect()">
						<option value="ko">한국어</option>
						<option value="en">English</option>
					</select>
				</div>

				<!--NAVER LOGO-->
				<div class="logo">
					<a href="/main/main.do" target="_self"
						title="네버 홈페이지"><img
						src="/resources/images/nevermainimage.png" class="image"></a>
				</div>
			</header>
			<!--로그인 부분-->

			<form id="logfrom" action="/user/login.do" method="post">
				<section class="login-wrap">
					<div class="login-id-wrap">
						<input  type="text" name='id' placeholder="아이디를 입력해주세요"
							id="id"></input>
					</div>
					<div class="login-pw-wrap">
						<input type='password' name='password' placeholder="비밀번호를 입력주세요"
							id="password"></input>
					</div>
					<div class="login-btn-wrap">
					<input id="login-btn" type="submit" value="로그인" style="width:100%" >
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				<input type="hidden" id="errMsg" value='${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}' />
				</section>
			</form>
			<!--class,PW 찾기 및 회원가입 부분-->
			<section class="find-signup-wrap">

				<div id="find-signup-wrap-ko">
					<span class="find-id"> <a href="/user/checkid.do" class="fidi">아이디 찾기</a>
					</span> <span class="find-pw"> <a href="/user/checkid.do" class="fipw">비밀번호 찾기</a>
					</span> <span class="sign-up"> <a href="/user/new.do" class="siup">회원가입</a>
					</span>
				</div>
			</section>
			</div>
	<script>
		/* 한영전환 */
		function chageLangSelect() {
			var langSelect = document.getElementById("id-lang");
			var selectValue = langSelect.options[langSelect.selectedIndex].value;

			if (selectValue == 'ko') {
				document.getElementById("id").placeholder = '아이디';
				document.getElementById("password").placeholder = '비밀번호';
				document.getElementById("login-btn").value = '로그인';
				$(".fidi").text("아이디 찾기");
				$(".fipw").text("비밀번호 찾기");
				$(".siup").text("회원가입");
			} else {
				document.getElementById("id").placeholder = 'Username';
				document.getElementById("password").placeholder = 'Password';
				document.getElementById("login-btn").value= 'Sign in';
				$(".fidi").text("find_id");
				$(".fipw").text("find_password");
				$(".siup").text("singup");

			}
		}

		$(function() {
			$('#logfrom #id').focus();
			// 에러가 있는 경우 메세지 처리
			var errMsg = $('#errMsg').val();
			$('#errMsg').val('');
			if(errMsg != '') {
				alert(errMsg);
				errMsg='';
				$('#formContent').find('#id').focus();
			}
		});
	</script>
