<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="grade" value='<%=(String) session.getAttribute("grade")%>' />
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="user_id"
	value='<%=(String) session.getAttribute("userid")%>' />
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link href="${contextPath}/resources/css/basic.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<c:if test="${user_id==null}">
	<div class="Layout-module__content_area___b_3TU_login">
		<table class="top" style="text-align: center;">
			<tr>
				<td>
					<p style="color: black; text-align: center;">지금 바로 안전하게 네버를
						이용하세요</p>
				</td>
			</tr>
			<tr>
				<td>
					<div class="MyView-module__my_login___tOTgr">
						<a class="material-symbols-outlined"
							href="${contextPath}/user/login.do">NEVER LOGIN<!-- style="background-color: #2CA9E8; font-size: 35px; border-radius: 8px; color: black" -->
						</a>
					</div>
				</td>
			</tr>
			<tr>
				<td><a href="${contextPath}/user/new.do">회원가입&nbsp;</a><a
					href="${contextPath}/user/checkid.do">아이디/비밀번호찾기&nbsp;</a></td>
			</tr>
		</table>
	</div>

</c:if>
<c:if test="${user_id!=null}">
	<c:choose>
		<c:when test="${grade=='2'}">
			<div class="Layout-module__content_area___b_3TU">
				<table class="top" style="text-align: center;">
					<tr>
						<td colspan="3">
							<p style="color: black; text-align: center;">${user_id}님접속을
								환영합니다.</p>
						</td>
					</tr>

					<tr>
						<td colspan="3" style="text-align: center;"><input id="mof"
							style="border: none; background-color: #ffffff; height: 60px; font-size: 15px"
							type="button" onclick="mainmof()" value="메인배너 변경"> <input
							id="mainval" type="hidden" placeholder="변경할 youtube 주소를 입력해주십시오">
							<input id="mainmofbtn" type="hidden" onclick="changebanner()"
							value="변경"></td>
					</tr>
					<tr>
						<td>
							<div class="MyView-module__my_login___tOTgr">
								<a href="${contextPath}/user/logout.do"
									class="material-symbols-outlined">로그아웃 Logout</a>
							</div>
						</td>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td><a href="${contextPath}/user/usermodify.do">회원관리시스템</a></td>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td><a href="${contextPath}/cate/cateadd.do">카테고리 추가기능</a></td>
						</sec:authorize>
					</tr>
				</table>
			</div>
		</c:when>
		<c:otherwise>
			<nav>
				<div class="Layout-module__content_area___b_2TU">
					<table class="top" style="text-align: center;">
						<tr>
							<td colspan="3">
								<p style="color: black; text-align: center;">${user_id}님접속을
									환영합니다.</p>
							</td>
						</tr>
						<tr>
							<td>
								<div class="MyView-module__my_login___tOTgr">
									<a href="${contextPath}/user/logout.do"
										class="material-symbols-outlined">로그아웃 Logout</a>
								</div>
							</td>
							<td colspan="2"><input
								style="border: none; width: 112px; height: 94px; background-color: #ffffff"
								type="button" onclick="goPost()" value="회원정보조회"></td>
						</tr>
					</table>
				</div>
			</nav>
		</c:otherwise>
	</c:choose>
</c:if>
<div>
	<h1>오늘 날씨</h1>
<div id="ww_4d4525c77cac2" v='1.3' loc='id' a='{"t":"horizontal","lang":"ko","sl_lpl":1,"ids":[],"font":"Arial","sl_ics":"one_a","sl_sot":"celsius","cl_bkg":"image","cl_font":"#FFFFFF","cl_cloud":"#FFFFFF","cl_persp":"#81D4FA","cl_sun":"#FFC107","cl_moon":"#FFC107","cl_thund":"#FF5722"}'>Weather Data Source: <a href="https://wetterlang.de/seoul_wetter_30_tage/" id="ww_4d4525c77cac2_u" target="_blank">Wetter 30 tage Seoul</a></div><script async src="https://app2.weatherwidget.org/js/?id=ww_4d4525c77cac2"></script>
	<script async
		src="https://app2.weatherwidget.org/js/?id=ww_bd36c4ca1e081"></script>
	<script async
		src="https://app2.weatherwidget.org/js/?id=ww_e1359de239dd1"></script>
	<h1>슬라이딩 퍼즐 게임</h1>
	<p>타일을 클릭하여 퍼즐을 완성하세요.</p>
	<div class="puzzle-container">
		<!-- 여기에 타일들을 동적으로 생성하도록 JavaScript 코드 작성 -->
	</div>
