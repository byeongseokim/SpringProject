<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/resources/css/category.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<div>
	<div class="font">
		<h1>카테고리 설정페이지</h1>
	</div>
	<form>
		<div>
			<label for="idcate"></label> <input id="idcate" type="text"
				name="cate" placeholder="추가할 카테고리를 입력"> <input type="button"
				value="추가하기" onclick="addcate()">
		</div>
		<div class="border">
			<c:forEach items="${cate}" var="tem" varStatus="index">
				<input style="border: none;" type="text" value="${tem.cate}"
					id="cate${index.count}" readonly>
				<input type="button" value="삭제" onclick="removecate(${index.count})">
				<br>
			</c:forEach>
		</div>
	</form>
</div>

<script>
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	function addcate() {
		$.ajax({
			data : {"cate" : $("#idcate").val()},
			type : "POST",
			url : "/cate/cateadd.do",
			dataType : "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				alert(data);
			 	location.reload();
			},
			error:function(error){
			 console.log(eroor);
			}
		});
	}

	function removecate(index) {
		$.ajax({
			data : {"cate" : $("#cate"+index).val()},
			type : "Delete",
			url : "/cate/dropcate.do/"+$("#cate"+index).val(),
			dataType : "text",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(data) {
				alert(data);
			 	location.reload();
			},
			error:function(error){
			 console.log(eroor);
			}
		});
	}
</script>