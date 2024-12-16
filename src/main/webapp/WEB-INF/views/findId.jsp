<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>클래스잇 아이디 찾기</title>
    <link rel="stylesheet" href="styles.css"> <!-- 스타일 시트 링크 -->
    <style>
        @charset "UTF-8";

        .container {
            text-align: center;
            padding: 20px;
        }

        .login_title a {
            font-family: 'Paperlogy-8ExtraBold';
            color: #3D7373;
            font-size: 24px;
            text-decoration: none;
        }

        .login_form {
            display: inline-block;
            width: 500px;
            border: 1px solid #3D7373;
            padding: 20px;
            margin-top: 20px;
            background-color: #f9f9f9;
        }

        .id_input, .pw_input {
            width: 100%;
            font-size: 20px;
            padding: 10px;
            border: 1px solid black;
            margin: 10px 0;
        }

        .btn_box {
            position: relative;
            width: 100%;
            display: flex;
            margin-top: 20px;
        }

        input[type="submit"] {
            width: 100%;
            background: #3D7373;
            border: 2px solid #3D7373;
            cursor: pointer;
            font-size: 18px;
            color: #fff;
            padding: 10px;
        }

        .error_msg {
            color: red;
            margin-top: 10px;
        }

        .find_btns {
            margin-top: 10px;
            margin-left: -10px;
        }

        .find_btns > button {
            position: relative;
            background: none;
            border: none;
            color: #3D7373;
            font-size: 14px;
            margin: 0 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="login_title"><a href="#">아이디 찾기</a></h2>
        <form class="login_form" action="/findId" method="post">
            <label for="user_name">이름:</label>
            <input type="text" id="user_name" name="user_name" class="id_input" required><br/>
            
            <label for="user_birth">생년월일:</label>
            <input type="date" id="user_birth" name="user_birth" class="id_input" required><br/>
            
            <label for="user_number">전화번호:</label>
            <input type="text" id="user_number" name="user_number" class="id_input" required><br/>
            
            <input type="submit" value="아이디 찾기">
        </form>

        <c:if test="${not empty errorMessage}">
            <p class="error_msg">${errorMessage}</p>
        </c:if>
    </div>
</body>
</html>

