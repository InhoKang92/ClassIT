<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/classItLogin.css" />

<title>클래스잇 로그인</title>
</head>
<body>


<div class="page-wrapper">


	<div class="container">

		<h1 class="login_title"><a href='/'>CLASS IT</a></h1>
		

		<form class="login_form" method='post' action="/login">
       <input type="hidden" name="redirectUrl" value="${param.redirectUrl}">
			<div>
				<input class="id_input" type='text' name='username' placeholder="아이디" required>
			</div>
			<div>
				<input class="pw_input" type='password' name='password' placeholder="비밀번호" required>
			</div>
			
			<p class="error_msg"><c:out value="${error}" /> </p>
			<p class="alert_msg"><c:out value="${alert}" /> </p>
			<p class="logout_msg"><c:out value="${logout}" /></p>
				
			<div>
				<div class="btn_box">
					<input class="login_login_btn" type='submit' value="로그인">
					<input class="login_join_btn" type="button" value="회원가입" onclick="location.href='/classItSignUp'">
				</div>
				
				<div class="find_btns">
					<button><a href="/findId">아이디 찾기</a></button>
					<button><a href="/resetPw">비밀번호 초기화</a></button>
				</div>
				
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</div>
		</form>

	</div>
</div>
</body>
</html>
