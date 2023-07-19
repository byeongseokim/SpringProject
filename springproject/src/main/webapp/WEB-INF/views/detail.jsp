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
<c:set var="user_id" value='<%=(String) session.getAttribute("userid")%>' />
<link rel="stylesheet" href="/resources/sum/summernote-lite.css">
<div>
	<form  name="boardform" action="/">
		<input type="text" name="btie" id="btie" value='<c:out value="${board.btie}"/>'  disabled> <input
			type="text" name="bwriter" id="id" readonly="readonly" value='<c:out value="${board.bwriter}"/>'>
		<textarea name="bcon" id="bcon" disabled><c:out value="${board.bcon}"/></textarea>
		<div id="base_btn">
		<c:if test="${user_id==bwriter||grade==2}">
		<!-- user_id==여기도상세보기아이디를 추가해줘야하고 -->
		<input type="button" class="btn btn-success" value="수정" onclick="fn_enable(boardform)" >
		<input type="button" class="btn btn-danger" value="삭제" >
		<!-- onclick="삭제ajax"  -->
		</c:if>
		<input type="button" class="btn btn-secondary" value="목록으로가기">
		</div>
		<div style="display: none;" id="modify_btn"> 
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type=button value="수정반영하기" onClick="/">
		<!-- put타입ajx여기서 값을변경해서그전에꺼삭제하고받아온걸로 값변경하기 id=summ노트도지워야함 -->
		<input type=button value="취소" onClick="backToList(boardform)">
		</div>
	</form>
</div>
	<script>
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
     function backToList(obj) {
	    obj.action="/board/list.do";
	    obj.method="get"
	    obj.submit();
     }
 
	 function fn_enable(obj){
		//수정하기를 누르면 실행됨 i_title이라는 아이디를가진 태그의 disabled의 기능을 false시켜라 즉 종료시켜라
		//input타입의 i title은 diabled에서 수정불가였다가 false명령어를 주면서 수정가능한상태로만듬
		//그리고 보이지않던 수정반영하기 버튼을 block로 변경하여 보이게만들고
		//trbtn버튼 수정하기 삭제하기 답글 리스트 돌아가기 버튼이 none으로 변경되어 보이지않음
		 document.getElementById("btie").disabled=false;
		//글번호와 작성자와 작성날짜는 여전히 disabled이기떄문에 변경할수없다. 변경할수있는부분은 타이틀과 내용뿐.
		 document.getElementById("bcon").disabled=false;
		 document.getElementById("bcon").id="summernote";
		 document.getElementById("modify_btn").style.display="block";
		 document.getElementById("base_btn").style.display="none";

	        $('#summernote').summernote({ 
	            height : 300, 
	            width : 700, 
	            lang : "ko-KR", 
	            callbacks:{ 
	                onImageUpload : function(files){ 
	                uploadSummernoteImageFile(files[0],this); 
	               } 
	            } 
	        }); 
	        function uploadSummernoteImageFile(file,editor){ 
	            data = new FormData(); 
	            data.append("file",file);
	            data.append("id",id)
	            $.ajax({ 
			         data:data, 
			         type:"POST", 
			         url:"../board/upload", 
			         dataType:"JSON", 
			         contentType:false, 
			         processData:false,
			         beforeSend : function(xhr){
			     		xhr.setRequestHeader(header, token);
			     	},
			        success:function(data){ 
			             $(editor).summernote("insertImage",data.url); 
			             $("#thumbnailPath").append("<option value="+data.url+">"+data.originName+"</option>");
	         	} 
	     }); 
	       } 
	 }

 </script>