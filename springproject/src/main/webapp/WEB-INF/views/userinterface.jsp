<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
table.type08 {
	border-collapse: collapse;
	line-height: 3;
	border-left: 1px solid #ccc;
	margin: 20px 10px;
	float: left;
}

table.type08 thead th {
	padding: 10px;
	font-weight: bold;
	border-top: 1px solid #ccc;
	border-right: 1px solid #ccc;
	border-bottom: 2px solid #c00;
	background: #2CA9E8;
}

table.type08 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	background: #ececec;
}

table.type08 td {
	width: 350px;
	font-size: 20px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}
</style>
<div>
	<table class="type08">
		<thead>
			<tr>
				<th colspan="3">회원정보</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">아이디</th>
				<td colspan="2">${user.id}</td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td colspan="2">${user.name }</td>
			</tr>
			<tr>
				<th scope="row">전화번호</th>
				<td colspan="2"><input type="text" value="${user.phone}" readonly
					style="border: none; font-size: 20px"><input type="hidden"
					onclick="" value="변경하기"></td>
			</tr>
			<tr>
				<th colspan="3" style="text-align: center;"><input
					type="button" value="정보수정"><input type="button"
					value="비밀번호변경"></th>
			</tr>
		</tbody>
		<tr>
			<td  style="text-align: center;background: #2CA9E8;" colspan="3">최신 작성 글</td>
		</tr>
		<tr style="border: 1px solid; 	line-height:0.5;">
			<th>카테고리</th>
			<th>제목</th>
			<th>작성일자</th>
		</tr>
		<c:choose>
			<c:when test="${board!=null}">

					<c:forEach items="${board}" var="item">
						<tr style="border: 1px solid; 	line-height:0.5;">
							<td>${item.cate}</td>
							<td>${item.btie}</td>
							<td style="text-align: center;"><fmt:formatDate value="${item.bdate}" pattern="yy-MM-dd" /> </td>
						</tr>
					</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="3">작성한 글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</div>
