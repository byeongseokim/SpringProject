<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<div>
		<p>로그인</p>
		<table>
			<form action="/user/login.do" method="post">
				<tr>
					<td><input type="text" name='id' placeholder="아아디를 입력해주세요"
						id="id"></td>
					<td colspan="2"><input type='submit' value="로그인"></td>
				</tr>
				<tr>
					<td><input type='password' name='password'
						placeholder="비밀번호를 입력주세요" id="password"> <input
						type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>
