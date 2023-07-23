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
<c:set var="user_id"
	value='<%=(String) session.getAttribute("userid")%>' />
<link rel="stylesheet" href="/resources/sum/summernote-lite.css">
<div>
	<form id="boardform" name="boardform" action="post">
		<input type="text" name="valcate" id="cate"
			value='[<c:out value="${board.cate}"/>]'
			style="width: 100px; text-align: center;" disabled> <select
			style="display: none;" id="selcate" id="1">
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
		</select> <input type="text" name="btie" id="btie"
			value='<c:out value="${board.btie}"/>' disabled> <input
			type="text" name="bwriter" id="id" readonly="readonly"
			value='<c:out value="${board.bwriter}"/>'>
		<textarea name="bcon" id="bcon" disabled></textarea>
		<div id="base_btn">
			<c:if test="${user_id ==board.bwriter||grade==2}">
				<input type="button" class="btn btn-success" value="수정"
					onclick="fn_enable()">
				<input type="button" class="btn btn-danger" value="삭제"
					onclick="removeboard()">
				<!-- onclick="삭제ajax"  -->
			</c:if>
			<input type="button" class="btn btn-secondary" value="목록으로가기"
				onClick="backToList(boardform)">
		</div>
		<div style="display: none;" id="modify_btn">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="pagenum"
				value="${nowpage}"> <input type=button value="수정반영하기"
				onClick="modifyboard()">
			<!-- put타입ajx여기서 값을변경해서그전에꺼삭제하고받아온걸로 값변경하기 id=summ노트도지워야함 -->
			<input type="button" value="취소" onClick="fn_disable()">

		</div>
		<hr>
		<div>
			reply
			<c:if test="${user_id!=null}">
			 <input type="text" id="replycon">
			 <input type="button" value="댓글작성" onclick="createreply()">
			 </c:if>
		</div>
		<div id="replyboard">
			<table id="replytabel">
				<thead>
					<tr>
						<td>작성자</td>
						<td>내용</td>
						<td>작성일자</td>
						<td colspan="2"></td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reply}" var="tem" varStatus="status">
						<tr>
							<th><input style="border: none" type="text" readonly
								value="${tem.rwriter}"></th>
							<th><input style="border: none" type="text" readonly
								value="${tem.rcon}" id="rcon${status.count}"></th>
							<th><input style="border: none" type="text" readonly
								value="<fmt:formatDate pattern='yyyy-MM-dd' value='${board.bdate}'/>"></th>
							<c:if test="${ grade==2||user_id==tem.rwriter}">
							<th id="delbtn${status.count}" style="color: red" ><input type="button" onclick="deletereply(${tem.rno})" value="삭제"></th>
							<th id="modbtn${status.count}" style="color: green"><input type="button" onclick="updatereply(${status.count})" value="수정"></th>
							<th id="redelbtn${status.count}" style="color: blue; display: none" ><input type="button" onclick="btn_modify(${status.count})" value="수정하기"></th>
							<th id="cancelbtn${status.count}" style="color: red; display: none"><input type="button" onclick="resetbtn(${status.count})" value="취소"></th>
							</c:if>
						</tr>
						<input type="hidden" id="rerno${status.count}" value="${tem.rno}">
					</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
