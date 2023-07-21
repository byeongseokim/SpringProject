<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<c:set var="grade" value='<%=(String) session.getAttribute("grade")%>' />
<c:set var="user_id"
	value='<%=(String) session.getAttribute("userid")%>' />
<div id="content">
	<h2 class="sub_h2_tit">게시판</h2>
	<!-- 게시판 시작 -->
	<div class="container_wrap">
		<div class="container_inner">
			<p>게시물갯수</p>
			<select id="countnumber" onchange="modifycount()">
				<option>갯수</option>
				<option value="10">10</option>
				<option value="15">15</option>
				<option value="20">20</option>
			</select>
			<ul class="notice_category"></ul>
		</div>

		<table id='list_wrap'>
			<thead id='firstlistview'>
				<tr>
					<th class='bo_num'>번호</th>
					<th class='bo_tit'>제목</th>
					<th class='bo_writer'>글쓴이</th>
					<th class='bo_regDate'>등록일</th>
				</tr>
			</thead>
			<tbody id='boardlistview'>
				<c:forEach items="${boardList}" var="board">
					<tr>
						<th class="bo_num"><c:out value="${board.rownum}" /> <input
							type=hidden value="${board.bno}"></th>
						<th class="bo_tit"><a
							href="/board/detail.do?bno=${board.bno}&nowpage=${nowpage}">
								<c:out value="${board.btie}" />
						</a></th>
						<th class="bo_writer"><c:out value="${board.bwriter}" /></th>
						<th class="bo_regDate"><fmt:formatDate pattern="yy-MM-dd"
								value="${board.bdate}" /></th>
								</tr>
				</c:forEach>
	
			</tbody>
			<tbody id='viewboardlist'></tbody>
		</table>

		<!-- 게시판 목록 영역 -->
		<div id="board_wrap"></div>
		<!-- 테스트 텍스트 추가 -->
		<c:if test="${user_id!=null}">
			<div class="add-post-box">
				<div class="add-post-button">
					<a href="<c:url value='/board/add.do'/>">새 글 추가</a>
				</div>
			</div>
		</c:if>
		<ul>
			<c:forEach begin="1" end="${page}" var="num">
				<li><input type="button" onclick="movepage(${num})"
					value="${num}"></li>
			</c:forEach>
		</ul>
		<input type="hidden" value="${nowpage}" id="nowpage">
	</div>
</div>

<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");


function modifycount(){
	console.log($("#countnumber").val());
	$.ajax({ 
        data:$("#countnumber").val(), 
        type:"PUT", 
        url:"/board/updatecount", 
        dataType:"text",
        beforeSend : function(xhr){
    		xhr.setRequestHeader(header, token);
    	},
       success:function(data){
    	 alert(data);
    	 //location.href = '/board/list.do/1'
    	 //$("#list_wra").remove();
    	 //$("#list_wra").empty();
    	 location.reload();
    	// boardload();
	} 
}); 
}
</script>
<script>
	function movepage(index){
	$("body").load('/board/list.do/'+index,function(){

	});
}

</script>