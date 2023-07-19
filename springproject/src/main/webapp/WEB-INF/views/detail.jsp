<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/sum/summernote-lite.js"></script>
<script src="/resources/sum/lang/summernote-ko-KR.js"></script>
<c:set var="grade" value='<%=(String) session.getAttribute("grade")%>' />
<link rel="stylesheet" href="/resources/sum/summernote-lite.css">
<div>

	<form  name="boardform" action="/">
		<input type="text" name="btie" placeholder="제목" disabled> <input
			type="text" name="bwriter" id="id" readonly="readonly" value="작성자">
		<select name="cate" id="1">
			<c:forEach var="item" items="${cate}">
				<c:choose>
					<c:when test="${grade==2}">
						<option value="${item.cate}">${item.cate}</option>
					</c:when>
					<c:otherwise>
						<c:if test="${item.cate!='공지'}">
							<option value="${item.cate}">${item.cate}</option>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
		<textarea name="bcon" disabled></textarea>
		<c:if test="${user_id==view.comwriter_id}">
		<input type="button" class="btn btn-success" value="수정" />
		<input type="button" class="btn btn-danger" value="삭제" />
		</c:if>
		<input type="button" class="btn btn-secondary" value="목록으로가기">
		<div style="display: none;" id="modify_btn"> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type=button value="수정반영하기" onClick="fn_modify_article(boardform)">
		<input type=button value="취소" onClick="backToList(boardform)">
		</div>
	</form>
</div>


	<script>
     function backToList(obj) {
	    obj.action="";
	    obj.method="get"
	    obj.submit();
     }
 
	 function fn_enable(obj){
		//수정하기를 누르면 실행됨 i_title이라는 아이디를가진 태그의 disabled의 기능을 false시켜라 즉 종료시켜라
		//input타입의 i title은 diabled에서 수정불가였다가 false명령어를 주면서 수정가능한상태로만듬
		//그리고 보이지않던 수정반영하기 버튼을 block로 변경하여 보이게만들고
		//trbtn버튼 수정하기 삭제하기 답글 리스트 돌아가기 버튼이 none으로 변경되어 보이지않음
		 document.getElementById("i_title").disabled=false;
		//글번호와 작성자와 작성날짜는 여전히 disabled이기떄문에 변경할수없다. 변경할수있는부분은 타이틀과 내용뿐.
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/bulletinUpdate.do";
		 obj.method="put";
		 obj.submit();
		//변경반영하기하면 요버튼이눌리면서 위의 경로로 submit가됨
		//그러면 이 게시글 번호의 값이 변경됨 
	 }
	 
	function fn_remove_article(articleNO){
		//삭제할 번화와 삭제할수있는 sql문 delete문으로 가는 url를 버튼에서 fuction으로 넘겨줌 
		 var form = document.createElement("form");
		 form.setAttribute("method", "delect");
		 form.setAttribute("action", "");
	 	 var articleNOInput = document.createElement("input");
	  	 articleNOInput.setAttribute("type","hidden");
	  	 articleNOInput.setAttribute("name","bno");
	   	 articleNOInput.setAttribute("value",bno );
	  	 form.appendChild(articleNOInput);
		//아 위에서 만든 create를 만들어둔거를 닫아주는명령어인거같음
	 	 document.body.appendChild(form);
		//이것도 위에서 만듬 form문을 닫아주는 명령어
		 form.submit();
	 }
 </script>