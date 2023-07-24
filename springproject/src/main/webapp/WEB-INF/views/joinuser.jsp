<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>네버 회원가입</title>
<link rel="stylesheet" href="/resources/css/joinuser.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<form action="/user/new.do" method="post" id="form">
		<div class="member">
			<!-- 1. 로고 -->
			<a href="/main/main.do" target="_self" 
						title="네버 홈페이지"> 
			<img class="logo" src="/resources/images/nevermainimage.png" 
				width="250" height="70" ></a> 
			<!-- 2. 필드 -->
			<div class="field">
				<b>아이디</b> <span class="placehold-text">
					<input style="width: auto%" id="id"  name="id" type="text" placeholder="아이디를 입력해주세요">&nbsp;<input style="width: auto" type="button" value="중복 검사" onClick="CheckDup();" class="btnDup"> 
			<input type="hidden" id="idcheck" value=""></span> 
			</div>
			<div id='message'></div>
			<div class="field">
			<input type="hidden" id="idcheck" value="">
		<!-- 	<button style="text-align: right; float: right;"  onclick="CheckDup();">중복체크</button> -->
			</div>
			<br>
			<div class="field">
				<b>비밀번호</b> <input name="password" type="password" id="password"
					placeholder="6자리이상의 비밀번호를 입력해주세요" onchange="isSame();">
					<input type="hidden" id="pwcheckone" value="">
					<input type="hidden" id="pwchecktwo" value="">
				 <span id="pid"></span>
			</div>
			<div class="field">
				<b>비밀번호 재확인</b> <input onchange="isSame();" id="repassword" type="password" placeholder="비밀번호를 입력해주세요">
			
				 <span id="same"></span>
			</div>
			<div class="field">
				<b>이름</b> <input id="name" type="text" name="name" placeholder="이름을 입력해주세요">
			</div>
			<div class="field tel-number">
				<b>휴대전화</b> <select>
					<option value="">대한민국 +82</option>
				</select>
				<div>
					<input type="tel" name="phone" placeholder="전화번호 입력">
				</div>
			</div>

			<!-- 3. 가입하기 버튼 -->
			<input type="button" onClick="join();" class="btnOk" value="가입하기">
		 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</div>
	</form>

	<script>
	function join() {
	
		if(!$("#id").val()){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return;
		}
		if(!$("#idcheck").val()){
			alert("아이디중복 체크를 진행해주세요.")
			return;
		}
		if (!$("#password").val()) {
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return;
		}
		if(!$("#pwcheckone").val()){
			alert("올바른 비밀번호를 입력해주십시오")
			return;
		}
		if(!$("#pwchecktwo").val()){
			alert("비밀번호가 일치하지 않습니다.")
			return;
		}

		if (!$("#name").val()) {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return;
		}
		alert("정상적으로 회원가입이 완료되었습니다.");
		$("#form").submit();
	}

	function CheckDup() {
		
		if(!$("#id").val()){
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return;
		}
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$.ajax({
			url:"/user/checkid.do",		// servlet 
			type: "post",
			datatype:"text",
			data: {"id" : $("#id").val()},
			beforeSend : function(xhr){
	     		xhr.setRequestHeader(header, token);
	     	},
			success:function(data){
				if(data === 'success'){
					alert("사용 가능한 아이디입니다.")
					$('#message').text('사용할 수 있는 ID입니다.')   
					$('#message').css('color','green')
					$("#idcheck").val("true")
				}
				else {
					alert("사용 불가능한 아이디입니다.")
					$('#message').text('이미 사용 중인 아이디입니다.')
					$('#message').css('color','red')
					$("#idcheck").val("")
				}
			},
			error:function(){
				alert("error");
			}
		})
	}
	
	function isSame() { //비밀번호 재확인
		var pw = document.getElementById('password').value;
	    if (pw.length< 5) {
	    	document.getElementById('pid').innerHTML='6자리 이상 입력해 주세요.';
	        document.getElementById('pid').style.color='red';
            document.getElementById('pwcheckone').value ="";
	    }else{
	    	document.getElementById('pid').innerHTML='올바른 비밀번호입니다';
	        document.getElementById('pid').style.color='blue';
            document.getElementById('pwcheckone').value ="true";
	    	if(document.getElementById('password').value!=''&&document.getElementById('repassword').value !='') {
		    	if( document.getElementById('password').value == document.getElementById('repassword').value ) {
		    		document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
		            document.getElementById('same').style.color='blue';
		            document.getElementById('pwchecktwo').value ="true";
		        }
		        else {
		            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
		            document.getElementById('same').style.color='red';
		            document.getElementById('pwchecktwo').value ="";
		        }
		    }
	    }
	}
</script>

</body>
</html>

