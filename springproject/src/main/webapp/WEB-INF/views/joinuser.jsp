<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>네버 회원가입</title>
<link rel="icon" href="resources/images/nevermark.png" width="20"
	height="20">
<link rel="stylesheet" href="../resources/css/joinuser.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<form action="/new.do" method="post" name="joinfrm"  onsubmit="return checkUserId(e)">

		<div class="member">
			<!-- 1. 로고 -->
			<img class="logo" src="resources/images/nevermainimage.png"
				width="250" height="70">

			<!-- 2. 필드 -->
			<div class="field">
				<b>아이디</b> <span class="placehold-text"><input id="id"
				name="id" type="text" placeholder="아이디를 입력해주세요"></span>
			</div>
			<div class="field">
				<button id="adr_find" style="text-align: right; float: right;">아이디 중복학인</button>
			</div>
			<br>
			<div class="field">
				<b>비밀번호</b> <input name="password" type="password"
					placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input type="password" placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="field">
				<b>이름</b> <input type="text" name="name" placeholder="이름을 입력해주세요">
			</div>
			<div class="field tel-number">
				<b>휴대전화</b> <select>
					<option value="">대한민국 +82</option>
				</select>
				<div>
					<input type="tel" name="phone" placeholder="전화번호 입력">
				</div>
			</div>

			<!-- 3. 가입하기 버튼 -->
			<input type="submit" value="가입하기">

			<!-- 4. 푸터 -->
			<div class="footer" style="margin: auto;">
				<%@ include file="/WEB-INF/views/tiles/footer.jsp"%>
			</div>
		</div>
	</form>

	<script>
	$(function(){ 
		$('#adr_find').click(function() {
			var userId = $("#id").val();
			$.ajax({
				type : "POST",
				url : "./idcheck",
				data : {
                    "userId" : userId
                },
				dataType : "text",
				success : function(data) {
					if (data === "사용불가") {
						alert("사용 중인 아이디입니다.");
					} else {
						alert("사용 가능한 아이디입니다.");
					}
				},
				error : function(error) {
					alert("오류 발생: " + error);
				}
			});
		};
	};
	</script>

</body>
</html>

