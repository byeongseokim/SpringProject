<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<div>
	<form>
		<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>등급</th>
					<th style="width: 100px">등급변경</th>
					<th>변경</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${user}" var="item" varStatus="index">
					<tr>
						<th><input style="text-align: center; border: none;"
							type="text" value="${item.id}" id="${index.count}"></th>
						<th><input style="text-align: center; border: none"
							type="text" value="${item.name}"></th>
						<th><input style="text-align: center; border: none"
							type="text" value="${item.phone}"></th>
						<th><c:choose>
								<c:when test="${item.grade=='2'}">
									<input style="text-align: center; border: none" type="text"
										value="관리자">
								</c:when>
								<c:otherwise>
									<input style="text-align: center; border: none" type="text"
										value="유저">
								</c:otherwise>
							</c:choose></th>
						<th style="width: 100px"><select id="grade${index.count}">
								<option>유저</option>
								<option>관리자</option>
						</select></th>
						<th><input type="button" onclick="moifyuser(${index.count})"
							value="수정"></th>
					<tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</div>
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
function moifyuser(index){
	var regrade=$("#grade"+index).val();
	if(regrade==="관리자"){
		regrade=2;
	}else{
		regrade=1;
	}
	var data={
			"id":$("#"+index).val(),
			"grade":regrade
	}
	console.log(data);
	console.log(JSON.stringify(data));
	  $.ajax({ 
         data:JSON.stringify(data), 
         type:"put", 
         url:"${contextPath}/user/grademodify.do", 
         dataType:"text",
         contentType: 'application/json; charset=utf-8',
         beforeSend : function(xhr){
     		xhr.setRequestHeader(header, token);
     	},
        success:function(data){
			alert(data);
		 	location.reload();
        },
        error:function(error){
        	console.log(error);
        }
        
 	});
}
</script>