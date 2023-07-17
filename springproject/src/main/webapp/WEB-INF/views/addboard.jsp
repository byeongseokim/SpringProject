<!-- 새 글 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <script src="https://cdn.ckeditor.com/ckeditor5/38.1.1/classic/ckeditor.js"></script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
            margin: 0;
            padding: 0;
        }

        #content {
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 8px;
            margin: auto;
            font-size: 18px;
            color: #111;
            width: 50%;
            min-height: 400px; /* 원하는 대로 높이를 조정 */
        }

        form {
            margin-top: 20px;
        }

        form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        form input[type="text"],
        form textarea {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }

        form button[type="submit"] {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            background-color: #333;
            color: #fff;
            cursor: pointer;
            float: right;
        }

        form button[type="submit"]:hover {
            background-color: #111;
        }
        
        /* 반응형 스타일 */
        @media (max-width: 768px) {
            #content {
                width: 90%;
            }
        }
    </style>
</head>

<div id="content">
    <h2>새로운 글 등록하기</h2>
    <form action="<c:url value='/'/>" method="post">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required>

        <label for="writer">작성자:</label>
        <input type="text" id="writer" name="writer" required>

        <label for="content">내용:</label>
        <div id="editor"></div>
        <textarea name="content" style="display: none;"></textarea>

        <br/>

        <button type="submit" style="text-align: right; float: right;">등록하기</button>
    </form>
</div>

<script>
    ClassicEditor
        .create(document.querySelector('#editor'))
        .then(editor => {
            editor.setData(''); // 초기 데이터 지우기
            console.log('에디터가 초기화되었습니다', editor);
        })
        .catch(error => {
            console.error(error);
        });
</script>
