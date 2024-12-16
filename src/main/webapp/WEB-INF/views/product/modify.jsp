<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/modify.css" />

<title>클래스잇 클래스 수정</title>
</head>
<body>

<div class="page-wrapper">
<%@include file="../includes/header.jsp" %>

	<div class="container">
		
		<h2 class="modify_title">클래스 수정하기</h2>
	
			<form class="modify_form" action="/product/modify" method="post">
				<div class="basic_info">
					<input type="hidden" name='product_no' value="${product.product_no}">
					<label>클래스명</label><input class="product_title" type="text" name='product_title' value="${product.product_title}">
					<label>작성자</label><input type="text" name='owner_id' value="${product.owner_id}">
					<label>클래스 카테고리</label><input type="text" name='class_category' value="${product.class_category}">
					<label>메인이미지(1장)</label>
					<div>
						<input type="text" name='main_img' value="${product.main_img}">
						<button class="file_select">파일 선택</button>
					</div>
					<label>1인당 수강료</label><input type="text" name='price_per_person' value="${product.price_per_person}">
					<label>회당 최대 수용 인원</label><input type="text" name='max_capacity' value="${product.max_capacity}">
					<label>위치</label><input type="text" name='location' value="${product.location}">
					<input type="hidden" name='location_code' value="${product.location_code}">
				</div>

				<div class="detail_info">
					<label>클래스 소개</label>
					<textarea rows="3" name='class_detail_1'>"${product.class_detail_1}"</textarea>
					<label>이런 분들이 들으면 좋아요</label>
					<textarea rows="3" name='class_detail_2'>"${product.class_detail_2}"</textarea>
					<label>커리큘럼</label>
					<textarea rows="3" name='class_detail_3'>"${product.class_detail_3}"</textarea>
					<label>제공사항</label>
					<textarea rows="3" name='class_detail_4'>"${product.class_detail_4}"</textarea>
					<label>유의사항</label>
					<textarea rows="3" name='class_detail_5'>"${product.class_detail_5}"</textarea>
				</div>
						
				<button class="modify_btn" type="submit">수정하기</button>
			</form>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

<script>
	
	$(".modify_btn").on("click", function(e){
		e.preventDefault();
		if($("input[name='product_title']").val()==""){
			alert("클래스명을 입력해주세요.");
			$("input[name='product_title']").focus();
		}else if($("input[name='class_category']").val()==""){
			alert("클래스 카테고리를 입력해주세요.");
			$("input[name='class_category']").focus();
		}else if($("input[name='price_per_person']").val()==""){
			alert("1인당 수강료를 입력해주세요.");
			$("input[name='price_per_person']").focus();
		}else if($("input[name='max_capacity']").val()==""){
			alert("회당 최대 수용 인원을 입력해주세요.");
			$("input[name='max_capacity']").focus();
		}else if($("input[name='location']").val()==""){
			alert("위치를 입력해주세요.");
			$("input[name='location']").focus();
		}else{
			console.log($("input[name='product_title']").val());
			console.log($("input[name='location_code']").val());
			alert("수정이 완료되었습니다.");
			$(".modify_form").submit();
		}
		
	})
	
</script>
				
</body>
</html>