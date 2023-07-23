<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
 <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
 <%
request.setCharacterEncoding("UTF-8");
%>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/sum/summernote-lite.js"></script>
<script src="/resources/sum/lang/summernote-ko-KR.js"></script>
 <c:set var="grade" value='<%=(String)session.getAttribute("grade")%>' />
<c:set var="user_id" value='<%=(String) session.getAttribute("userid")%>' />
<link rel="stylesheet" href="/resources/sum/summernote-lite.css">
<link rel="stylesheet" href="/resources/css/boardwriter.css"> 
<br>
<div class="logo">
			<a href="/main/main.do" target="_self"
				title="네버 홈페이지"><img src="/resources/images/nevermainimage.png"
				class="image"></a>
				<br><br><br>
		</div>
	<form name="boardform" action="/board/add.do" method="post">
	<div class="border">
	<br>
		<input type="text" name="btie" placeholder="  제목">
		<input type="text"  name="bwriter" id="id" readonly="readonly" value='<c:out value="${user_id}"/>' >
		<select name="cate" id="1" style="width: 10%">
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
		<div class="summernote">
		<br>
		<textarea id="summernote" name="bcon" >
		</textarea></div>
		<br>
		<input type="button" class="btn btn-secondary mt-3 mx-2" onClick="backToList(boardform)" value="작성취소" />
		<input type="submit" class="btn btn-primary mt-3 mx-2" value="작성완료" />
		 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		 </div>
	</form>
	<script>
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	var id=$('#id').val();
	
	console.log(id);
    $(document).ready(function(){ 
        $('#summernote').summernote({
        	spellCheck: true,
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
    }); 
    function backToList(obj) {
	    obj.action="/board/list.do";
	    obj.method="get"
	    obj.submit();
     }
</script>