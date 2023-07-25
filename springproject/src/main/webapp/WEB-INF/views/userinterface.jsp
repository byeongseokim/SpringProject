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
	line-height: 120%;
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
				<td colspan="2"><input type="text" value="${user.phone}"
					readonly style="border: none; font-size: 20px"><input
					type="hidden" onclick="" value="변경하기"></td>
			</tr>
			<tr>
				<th colspan="3" style="text-align: center;"><input
					type="button" value="전화 번호 수정" onclick="phoneenable()" /> <input
					type="button" value="비밀번호변경"  onclick="passwordenable()"/></th>
			</tr>
			
			<tr id="phonemod" style="display: none;">
				<th>변경할 전화번호</th>
				<td><input type="text" id="changephone"placeholder="010-1111-1111"></td>
				<td><input type="button" onclick="phonemodify()" value="변경"></td>
			</tr>
			
			<tr id="passwordcheck" style="display: none;">
				<th>비밀번호를 입력해주십시오</th>
				<td><input type="password" id="checkpassword"></td>
				<td><input type="button" onclick="passwordcheck()" value="비밀번호확인"></td>
			</tr>
			
			<tr id="changepassword" style="display: none;">
			<th style="margin: auto">변경할 비밀번호를 입력해주십시오</th>
				<td><label style="font-size: 15px">비밀번호: </label><input
					type="password" onchange="isSame()" id="fipw"><br> <span style="font-size: 15px" id="pwdchone"></span> <br> 
					<label style="font-size: 15px">비밀번호체크: </label>
					<input type="password" onchange="isSame()" id="sepw"><br>
					 <span style="font-size: 15px" id="pwdchtow"></span></td>
				<td style="margin: auto"><br> <input type="button"
					value="비밀번호 변경하기 " onclick="passwordmodify()"> <input type="hidden" id="pwcheckone"
					value=""> <input type="hidden" id="pwchecktwo" value="">
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일자</th>
			</tr>
			<c:choose>
				<c:when test="${board!=null}">

					<c:forEach items="${board}" var="item">
						<tr style="border: 1px solid; line-height: 0.5;">
							<td>${item.cate}</td>
							<td>${item.btie}</td>
							<td style="text-align: center;"><fmt:formatDate
									value="${item.bdate}" pattern="yy-MM-dd" /></td>
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
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

function phoneenable(){
	$("#phonemod").css("display","");
	$("#passwordcheck").css("display","none");
}
function phonemodify(){
	var date={
		"id":"${user.id}",
		"phone":$("#changephone").val()		
	}
	$.ajax({
		 data:JSON.stringify(date), 
		 type:"put",
		 url:"/user/changephone.do", 
		 dataType:"text",
		 contentType : "application/json; charset=utf-8",
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
function passwordenable(){
$("#passwordcheck").css("display","");
$("#phonemod").css("display","none");
}

function passwordcheck(){
	var date={
		"id":"${user.id}",
		"password":$("#checkpassword").val()
	}
	$.ajax({
		 data:JSON.stringify(date), 
		 type:"put",
		 url:"/user/passwordcheck.do", 
		 dataType:"text",
		 contentType : "application/json; charset=utf-8",
		 beforeSend : function(xhr){
			xhr.setRequestHeader(header, token);
		 },
		 success:function(data){
			 if(data=='비밀번호가일치합니다'){
				 alert(data);
				 $("#passwordcheck").css("display","none");
			 	 $("#changepassword").css("display","");
			 }else{
			 alert(data);
			 }
		},
		 error:function(error){
		 	console.log(error);
		}
	});
}
function isSame() { //비밀번호 재확인
	var pw = document.getElementById('fipw').value;
    if (pw.length< 6) {
    	document.getElementById('pwdchone').innerHTML='6자리 이상 입력해 주세요.';
        document.getElementById('pwdchone').style.color='red';
        document.getElementById('pwcheckone').value ="";
    }else{
    	document.getElementById('pwdchone').innerHTML='올바른 비밀번호입니다';
        document.getElementById('pwdchone').style.color='blue';
        document.getElementById('pwcheckone').value ="true";
    	if(document.getElementById('fipw').value!=''&&document.getElementById('sepw').value !='') {
	    	if( document.getElementById('fipw').value == document.getElementById('sepw').value ) {
	    		document.getElementById('pwdchtow').innerHTML='비밀번호가 일치합니다.';
	            document.getElementById('pwdchtow').style.color='blue';
	            document.getElementById('pwchecktwo').value ="true";
	        }
	        else {
	            document.getElementById('pwdchtow').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('pwdchtow').style.color='red';
	            document.getElementById('pwchecktwo').value ="";
	        }
	    }
    }
}
function passwordmodify(){
if(!$("#pwcheckone").val()){
	alert("비밀번호의 형식이 옳바르지 않습니다.");
	$("#pwcheckone").focus();
	return;
	
}
if(!$("#pwchecktwo").val()){
	alert("비밀번호가 일치하지않습니다.");
	$("#pwchecktwo").focus();
	return;
}


}
</script>
