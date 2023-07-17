<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
/* 전체 스타일 */

/* 페이지 컨테이너 스타일 */
body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: auto;
	margin: 0;
	padding: 0;
}

#content {
	max-width: 800px;
	margin: auto;
	padding: 10px;
	font-size: 18px;
	color: #111;
	border: 1px solid #ccc; /* 콘텐츠 주위에 테두리 추가 */
	border-radius: 5px; /* 모서리를 둥글게 */
}

/* 게시판 스타일 */

/* 테이블 스타일 */
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid hwb(212 51% 1%);
}

/* 서브 타이틀 스타일 */
.sub_h2_tit {
	text-align: center;
	margin-bottom: 10px;
}

/* 컨테이너 랩 스타일 */
.container_wrap {
	margin: 10px 0;
}

.container_inner {
	margin-bottom: 10px;
}

/* 카테고리 스타일 */
.notice_category {
	list-style: none;
}

/* 게시판 랩 스타일 */
#board_wrap {
	overflow-x: auto;
	margin-top: 10px;
	max-height: 800px; /* 필요에 따라 값 조정 */
	overflow-y: auto;
}

/* 게시판 목록 스타일 */
#list_wrap {
	width: 100%;
}

/* 게시물 번호, 제목, 작성자, 댓글 수, 조회수, 등록일 스타일 */
.bo_num, .bo_tit, .bo_writer, .bo_comments, .bo_cnt, .bo_regDate {
	text-align: center;
}

/* 네비게이션 스타일 */
.nav {
	margin-top: 10px;
	text-align: center;
}

.nav ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.nav ul li {
	display: inline-block;
	margin-right: 5px;
}

.nav ul li a {
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	text-decoration: none;
	color: #333;
}

.nav ul li a.sel {
	background-color: #f1f1f1;
}

/* 새 글 추가 버튼 스타일 */
.add-post-button {
	text-align: right;
	margin-top: 10px;
}

.add-post-button a {
	padding: 5px 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	text-decoration: none;
	color: #333;
}

.add-post-button a:hover {
	background-color: #f1f1f1;
}

/* 플래시 메시지 스타일 */
.flash-message {
	margin-top: 10px;
	padding: 10px;
	background-color: #f1f1f1;
	color: #333;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.flash-message.success {
	background-color: #d4edda;
	color: #155724;
}

.flash-message.error {
	background-color: #f8d7da;
	color: #721c24;
}

/* 반응형 스타일 */
@media ( max-width : 768px) {
	#content {
		width: 90%;
	}
}
</style>

<div id="content">
	<h2 class="sub_h2_tit">게시판</h2>
	<!-- 게시판 시작 -->
	<div class="container_wrap">
		<div class="container_inner">
			<ul class="notice_category"></ul>
		</div>

		<!-- 게시판 목록 영역 -->
		<div id="board_wrap">
			<table id="list_wrap">
				<thead>
					<tr>
						<th class="bo_num">번호</th>
						<th class="bo_tit">제목</th>
						<th class="bo_writer">글쓴이</th>
						<th class="bo_comments">댓글</th>
						<th class="bo_regDate">등록일</th>
					</tr>
				</thead>
				<tbody>
					<!-- <tbody> 태그 다음에 아래 코드를 추가하세요 -->
					<c:if test="${not empty sdsd}">
						<<c:forEach items="${boardList}" var="board">
							<tr>
								<td class="bo_num"><c:out value="${board.bno}" /></td>
								<td class="bo_tit"><a
									href="<c:url value='/board/detail?bno=${board.bno}'/>"
									target="_blank"> <c:out value="${board.btie}" />
								</a></td>
								<td class="bo_writer"><c:out value="${board.bwriter}" /></td>
								<td class="bo_comments"><c:out value="${board.reply}" /></td>
								<td class="bo_regDate"><c:out value="${board.bdate}" /></td>
								<td class="bo_imageurl"><img
									src="<c:url value='${board.imageurl}'/>" alt="Image" /></td>
							</tr>
						</c:forEach>

					</c:if>

					<!-- 테스트 텍스트 추가 -->
					<tr>
						<td class="bo_num">1</td>
						<td class="bo_tit"><a
							href="<c:url value='/board/detail?bno=1'/>"><c:out
									value="${board.btie}" />테스트 게시물 제목</a></td>
						<td class="bo_writer">테스트 작성자</td>
						<td class="bo_comments">0</td>
						<td class="bo_regDate">2023/07/16</td>
					</tr>
				</tbody>
			</table>
			<div class="add-post-box">
				<div class="add-post-button">
					<a href="<c:url value='/board/add'/>">새 글 추가</a>
				</div>
				<c:if test="${not empty message}">
					<div class="flash-message ${messageType}">${message}</div>
				</c:if>
			</div>
			<div class="nav">
				<ul>
					<c:if test="${requestScope.pageResponse.showPrev}">
						<li class="nav_prev"><a
							href="<c:url value='/qna/list?page=${requestScope.pageResponse.page - 1}&size=${requestScope.pageResponse.size}'/>">[이전]</a></li>
					</c:if>
					<c:forEach begin="${requestScope.pageResponse.start}"
						end="${requestScope.pageResponse.end}" var="num">
						<li><a
							href="<c:url value='/qna/list?page=${num}&size=${requestScope.pageResponse.size}'/>"
							class="${num == requestScope.pageResponse.page ? 'sel' : ''}">${num}</a></li>
					</c:forEach>
					<c:if test="${requestScope.pageResponse.showNext}">
						<li class="nav_next"><a
							href="<c:url value='/qna/list?page=${requestScope.pageResponse.page + 1}&size=${requestScope.pageResponse.size}'/>">[다음]</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</div>
