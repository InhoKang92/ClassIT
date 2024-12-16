<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/register1.css" />

<title>클래스잇 클래스 등록</title>
</head>
<body>

<div class="page-wrapper">
<%@include file="../includes/header.jsp" %>

	<div class="container">
		<!-- 깃테스트 -->
		<h2 class="register_title">클래스 등록하기</h2>
	
			<form role="form" class="register_form" action="/product/register2" method="post">
				<div class="basic_info">
					<label>클래스명</label><input class="product_title" type="text" name='product_title' placeholder="예) 나만의 디저트 케이크+마카롱캔들 원데이클래스">
					<label>작성자</label><input type="text" name='owner_id' value="${sessionScope.loginUser.userid}" readonly>
					<label>클래스 카테고리</label><input type="text" name='class_category' placeholder="예) 수공예, 드로잉, 음악, 스포츠">
					<label>메인이미지(1장)</label>
					<div>
						<input type="text" name='main_img' value="선택된 파일 없음">
						<button class="file_select">파일 선택</button>
					</div>
					<label>1인당 수강료</label><input type="text" name='price_per_person' placeholder="단위를 제외한 숫자만 적어주세요. 예) 50000">
					<label>회당 최대 수용 인원</label><input type="text" name='max_capacity' placeholder="단위를 제외한 숫자만 적어주세요. 예) 10">
					<label>위치</label><input type="text" name='location' placeholder="예) 서울특별시 중구 주교동 17 301호">
					<input type="hidden" name='location_code' value="">
				</div>

				<div class="detail_info">
					<label>클래스 소개</label>
					<textarea rows="3" name='class_detail_1'></textarea>
					<label>이런 분들이 들으면 좋아요</label>
					<textarea rows="3" name='class_detail_2'></textarea>
					<label>커리큘럼</label>
					<textarea rows="3" name='class_detail_3'></textarea>
					<label>제공사항</label>
					<textarea rows="3" name='class_detail_4'></textarea>
					<label>유의사항</label>
					<textarea rows="3" name='class_detail_5'></textarea>
				</div>
						
				<button class="register_btn" type="submit">다음 단계로 가기</button>
			</form>
	</div>
	<%@include file="../includes/footer.jsp" %>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

<script>
	
	$(".register_btn").on("click", function(e){
		e.preventDefault();
		if($("input[name='product_title']").val()==""){
			alert("클래스명을 입력해주세요.");
			$("input[name='product_title']").focus();
		}else if($("input[name='class_category']").val()==""){
			alert("클래스 카테고리를 입력해주세요.");
			$("input[name='class_category']").focus();
		}else if($("input[name='main_img']").val()==""){
			alert("클래스 메인 이미지를 등록해주세요.");
			$("input[name='price_per_person']").focus();
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
			$(".register_form").submit();
		}
		
	})
	
</script>
				
</body>
</html>