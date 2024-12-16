<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/list.css" />

<title>클래스잇 클래스찾기</title>
</head>
<body>

	
	

	
	
	
<div class="page-wrapper">
<%@include file="../includes/header.jsp" %>
		<input class="user_role" type="hidden" value="${sessionScope.loginUser.role}">




	<div class="container">
	
		<div>
			<div class="title_box">
				<div>
					<h2 class="search_title">클래스 검색하기</h2>
				</div>
			</div>
			<form action="/product/list" method="post">
			
  				<label class="category_label" for="class_category">클래스 카테고리</label>
  				<select name="class_category" id="class_category">
  					<option value="">--------</option>
    				<option value="수공예" <%= "수공예".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>수공예</option>
    				<option value="드로잉" <%= "드로잉".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>드로잉</option>
    				<option value="음악" <%= "음악".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>음악</option>
    				<option value="스포츠" <%= "스포츠".equals(request.getAttribute("selected_Category")) ? "selected" : "" %>>스포츠</option>
  				</select>
  				
  				<label class="keyword_label" for="keyword">키워드</label>
  				<input type="text" id="keyword" name="keyword" value="${searched_keyword}">
  				
  				<input class="search_btn" type="submit" value="검색하기" />
  				<input class="reset_btn" value="검색 초기화" onclick="location.href='/product/list'" /> 
  				
  				<c:if test="${sessionScope.loginUser.role == 'ROLE_관리자'}">
  					<a href="/product/register1" class="class_register_btn">클래스 등록하기</a>
  				</c:if>
			</form>
		</div>
		<p class="result_box" ${result_display}>${search_result}</p>
  		
  		<div class="class_list class_list1">
  			<input type="hidden" value="${list2}" class="class_list1_value">
  			<c:forEach var="product" items="${list2}"> 
  				<div class="class_box" onclick="location.href='/product/sub?product_no=${product.product_no}'">
  					<div class="class_main_img" style="background-image:url('/resources/img/class_main_img/${product.main_img}')"></div>
  					<p class="class_category">${product.class_category}</p>
  					<h4 class="class_title">${product.product_title}</h4>
  					<p class="class_price">${product.price_per_person}원</p>
  				</div>
  			</c:forEach>
  		</div>
  		
  		<div class="class_list class_list2">
  			<input type="hidden" value="${list}" class="class_list2_value">
  			<c:forEach var="product" items="${list}"> 
  				<div class="class_box" onclick="location.href='/product/sub?product_no=${product.product_no}'">
  					<div class="class_main_img" style="background-image:url('/resources/img/class_main_img/${product.main_img}')"></div>
  					<p class="class_category">${product.class_category}</p>
  					<h4 class="class_title">${product.product_title}</h4>
  					<p class="class_price">${product.price_per_person}원</p>
  				</div>
  			</c:forEach>
  		</div>
  		
  		<p class="msg_box">${msg}</p>
  		
	</div>
	<%@include file="../includes/footer.jsp" %>
</div>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	
	<script>
	
	if($(".class_list1_value").val()===""){
		$(".class_list1").hide();
	}
	
	if($(".class_list2_value").val()===""){
		$(".class_list2").hide();
	}
	
	$(".class_box").hover(function() { 
		$(this).css("box-shadow", "0px 0px 20px #444");
	}, function(){
		$(this).css("box-shadow", "none");
	});
		
	console.log($(".user_role").val());

	</script>
	
</body>
</html>