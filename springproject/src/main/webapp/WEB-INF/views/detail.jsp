<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
    /* 상세보기 창 스타일 */
    .detail-container {
        max-width: 800px;
        margin: auto;
        padding: 10px;
        font-size: 18px;
        color: #111;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .detail-title {
        text-align: center;
        margin-bottom: 10px;
    }

    .detail-table {
        width: 100%;
        border-collapse: collapse;
    }

    .detail-table th,
    .detail-table td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ccc;
    }

    .detail-table th {
        width: 120px;
    }

    .detail-table td {
        font-weight: bold;
    }

    .back-button {
        text-align: center;
        margin-top: 20px;
    }

    .back-button a {
        display: inline-block;
        padding: 10px 20px;
        background-color: #337ab7;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
    }

    .back-button a:hover {
        background-color: #286090;
    }
</style>

<div id="content">
    <h2 class="sub_h2_tit" style="text-align: center;">게시물 상세보기 창</h2>
    <div class="container_wrap">
        <div class="container_inner">
            <div class="detail-container">
                <h2 class="detail-title">게시물 상세</h2>
                <table class="detail-table">
                    <tr>
                        <th>번호:</th>
                        <td><c:out value="${board.bno}" /></td>
                    </tr>
                    <tr>
                        <th>제목:</th>
                        <td><c:out value="${board.btie}" /></td>
                    </tr>
                    <tr>
                        <th>작성자:</th>
                        <td><c:out value="${board.bwriter}" /></td>
                    </tr>
                    <tr>
                        <th>내용:</th>
                        <td><c:out value="${board.bcon}" /></td>
                    </tr>
                    <tr>
                        <th>카테고리:</th>
                        <td><c:out value="${board.cate}" /></td>
                    </tr>
                    <tr>
                        <th>작성일:</th>
                        <td><fmt:formatDate value="${board.bdate}" pattern="yyyy/MM/dd" /></td>
                    </tr>
                </table>
            </div>
            <div class="back-button">
                <a href="<c:url value='/main.do'/>">메인 화면으로 돌아가기</a>
            </div>
        </div>
    </div>
</div>
