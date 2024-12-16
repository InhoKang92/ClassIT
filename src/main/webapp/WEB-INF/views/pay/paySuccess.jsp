<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/paySuccess.css" />

<title>클래스잇 결제완료</title>
</head>
<body>

<div class="page-wrapper">
<%@include file="../includes/header.jsp" %>

	<div class="container">
		<input type="hidden" name="product_title" value="${product.product_title}">
		<input type="hidden" name="selected_schedule" value="${selected_schedule}">
		<input type="hidden" name="reserve_number" value="${reserve_number}">
		<div>
			<h1>결제가 완료되었습니다.</h1>
			<div class="btn_box">
				<button><a href="/mypage/reserve">내 예약내역</a></button>
				<button><a href='/'>메인 페이지</a></button>
			</div>
		</div>
	</div>
	<div class="for_scroll">
  			
  	</div>
<%@include file="../includes/footer.jsp" %>
</div>
	
</body>
</html>