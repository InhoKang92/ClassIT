<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/confirm.css" />

<title>클래스잇 예약확인</title>
</head>
<body>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>



<div class="page-wrapper">

	<%@include file="../includes/header.jsp" %>
	
	
	
	
	<div class="container">
	
		<h2 class="reserve_title">클래스 예약확인</h2>
	
		<div class="class_info_box">
			<h3>클래스 정보</h3>
			<div class="class_info">
				<div class="img_box" style="background-image:url('/resources/img/class_main_img/${product.main_img}')"></div>
				<div class="class_detail">
					<div>
						<p>카테고리</p>
						<p class="content">${product.class_category}</p>
					</div>
					<div>
						<p>클래스명</p>
						<p class="content">${product.product_title}</p>
					</div>
					<div>
						<p>장소</p>
						<p class="content">${product.location}</p>
					</div>
					<div>
						<p>일시</p>
						<p class="content">${selected_schedule}</p>
					</div>
				</div>
			</div>
		</div>
		
		<div class="pay_user_info">
			<form class="pay_form" method="post" action="/paySuccess">
				<input type="hidden" name="product_title" value="${product.product_title}">
				<input type="hidden" name="selected_schedule" value="${selected_schedule}">
				<input type="hidden" name="reserve_number" value="${reserve_number}">
				
				<input type="hidden" class="msg" name="msg" value=""> 
		
				<h3>결제 정보</h3>
				<h2 class="merchant_name">${product.product_title} 수강권 ${reserve_number}매</h2>
				<div>
					<p>1인당 수강료</p>
					<p class="content price2"></p>
				</div>
				<div>
					<p>인원수</p>
					<p class="content">x  ${reserve_number}명</p>
				</div>
				<div>
					<p>소계</p>
					<p class="content amount">=  ${reserve_amount}원</p>
				</div>
			</form>
			<div class="user_info">
				<h3>수강생 정보</h3>
				<div>
					<p>이름</p>
					<p class="content">${sessionScope.loginUser.username}</p>
				</div>
				<div>
					<p>아이디</p>
					<p class="content">${sessionScope.loginUser.userid}</p>
				</div>
				<div>
					<p>연락처</p>
					<p class="content">${sessionScope.loginUser.number}</p>
				</div>
				<div>
					<p>주소</p>
					<p class="content">${sessionScope.loginUser.addr}</p>
				</div>
			</div>
		</div>
		<div class="pay_btn_box">
			<button class="pay_btn kakao_pay_btn">카카오페이(테스트용) 결제하기<div class="kakao_pay_icon"></div></button>
			<button class="pay_btn kg_pay_btn">KG이니시스 결제하기</button>
		</div>
		
		
		<input class="price content" type="hidden" value="${product.price_per_person}">

	</div>
	<%@include file="../includes/footer.jsp" %>
</div>



<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

<script>
	
		var price = $(".price").val()*1;	
		var price_reg = price.toLocaleString();
		
		$(".price2").html(price_reg + '원');
		
</script>

<script type='text/javascript'>

	$('.kakao_pay_btn').on('click', function(e) {
		e.preventDefault();
		var merchant_name = $(".merchant_name").html();
		var amount = $(".amount").html();
		
				IMP.init('imp81122605');
				IMP.request_pay({
					channelKey: "channel-key-ab50f412-e104-4c26-aaba-ae71f6121dc9",
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : merchant_name, //결제창에서 보여질 이름
					amount : amount, //실제 결제되는 가격
					buyer_email : 'iamport@siot.do',
					buyer_name : '구매자이름',
					buyer_tel : '010-1234-5678',
					buyer_addr : '서울 강남구 도곡동'
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = 'success';
						var actionForm =$(".pay_form");
						$(".msg").val(msg);
						//const a_completed = $("<input type='hidden' value='T' name='a_completed'>");
						//actionForm.append(a_completed);
						//console.log(actionForm);
						//actionForm.find("input[name='p_id']").val($(this).attr("href"));
						actionForm.submit();
					} else {
						var msg = '결제에 실패하였습니다.';
						$(".msg").val(msg);
						msg += '/ 에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});

	});
	
	$('.kg_pay_btn').on('click', function(e) {
		e.preventDefault();
		var merchant_name = $(".merchant_name").html();
		var amount = $(".amount").html();
		
				IMP.init('imp81122605');
				IMP.request_pay({
					channelKey: "channel-key-af3359cb-70d6-42ac-b292-ca022fd390ea",
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : merchant_name, //결제창에서 보여질 이름
					amount : amount, //실제 결제되는 가격
					buyer_email : 'iamport@siot.do',
					buyer_name : '구매자이름',
					buyer_tel : '010-1234-5678',
					buyer_addr : '서울 강남구 도곡동'
				}, function(rsp) {
					console.log(rsp);
					if (rsp.success) {
						var msg = 'success';
						var actionForm =$(".pay_form");
						$(".msg").val(msg);
						//const a_completed = $("<input type='hidden' value='T' name='a_completed'>");
						//actionForm.append(a_completed);
						//console.log(actionForm);
						//actionForm.find("input[name='p_id']").val($(this).attr("href"));
						actionForm.submit();
					} else {
						var msg = '결제에 실패하였습니다.';
						$(".msg").val(msg);
						msg += '/ 에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});

	});
	
</script>

</body>
</html>