</div>
<script>
function viewreply(data){
	 $("#replytabel").remove();
	  var replyhead='<table id="replytabel"><thead><tr><td>작성자</td><td>내용</td><td>작성일자</td>';
	  replyhead+='<td colspan="2"></td></tr></thead><tbody id="replytbody"><tbody><table> ';
	  $("#replyboard").append(replyhead);
	  $.each(data,function(index,item){
		  var redate= new Date(item.rdate);
		  var year = redate.getFullYear();
		  var month = ('0' + (redate.getMonth() + 1)).slice(-2);
		  var day = ('0' + redate.getDate()).slice(-2);
		  var dateString = year + '-' + month  + '-' + day;
		  var replybody = '<tr><th><input style="border: none" type="text" readonly value="'+item.rwriter+'">';
		   replybody+='</th><th><input style="border: none" type="text" readonly value="'+item.rcon+'" id="rcon'+index+'"></th>';
		   replybody+='<th><input type="text" style="border: none" value="'+dateString+'" readonly></th>';
 		  if("${user_id}"==item.rwriter){
 		   replybody+='<th style="color: red" id="delbtn'+index+'" ><input type="button" onclick="deletereply('+item.rno+')" value="삭제"></th><th style="color: green"><input type="button" onclick="updatereply('+index+')" value="수정"></th>';
		   replybody+='<th id="redelbtn'+index+'" style="color: blue; display: none" ><input type="button" onclick="btn_modify('+index+')" value="수정하기"></th>';
		   replybody+='<th id="cancelbtn'+index+'" style="color: red; display: none"><input type="button" onclick="resetbtn('+index+')" value="취소"></th>';
		   }else if("${grade}"==2){
			replybody+='<th style="color: red" id="delbtn'+index+'" ><input type="button" onclick="deletereply('+index+')" value="삭제"></th><th style="color: green"><input type="button" onclick="updatereply('+index+')" value="수정"></th>';
			 replybody+='<th id="redelbtn'+index+'" style="color: blue; display: none" ><input type="button" onclick="btn_modify('+index+')" value="수정하기"></th>';
			replybody+='<th id="cancelbtn'+index+'" style="color: red; display: none"><input type="button" onclick="resetbtn('+index+')" value="취소"></th>';
		   }
 		 console.log(replybody);
		   replybody+='<input type="hidden" id="rerno'+index+'" value="'+item.rno+'">';
		$("#replytbody").append(replybody); 
	})
}
</script>
<script>
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	 $(document).ready(function(){
	 $('#bcon').summernote('code', '${board.bcon}'); 
	 $('#bcon').summernote('disable');
	 $('#bcon').summernote({
			  spellCheck: true
		});
	 });
	 function createreply(){
			var replydate={
				"rwriter":"${user_id}",
				"bno":${board.bno},
				"rcon":$("#replycon").val()
			}
			console.log(replydate);
			console.log(JSON.stringify(replydate));
			$.ajax({ 
			    data:JSON.stringify(replydate), 
			    type:"POST", 
			    url:"/reply/addreply.do", 
			    dataType:"JSON",
			    contentType : "application/json; charset=utf-8",
			    beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success:function(data){
				 	viewreply(data); 
				},
				error:function(error){
					console.log(error);
				}
		});
		}
		function deletereply(index){
			var replydate={
				"bno":${board.bno}
			}
			$.ajax({ 
			    data:JSON.stringify(replydate), 
			    type:"delete", 
			    url:"/reply/removereply.do/"+index, 
			    dataType:"JSON",
			    contentType : "application/json; charset=utf-8",
			    beforeSend : function(xhr){
					xhr.setRequestHeader(header, token);
				},
				success:function(data){
			 		viewreply(data); 
				},
				error:function(error){
					console.log(error);
				}
		});
		}
		function updatereply(index){
			$("#rcon"+index).attr("readonly",false);
			$("#rcon"+index).css("border","");
			$("#delbtn"+index).css("display","none");
			$("#modbtn"+index).css("display","none");
			$("#redelbtn"+index).css("display","");
			$("#cancelbtn"+index).css("display","");
			}
		function resetbtn(index){
			$("#rcon"+index).attr("readonly",true);
			$("#rcon"+index).css("border","none");
			$("#delbtn"+index).css("display","");
			$("#modbtn"+index).css("display","");
			$("#redelbtn"+index).css("display","none");
			$("#cancelbtn"+index).css("display","none");
			}
			
		function btn_modify(index){
			var replydate={
					"rwriter":"${user_id}",
					"bno":${board.bno},
					"rcon":$("#rcon"+index).val(),
					"rno":$("#rerno"+index).val()
				}
			console.log(replydate);
		 		 $.ajax({ 
				    data:JSON.stringify(replydate), 
				    type:"put", 
				    url:"/reply/modifyreply.do/", 
				    dataType:"JSON",
				    contentType : "application/json; charset=utf-8",
				    beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					},
					success:function(data){
						viewreply(data); 
					},
					error:function(error){
						console.log(error);
					}
			}); 
		}
     function backToList(obj) {
	    obj.action="/board/list.do";
	    obj.method="get"
	    obj.submit();
     }
 
	 function fn_enable(){
		//수정하기를 누르면 실행됨 i_title이라는 아이디를가진 태그의 disabled의 기능을 false시켜라 즉 종료시켜라
		//input타입의 i title은 diabled에서 수정불가였다가 false명령어를 주면서 수정가능한상태로만듬
		//그리고 보이지않던 수정반영하기 버튼을 block로 변경하여 보이게만들고
		//trbtn버튼 수정하기 삭제하기 답글 리스트 돌아가기 버튼이 none으로 변경되어 보이지않음
		 document.getElementById("btie").disabled=false;
		//글번호와 작성자와 작성날짜는 여전히 disabled이기떄문에 변경할수없다. 변경할수있는부분은 타이틀과 내용뿐.
		 document.getElementById("bcon").disabled=false;
		 $("#selcate").attr("style","block");
		 $("#cate").attr("type","hidden");
		 $('#bcon').summernote('enable');
		 document.getElementById("modify_btn").style.display="block";
		 document.getElementById("base_btn").style.display="none";
	        function uploadSummernoteImageFile(file,editor){ 
	            data = new FormData(); 
	            data.append("file",file);
	            data.append("id",id)
	      } 
	 }
	 function removeboard() {
		 var data="${board.bno}";
		console.log(data);
		 $.ajax({
	         type:"delete", 
	         url:"/board/delete.do/"+data,
	         beforeSend : function(xhr){
	     		xhr.setRequestHeader(header, token);
	     	},
	     	success:function(data){
	     		location.href = '/board/list.do/${nowpage}'
	     	}
		}); 
	  }
	 function modifyboard() {
		 var data={
			 "bno":${board.bno},
			 "bcon":$("#bcon").val(),
			"btie":$("#btie").val(),
			"cate":$("#selcate").val()
		 }
		 console.log(data);
		 $.ajax({
	         type:"put", 
	         url:"/board/update.do",
	         contentType : "application/json; charset=utf-8",
	         data:JSON.stringify(data),
	         beforeSend : function(xhr){
	     		xhr.setRequestHeader(header, token);
	     	},
	     	success:function(data){
			document.getElementById("btie").disabled=true;
			document.getElementById("bcon").disabled=true;
			$('#bcon').summernote('disable');
			document.getElementById("modify_btn").style.display="none";
			document.getElementById("base_btn").style.display="block";
			document.getElementById("selcate").style.display="none";
			 $("#cate").attr("type","text");
			 $("#cate").val(data.cate);
			alert("글 수정이 완료 되었습니다.");
	     	},
	     	error:function(error){
	     		console.log(error);
	     	}
		}); 
	  }
	 function fn_disable(){
			document.getElementById("btie").disabled=true;
			document.getElementById("bcon").disabled=true;
			$('#bcon').summernote('disable');
			document.getElementById("modify_btn").style.display="none";
			document.getElementById("base_btn").style.display="block"; 
		} 

 </script>