<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>클래스잇 비밀번호 초기화 결과</title>
    <link rel="stylesheet" href="styles.css"> <!-- 스타일 시트 링크 -->
    <style>
        @charset "UTF-8";

        .container {
            text-align: center;
            padding: 20px;
        }

        .result_title {
            font-family: 'Paperlogy-8ExtraBold';
            color: #3D7373;
            font-size: 24px;
        }

        .result_message {
            font-size: 20px;
            margin: 20px 0;
            color: #333;
        }

        .back_button {
            background: #3D7373;
            border: 2px solid #3D7373;
            color: #fff;
            font-size: 18px;
            padding: 10px 20px;
            cursor: pointer;
            text-decoration: none;
            border-radius: 5px;
        }

        .back_button:hover {
            background: #2c5858;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="result_title">비밀번호 초기화 결과</h2>
        <p class="result_message">${successMessage}</p>
        <a href="/classItLogin" class="back_button">로그인 페이지로 돌아가기</a>
    </div>
</body>
</html>