</div>
<script>
function goPost(){
    let f = document.createElement('form');
    f.setAttribute('method', 'post');
    f.setAttribute('action', '${contextPath}/user/userinterface');
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', '${_csrf.parameterName}');
    obj.setAttribute('value', "${_csrf.token}");
    f.appendChild(obj);
    let id;
    id = document.createElement('input');
    id.setAttribute('type', 'hidden');
    id.setAttribute('name', 'user_id');
    id.setAttribute('value', "${user_id}");
    f.appendChild(id);
    document.body.appendChild(f);
    f.submit();
}
</script>
<style>
.puzzle-container {
	display: grid;
	grid-template-columns: repeat(3, 100px);
	grid-gap: 5px;
	width: 320px;
}

.puzzle-tile {
	width: 83.3px;
	height: 53.3px;
	background-size: cover; /* 이미지가 타일에 꽉 차도록 설정 */
	cursor: pointer;
}
</style>


<script>
        // 타일들의 이미지 경로
   const imagePaths = [
    "${contextPath}/resources/images/gameimage/image1.jpg",
    "${contextPath}/resources/images/gameimage/image2.jpg",
    "${contextPath}/resources/images/gameimage/image3.jpg",
    "${contextPath}/resources/images/gameimage/image4.jpg",
    "${contextPath}/resources/images/gameimage/image5.jpg",
    "${contextPath}/resources/images/gameimage/image6.jpg",
    "${contextPath}/resources/images/gameimage/image7.jpg",
    "${contextPath}/resources/images/gameimage/image8.jpg"
];

        // 퍼즐 게임 관련 변수
        const puzzleContainer = document.querySelector(".puzzle-container");
        const gridSize = 3;
        const totalTiles = gridSize * gridSize;

        // 타일의 위치 정보를 담는 배열
        let tilePositions = Array.from({ length: totalTiles }, (_, index) => index);

        // 게임 초기화 함수
        function initializeGame() {
            // 타일 배열을 섞어서 게임 시작
            shuffleTiles();
            // 타일들을 화면에 생성
            createTiles();
        }

        // 타일 배열을 섞는 함수
        function shuffleTiles() {
            for (let i = tilePositions.length - 1; i > 0; i--) {
                const j = Math.floor(Math.random() * (i + 1));
                [tilePositions[i], tilePositions[j]] = [tilePositions[j], tilePositions[i]];
            }
        }

        // 타일들을 화면에 생성하는 함수
        function createTiles() {
            puzzleContainer.innerHTML = "";
            for (let i = 0; i < totalTiles; i++) {
                const tile = document.createElement("div");
                tile.classList.add("puzzle-tile");
                tile.style.backgroundImage = "url(" + imagePaths[tilePositions[i]] + ")";
                tile.dataset.index = i;
                tile.addEventListener("click", moveTile);
                puzzleContainer.appendChild(tile);
            }
        }

        // 타일을 이동시키는 함수
        function moveTile() {
            const clickedIndex = parseInt(this.dataset.index);
            const emptyIndex = tilePositions.indexOf(totalTiles - 1);
            const rowDiff = Math.abs(Math.floor(clickedIndex / gridSize) - Math.floor(emptyIndex / gridSize));
            const colDiff = Math.abs(clickedIndex % gridSize - emptyIndex % gridSize);

            // 빈 타일과 인접한 타일인 경우에만 타일 이동
            if ((rowDiff === 1 && colDiff === 0) || (rowDiff === 0 && colDiff === 1)) {
                [tilePositions[clickedIndex], tilePositions[emptyIndex]] = [tilePositions[emptyIndex], tilePositions[clickedIndex]];
                createTiles();
                checkPuzzleSolved();
            }
        }

        // 퍼즐이 완성되었는지 확인하는 함수
        function checkPuzzleSolved() {
            for (let i = 0; i < totalTiles - 1; i++) {
                if (tilePositions[i] !== i) {
                    return;
                }
            }
            showMessage("축하합니다! 퍼즐을 완성했습니다!");
        }

        // 메시지를 보여주는 함수
        function showMessage(message) {
            alert(message);
        }

        // 페이지 로드 시 자동 실행
        $(document).ready(function () {
            initializeGame(); // 페이지가 로드되면 게임을 초기화
        });
    </script>


<script>
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
function mainmof() {
	$("#mof").attr("type","hidden");
	$("#mainval").attr("type","text");
	$("#mainmofbtn").attr("type","button");
}
function changebanner() {
	if(!$("#mainval").val()){
		alert("url을 입력해주십시오.");
		$("#mainval").focus();
		return
	}
	$.ajax({
		url : "${contextPath}/main/mainbanner", // servlet 
		type : "post",
		datatype : "text",
		data : {
			"val" :	$("#mainval").val()
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader(header, token);
		},
		success : function(data) {
				$("#mof").attr("type","button");
				$("#mainval").attr("type","hidden");
				$("#mainmofbtn").attr("type","hidden");
			    location.reload();

		},
		error : function() {
			alert("error");
		}
});
}
</script>
