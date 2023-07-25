<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="user_id" value='<%=(String) session.getAttribute("grade")%>' />
<link href="${contextPath}/resources/css/basic.css" rel="stylesheet">
<header>
	<div>
		<h1 class="css-transform" style="text-align: center;"><a href=/main/main.do>NEVER</a></h1>
		<br>
	</div>
	<div>
		<form id="serform">
			<table>
				<tr colspan="3">
					<td><select style="display: block;" id="selcate" id="1" name="cate">
							<option>옵션</option>
							<c:forEach var="item" items="${cate}">
								<option value="${item.cate}">${item.cate}</option>
							</c:forEach>
					</select></td>
					<td><input type="text"
						style="width: 500px; height: 50px; font-size: 30px" name="word"
						id="word" placeholder="검색어를 입력해주세요." onclick="$('#word').val('')"></td>
					<td><input type="button" value="검색"
						style="width: 100px; height: 50px; font-size: 30px"
						onclick="serchboard()"></td>
				</tr>
			</table>
			<div class="catebutton">
				<input type="button" onclick="serchca()" value="전체 보기">
				<c:forEach var="cate" items="${cate}">
					<input type="button" onclick="serchcate('${cate.cate}')" value="${cate.cate}">
				</c:forEach>
			</div>
		</form>
	</div>

	<script>
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		function serchboard() {
			console.log("실행!");
			$("#serform").attr("action", '/board/list.do');
			$("#selcate").attr("name","cate");
			console.log($("#selcate").val());
			$("#serform").submit();
		};
		function serchcate(index){
			$("#serform").attr("action", '/board/list.do');
			$("#selcate").val(index);
			console.log($("#selcate").val());
			$("#serform").submit();
		}
		function serchca(){
			$("#serform").attr("action", '/board/list.do');
			console.log($("#selcate").val());
			$("#serform").submit();
		}
	</script>
</header>
