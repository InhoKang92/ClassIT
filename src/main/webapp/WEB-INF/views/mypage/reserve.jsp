<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>클래스잇 마이페이지</title>
	
	<link rel="stylesheet" href="/resources/css/mypage/reserve.css" />
	<script type="text/javascript" src="/resources/js/review.js"></script>	
	<script type="text/javascript" src="/resources/js/reserve.js"></script>
	
	<!-- 헤더, 마이페이지헤더의 css -->
	<link rel="stylesheet" href="/resources/css/common.css" />
	<link rel="stylesheet" href="/resources/css/mypage/sidebar.css" />
	<!-- 제이쿼리 -->
  	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
   	<!-- 부트스트랩 // 사용여부에 따라 삭제하셔도 됩니다. -->
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
	<!-- 부트스트랩과 충돌되어서 추가 -->
	<style>		
		a {
		text-decoration: none;
		}

		.review-box {
			width: 1000px;
		}
	</style>
	
	
	
	

</head>




<body>
	<%@include file="includes/mypage_header.jsp"%>
	
<div id="schedule-due" class="review-box">
    <h2>예정된 클래스</h2>
    <table class="table">
        <thead>
            <tr>
                <th>번호</th>
                <th>클래스명</th>
                <th>클래스 수강 일</th>
                <th>수강인원</th>
                <th>승인여부</th>
                <th></th>
            </tr>
            <tr>
            	<th></th>
            	<th></th>
                <th>결제일</th>
                <th>결제금액</th>
                <th>결제현황</th>
                <th>버튼</th>
            </tr>
        </thead>

		<!-- 예약 리스트 생성 구간-->
    </table>
</div>

 
<div id="schedule-complete" class="review-box">
    <h2>완료된 클래스</h2>
    <table class="table">
        <thead>
            <tr>
                <th rowspan="2">번호</th>
                <th>클래스명</th>
                <th>클래스 수강 일</th>
                <th>수강인원</th>
                <th>승인여부</th>
                <th rowspan="2">버튼</th>
            </tr>
            <tr>
            	<th></th>
                <th>결제일</th>
                <th>결제금액</th>
                <th>결제현황</th>
            </tr>
        </thead>

		<!-- 예약 리스트 생성 구간-->
    </table>
</div>

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="reviewModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">모달</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      		</div>
      		<div class="modal-body">
      
				<form id="modal-form" name="modal-form">
					<table>
						<tr class="review_date">
							<td><input type="text" name="review_date" readonly></p></td>
						</tr>
						<tr>
							<td>별점 : 
							<select name="review_rate">
								<option value="5">⭐⭐⭐⭐⭐</option>
								<option value="4">⭐⭐⭐⭐</option>
								<option value="3">⭐⭐⭐</option>
								<option value="2">⭐⭐</option>
								<option value="1">⭐</option>
							</select></td>
						</tr>

						<tr>
							<td><input type="text" placeholder="제목을 입력하세요." name="review_title"></td>
						</tr>
						<tr>
							<td><textarea placeholder="문의하실 내용을 입력하세요." name="review_text"></textarea></td>
						</tr>
						<tr>
							<td><input type="file" name="uploadFile"></td>
						</tr>
					</table>		
					<input type="hidden" name="reserve_no">
					<input type="hidden" name="user_id">
					<input type="hidden" name="review_img">
					<input type="hidden" name="review_no">
				</form>
				<div id="img-view">
				</div>
     		</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-primary" id="reviewModal-submit">등록</button>
				<button type="button" class="btn btn-primary" id="reviewModal-update-modal">수정</button>
				<button type="button" class="btn btn-primary" id="reviewModal-update">저장</button>
				<button type="button" class="btn btn-danger" id="reviewModal-delete">삭제</button>
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reviewModal-close">Close</button>
			</div>
    	</div>
  	</div>
</div>
	
	
	
	
		
	
		
	
	
	
	
	<%@include file="includes/mypage_footer.jsp"%>
