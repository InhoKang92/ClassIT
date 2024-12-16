<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/common_for_index.css" />
<link rel="stylesheet" href="/resources/css/index.css" />

<title>클래스잇</title>
</head>
<body>


	<div class="page-wrapper">
		<input class="user_role" type="hidden" value="${sessionScope.loginUser.role}">
		<div class="header_wrapper">
			<div class="header">
				<p>당 신 이 원 하 는 모 든 클 래 스</p>
				<h1 class="header_title">
					<a href='/'>C L A S S I T</a>
				</h1>
				
					<c:if test="${not empty sessionScope.loginUser}">
						<p class="welcome_msg">환영합니다, ${sessionScope.loginUser.username}님(${sessionScope.loginUser.role})</p>
					</c:if>
					
				<div class="header_btns">
					<button class="search_btn" onclick="location.href='/product/list'">클래스
						보기</button>
					<button class="recomm_btn" onclick="location.href='/classRecomm'">클래스
						추천</button>
					<c:choose>
						<c:when test="${not empty sessionScope.loginUser}">
							<c:if test="${sessionScope.loginUser.role == '회원'}">					
								<button class="login_btn" onclick="location.href='/mypage/myinfo'">마이페이지</button>
							</c:if>
							<c:if test="${sessionScope.loginUser.role == 'ROLE_사장'}">
								<button class="login_btn" onclick="location.href='/owner/reserve'">관리페이지</button>
							</c:if>
							<button class="join_btn" onclick="location.href='/customLogout'">로그아웃</button>

						</c:when>
						<c:otherwise>
							<button class="login_btn" onclick="location.href='/classItLogin'">로그인</button>
							<button class="join_btn" onclick="location.href='/classItSignUp'">회원가입</button>
						</c:otherwise>
					</c:choose>

				</div>
				<div class="header_menu"></div>
			</div>
		</div>

		<div class="main_img"></div>
		<div class="main_img_cover"></div>

		<div class="container"></div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
		
	<script>
		console.log($(".user_role").val());
	</script>

</body>
</html>