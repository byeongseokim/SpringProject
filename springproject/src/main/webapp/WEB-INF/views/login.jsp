<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>네버 로그인</title>
<link rel="stylesheet" href="style.css">
<script src="login.js"></script>
<link rel="stylesheet" href="../resources/css/login.css">
<link rel="icon" href="/resources/images/nevermark.png" width="20"
	height="20">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
	<form action="/user/login.do" method="post">
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
					<a href="http://localhost:8092/main/main.do" target="_self"
						title="네버 홈페이지"><img
						src="/resources/images/nevermainimage.png" class="image"></a>
				</div>
			</header>
			<!--로그인 부분-->

			<form action="/user/login.do" method="post">
				<section class="login-wrap">
					<div class="login-id-wrap">
						<input  type="text" name='id' placeholder="아아디를 입력해주세요"
							id="id"></input>
					</div>
					<div class="login-pw-wrap">
						<input type='password' name='password' placeholder="비밀번호를 입력주세요"
							id="password"></input>
					</div>
					<div class="login-btn-wrap">
					<input id="login-btn" type="submit" value="로그인" >
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

				</section>
			</form>
			<!--class,PW 찾기 및 회원가입 부분-->
			<section class="find-signup-wrap">

				<div id="find-signup-wrap-ko">
					<span class="find-id"> <a href="/">아이디 찾기</a>
					</span> <span class="find-pw"> <a href="/">비밀번호 찾기</a>
					</span> <span class="sign-up"> <a href="/">회원가입</a>
					</span>
				</div>
			</section>
	</form>
	<!--footer-->
	<div class="footer" style="margin: auto;">
		<%@ include file="/WEB-INF/views/tiles/footer.jsp"%>
	</div>

	<script>
		/* 한영전환 */
		function chageLangSelect() {
			var langSelect = document.getElementById("id-lang");
			var selectValue = langSelect.options[langSelect.selectedIndex].value;

			if (selectValue == 'ko') {
				document.getElementById("input-id").placeholder = '아이디';
				document.getElementById("input-pw").placeholder = '비밀번호';
				document.getElementById("login-btn").textContent = '로그인';
				document.getElementById("stay-text").textContent = '로그인 상태 유지';
				document.getElementById("ip-check").style.display = '';
				document.getElementById("easy-login-text").textContent = '더욱 간편한 로그인';
				document.getElementById("easy-login-wrap").style.height = '90px';
				document.getElementById("easy-login-wrap-ko").style.display = '';
				document.getElementById("easy-login-wrap-en").style.display = 'none';
				document.getElementById("find-signup-wrap-ko").style.display = '';
				document.getElementById("find-signup-wrap-en").style.display = 'none';

			} else {
				document.getElementById("input-id").placeholder = 'Username';
				document.getElementById("input-pw").placeholder = 'Password';
				document.getElementById("login-btn").textContent = 'Sign in';
				document.getElementById("stay-text").textContent = 'Stay Signed in';
				document.getElementById("ip-check").style.display = 'none';
				document.getElementById("easy-login-text").textContent = 'Easier sign in';
				document.getElementById("easy-login-wrap").style.height = '215px';
				document.getElementById("easy-login-wrap-ko").style.display = 'none';
				document.getElementById("easy-login-wrap-en").style.display = '';
				document.getElementById("find-signup-wrap-ko").style.display = 'none';
				document.getElementById("find-signup-wrap-en").style.display = '';

			}
		}

		/* 	function ipCheck(){  

		 var ipcheck = document.getElementById("ip-context");
		
		 if(ipcheck.textContent == 'OFF'){
		 ipcheck.textContent = 'ON'
		 ipcheck.style.color = '#03c75a';
		 }else{
		 ipcheck.textContent = 'OFF'
		 ipcheck.style.color = 'rgb(160,160,160)';
		 }
		 }
		 */
	</script>
</body>

</html>