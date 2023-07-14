<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <p style="text-align: center;">회원가입페이지</p>
    <form action="/new.do" method="post" name="joinfrm">
    <table style="margin: auto;">
        <tr>
            <td>
                아이디
            </td>
            <td>
            <input name="id" type="text" placeholder="아이디를입력해주세요" >        
            </td>
            <td>
                <button onclick="" >중복확인</button>
            </td>
        </tr>
        <tr>
            <td>
            비밀번호
            </td>
            <td>
                <input name="password" type="password" placeholder="비밀번호를 입력해주세요">
            </td>
        </tr>
        <tr>
            <td>
            비밀번호 확인
            </td>
            <td>
                <input type="password" placeholder="비밀번호를 입력해주세요" >
            </td>
            <td>
            <label>중복확인</label>
            </td>
        </tr>
        <tr>
            <td>
                이름
            </td>
            <td>
            <input name="name" type="text" placeholder="이름을 입력해주세요" >
            </td>
        </tr>
        <tr>
            <td>
                전화번호
            </td>
            <td>
                <input type="text" name="phone" placeholder="010-1111-1111">
            </td>
        </tr>
        <tr>
            <td style="text-align: center;" colspan="2">
                <input type="submit" value="회원가입">
            </td>
        </tr>
    </table>
</form>
</body>
</html>