<script type="text/javascript">
$(document).ready(function () {

	const user_id = "${sessionScope.loginUser.userid}";
	const tbodyWrap = $('#tbody-wrap');
	
	showUserReviewList();

	/// 사용자별 구매리스트 
	function showUserReviewList(){
		reviewService.getListForUser(user_id,function(list){

			let str ="";

			let strDue = "";
			let strComplete = "";

			for (let i = 0; i < list.length; i++) {
				const data = list[i];


				const product = data.product;
				const reserve = data.reserve;
				const review = data.review;
				const schedule = data.schedule;
				const date = reviewService.StringDate(schedule.schedule);
				
				const now = new Date();	// 현재 날짜 객체


				if (now > date || (now.toDateString() === date.toDateString() && now.getTime() >= date.getTime())) { // (클래스가 시작된 이후)
					strComplete += '<tbody class="hover-group"><tr><tr>'
					strComplete += '<td rowspan="2">' + reserve.reserve_no +'</td>'

					strComplete += '<td><a href="/product/sub?product_no='+ product.product_no +'">'+product.product_title+'</a></td>'
					strComplete += '<td>'+reviewService.displayTime(date)+" "+date.getHours()+'시</td>'
					strComplete += '<td>'+ reserve.reserve_number +'명</td>'
					strComplete += '<td>' + reviewService.reserveApproval(reserve.reserve_approval) + '</td>'
					strComplete += '<td rowspan="2" class="tr-button">';
						if(reserve.reserve_approval == 2){
							strComplete += "승인거부";

						}else{
							if((review.review_no == null) || (review.review_no == "")){
								strComplete +='<button class="review-create" data-reserve_no="'+ reserve.reserve_no +'" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewModal" >리뷰쓰기</button>';
							}else{
								strComplete +='<button class="review-view" data-review-no ="'+ review.review_no +'" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewModal" >리뷰보기</button>';
							}
							
						}

					strComplete += '</td></tr>'
					strComplete += '<tr><td></td>'
					strComplete += '<td>'+reviewService.displayTime(reserve.reserve_date)+'</td>'
					strComplete += '<td>'+ formatNumber(reserve.reserve_amount) +'원</td>'
					strComplete += '<td>결제완료</td>'
					strComplete += '</tr>'
					strComplete += '</tbody>'	
				} else {

					strDue += '<tbody class="hover-group"><tr><tr>'
					strDue += '<td rowspan="2">' + reserve.reserve_no +'</td>'

					strDue += '<td><a href="/product/sub?product_no='+ product.product_no +'">'+product.product_title+'</a></td>';
					strDue += '<td>'+reviewService.displayTime(date)+" "+date.getHours()+'시</td>'
					strDue += '<td>'+ reserve.reserve_number +'명</td>'
					strDue += '<td>' + reviewService.reserveApproval(reserve.reserve_approval) + '</td>'
					strDue += '<td rowspan="2" class="tr-button">';

						if(reserve.reserve_approval == 2){
							strDue += "승인거부";
						} else if (now < date) { // 현재 날짜가 date보다 이전
							strDue += '<button class="cancel" data-reserve_no='+ reserve.reserve_no +'>결제취소</button>';
						} else if (now.toDateString() === date.toDateString() && now.getTime() <= date.getTime()) {
							// 현재 날짜와 date가 같은 날이고, 시간도 같거나 이전
							strDue += "취소 불가능";		
						}		
						strDue += '</td></tr>'
						strDue += '<tr><td></td>'
						strDue += '<td>'+reviewService.displayTime(reserve.reserve_date)+'</td>'
						strDue += '<td>'+ formatNumber(reserve.reserve_amount) +'원</td>'
						strDue += '<td>결제완료</td>'
						strDue += '</tr>'
						strDue += '</tbody>'

				}
			}
			$('#schedule-due > .table').append(strDue);
			$('#schedule-complete > .table').append(strComplete);



		}); // end reviewService.getListForUser



	};  //end showUserReviewList()
	



	//	숫자 , 입력
	function formatNumber(number) {
    	return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	// 모달
	var reviewModal = $("#reviewModal"); 
	const reviewClose = $("#reviewModal-close");
    const reviewSubmit = $("#reviewModal-submit");  // submit 버튼
	const reviewUpdateModal = $("#reviewModal-update-modal");  // 리뷰확인 > 수정으로 변경 버튼
	const reviewUpdate = $("#reviewModal-update");  // 수정내용 update 저장 버튼
	const reviewDelete = $("#reviewModal-delete");  // 삭제 버튼

    
    var modalReviewTitle = reviewModal.find("input[name='review_title']"); // 제목 입력 필드 선택
    var modalReviewText = reviewModal.find("textarea[name='review_text']"); // 내용 입력 필드 선택
	var modalReviewRate= reviewModal.find("select[name='review_rate']"); // 점수 입력 필드 선택
	var modalReserveNo = reviewModal.find("input[name='reserve_no']"); // 예약번호전달
    var modalUserId = reviewModal.find("input[name='user_id']"); // 사용자 아이디 전달
	var modalReviewImg = reviewModal.find("input[name='review_img']"); // 이미지 파일명 input
	var modalReviewDate = reviewModal.find("input[name='review_date']"); // 리뷰일 input
	var modalUpload = reviewModal.find("input[name='uploadFile']"); // 업로드 input
	var modalReviewNo = reviewModal.find("input[name='review_no']"); // 리뷰번호

	var modalTitle = $("#staticBackdropLabel"); // 모달의 타이틀(모달하나로 이용하니 용도마다 타이틀을 바꿔준다)
    
    
	// 리뷰 쓰기 버튼
	$(document).on("click", ".review-create", function(e) {

		console.log("리뷰작성");

		var reserve_no = $(this).data("reserve_no");	// 리뷰쓰기 버튼에 저장된 예약 번호

		modalTitle.text("리뷰 작성");

		// 창 정리(필드 초기화)
		$("#reviewModal .modal-content *").show();
		$("[disabled]").prop("disabled", false);
		$("#reviewModal").find("input, select, textarea").val("");
		$("#img-view").html("");

		// 숨김처리
		modalReviewDate.hide();

		// value값 추가
		modalReviewRate.val(5);	// 별점 기본 5로 두기
		modalUserId.val(user_id);
		modalReserveNo.val(reserve_no);

		// 버튼 정리
		reviewModal.find("button").hide(); //리뷰작성submit버튼만 남김
		reviewSubmit.show(); // submit버튼 
		reviewClose.show()
	}); //.question-remove
	
	//리뷰 등록 버튼
	$(document).on("click","#reviewModal-submit", function(e) {
		$(this).addClass("disabled")

		if(modalReviewTitle.val() == null || modalReviewTitle.val() == ""){
			alert("제목을 작성하세요");
			modalReviewTitle.focus();
			return;
		}
		if(modalReviewText.val() == null || modalReviewText.val() == ""){
			alert("내용을 작성하세요");
			modalReviewText.focus();
			return;
		}


		var modalForm = document.getElementById('modal-form');
		var formData = new FormData(modalForm);
		
		formData.delete("review_date");
		formData.delete("review_no");
		formData.delete("review_img");
		for (var pair of formData.entries()) {
			console.log(pair[0] + ": " + pair[1]);
		}


		// var formData = new FormData();

		// // 제목과 내용을 formData에 추가
		// formData.append("review_rate", modalReviewRate.val());
		// formData.append("review_title", modalReviewTitle.val());
		// formData.append("review_text", modalReviewText.val());
		// formData.append("reserve_no", modalReserveNo.val());
		// formData.append("user_id", modalUserId.val());
	    // var fileInput = modalUpload[0];  // 파일 input 선택
	    
	    // console.log(fileInput)
	    
		// if (fileInput && fileInput.files.length > 0) {
		//     formData.append("uploadFile", fileInput.files[0]);
		// } 
		
	    console.log(formData);
	   
	    
	    
	    
	    
		reviewService.register(formData,function(result) {
			if (result === "success") {
                    console.log("result:", result);
                    alert("리뷰가 추가되었습니다.");					
            } else {
                    alert("추가를 실패했습니다.");
            }
		
			reviewModal.modal("hide");
			history.go(0);
		}) // reviewService.register
	}); //.review-create
    

	// 리뷰 보기 버튼
	$(document).on("click", ".review-view", function(e) {
		
		console.log("리뷰보기");

		var review_no = $(this).data("review-no");	// 리뷰쓰기 버튼에 저장된 리뷰번호
	
		modalTitle.text("리뷰");

		reviewService.getOne(review_no,function(review) {

			// 창 정리(필드 초기화)
			$("#reviewModal .modal-content *").show();
			$("[disabled]").prop("disabled", false);
			$("#reviewModal").find("input, select, textarea").val("");
			

			// disabled 처리
			modalReviewRate.prop("disabled", true);
			modalReviewText.prop("disabled", true);
			modalReviewTitle.prop("disabled", true);
			modalReviewDate.prop("disabled", true);

			// 숨김처리
			modalUpload.hide();

			// 데이터 넣기
			modalUserId.val(user_id);
			modalReserveNo.val(review.reserve_no);
			modalReviewTitle.val(review.review_title);
			modalReviewText.val(review.review_text);
			modalReviewRate.val(review.review_rate);
			modalReviewImg.val(review.review_img);
			modalReviewDate.val( reviewService.displayTime(review.review_date));
			modalReviewNo.val(review_no);

			if(review.review_img == null || review.review_img ==""){
				
				$("#img-view").html('이미지없음');
			}else{
				$("#img-view").html('<div class="img-box"><img src="/resources/uploadIMG/review/'+review.review_img+'"></div>');
			}
		

			// 버튼 정리
			reviewModal.find("button").hide(); 
			reviewUpdateModal.show(); // 수정하기버튼 
			reviewDelete.show();
			reviewClose.show();
			reviewUpdateModal.attr("data-review-no",review_no);

		})

	}); //$(document).on("click", ".review-view", 

	// 리뷰 수정 버튼
	$(document).on("click", "#reviewModal-update-modal", function(e) {
		
		console.log("수정하기");

		var review_no = $(this).data("review-no");	// 리뷰쓰기 버튼에 저장된 리뷰번호
	
		modalTitle.text("리뷰수정");


		// 창 정리(필드 초기화X)
		$("#reviewModal .modal-content *").show();
		$("[disabled]").prop("disabled", false);
		

		// disabled 처리

		modalReviewDate.prop("disabled", true);

		// 숨김처리
		if(modalReviewImg.val() == null || modalReviewImg.val() ==""){
			$("#img-view").html("");
			
		}else{
			modalUpload.hide();
			$("#img-view").html('<div class="img-box"><img src="/resources/uploadIMG/review/'+modalReviewImg.val()+'"></div>');
			$("#img-view").append("<button id='img-remove'>이미지 삭제</button>");
		}


		// 버튼 정리
		reviewModal.find("button").hide(); 
		reviewUpdate.show(); // 수정내용 저장하기버튼 
		reviewClose.show();
		$("#img-remove").show();	// 이미지 삭제버튼


	}); //$(document).on("click", ".review-view", 


	// 이미지삭제 버튼 클릭 시
	$(document).on("click", "#img-remove", function(e) {
		// 미리보기 이미지 삭제
		$("#img-view").html("");
		// 이미지 파일명 초기화
		modalReviewImg.val("");

		console.log("이미지 파일명 삭제 : " + modalReviewImg.val());
		
		modalUpload.show();
	});// 이미지삭제 버튼 클릭 시
	
	
	// 수정후 저장버튼 누를경우
	$(document).on("click","#reviewModal-update", function(e) {
		$(this).addClass("disabled")

		var modalForm = document.getElementById('modal-form');
		var formData = new FormData(modalForm);
		

		reviewService.modify(formData,function(result) {
			if (result === "success") {
                    console.log("result:", result);
                    alert("리뷰가 수정되었습니다.");					
            } else {
                    alert("수정을 실패했습니다.");
            }
			
			reviewModal.modal("hide");
			history.go(0);
		}) // reviewService.modify
	}); //.reviewModal-update


	$(document).on("click", "#reviewModal-delete", function(e) {
		const confirmation = confirm("리뷰를 삭제하시겠습니까?");
		let review_no = modalReviewNo.val();
		console.log(review_no);

		if(confirmation){
			$(this).addClass("disabled")
			reviewService.remove({review_no: review_no, user_id: user_id},function(result) {
			if (result === "success") {
                    console.log("result:", result);
                    alert("리뷰가 삭제되었습니다.");					
            } else {
                    alert("삭제를 실패했습니다.");
            }
			
			reviewModal.modal("hide");
			history.go(0);
			$(this).addClass("disabled")
		})

		}

	});// 리뷰삭제 버튼 클릭 시




	$(document).on("click", ".cancel", function(e) {
		const confirmation = confirm("예약을 취소 하시겠습니까?");
		let reserve_no = $(this).data("reserve_no") ;


		if(confirmation){
			$(this).addClass("disabled")
			ReserveService.remove({reserve_no: reserve_no, user_id: user_id},function(result) {
				if (result === "success") {
						console.log("result:", result);
						alert("예약이 취소되었습니다.");					
				} else {
						alert("취소를 실패했습니다.");
				}
				history.go(0);
			}); 
		} else {
			console.log("예약취소 > 아니오 클릭")
		}

	});// 취소 버튼 클릭

    













    
});	//$(document).ready

</script>
</body>
</html>