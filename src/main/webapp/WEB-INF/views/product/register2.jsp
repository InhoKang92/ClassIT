<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/register2.css" />

<title>클래스잇 클래스 등록</title>
</head>
<body>

<div class="page-wrapper">
<%@include file="../includes/header.jsp" %>

	<div class="container">
		<!-- 깃테스트 -->
		<h2 class="register_title">클래스 일정선택</h2>
	
			<form role="form" class="register_form" action="/product/register3" method="post">
				<div class="date_info">
					<input name="product_no" type="hidden" value="${product_no}">
					<div class="select_box_cover">
						<div class="select_box">
							<label>일자 : </label>
							<input class="date" type="date" name='date'>
							<label>시간 : </label>
							<select class="time" name='time'>
								<option>----</option>
							</select>
							<input type="hidden" name="schedule">
						</div>
					</div>
					<button type="button" class="add_schedule">스케줄 추가하기</button>
				</div>
				<button class="register_btn" type="submit">등록하기</button>
			</form>
			
			
	</div>
	<%@include file="../includes/footer.jsp" %>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

<script>

	$(document).ready(function(){
			
		for(var i=8; i<22; i++){
			$(".time").append("<option>" + i + "시</option>");
		};
	})
	
	$(".add_schedule").on("click", function(e){
		e.preventDefault();

		const newSelectBox = $("<div class='select_box'>" +
	        "<label>일자 : </label><input class='date' type='date' name='date'>" +
	        "<label>시간 : </label><select class='time' name='time'><option>----</option></select>" +
	        "<input type='hidden' name='schedule'>" +
	        "</div>");

	    for (var i = 8; i < 22; i++) {
	        newSelectBox.find(".time").append("<option>" + i + "시</option>");
	    }

	    $(".select_box_cover").append(newSelectBox);
	})
	
	
	$(".register_btn").on("click", function(e){
		e.preventDefault();
		
		console.log($("input[name='product_no']").val());
		
		var yyyy = $(".date").val().substr(0, 4);
		var mm = $(".date").val().substr(5, 2);
		var dd = $(".date").val().substr(8, 2);
		var time = $(".time").val();
		console.log(time);
		
		$("input[name='schedule']").val(yyyy + "년 " + mm + "월 " + dd + "일 " + time);
		
		var schedule = $("input[name='schedule']").val();
		console.log(schedule);
		
		if($(".date").val()=="" || $(".time").val()=="----"){
			alert("최소 1개 이상의 스케줄을 선택해주세요.");
			if($(".date").val()==""){
				$(".date").focus();
			}
			if($(".time").val()=="----"){
				$(".time").focus();
			}
		}else{
			alert("새 클래스가 등록되었습니다.");
			$(".register_form").submit();
		}
		
	})
	
</script>
				
</body>
</html>