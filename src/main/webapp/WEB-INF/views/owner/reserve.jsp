<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>클래스잇 관리페이지</title>
	

	<!-- 헤더, 마이페이지헤더의 css (동일하게 사용) -->
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
        button {
			width: 80px;
			font-size: 14px;
			padding: 5px;
			margin-right: 10px;
			background: #3D7373;
			border: 2px solid #3D7373;
			color: #fff;
			cursor: pointer;
		
		}
		
		button:hover {
			width: 80px;
			font-size: 14px;
			font-weight: bold;
			padding: 5px;
			background: none;
			border: 2px solid #3D7373;
			color: #3D7373;
			cursor: pointer;
		
		}

        .td1 {
            width: 50px; /* 고정 너비 설정 */
        }
        .td2 {
            width: 100px; /* 고정 너비 설정 */
        }
        .td3 {
            width: 400px; /* 고정 너비 설정 */
        }
		.td4 {
            width: 700px; /* 고정 너비 설정 */
        }
        .td5 {
            width: 200px; /* 고정 너비 설정 */
        }


		.reserve-box {
			width: 1100px;
            margin-bottom: 100px;
		}
	</style>



	
	<!-- 하단에 head 영역에 추가하실 내용을 추가하면 됩니다. -->
		<script type="text/javascript" src="/resources/js/reserve.js"></script>
</head>




<body>
	<%@include file="includes/owner_header.jsp"%>
	
	
	
	<!-- 관리자 페이지 -->
<div id="schedule-due" class="reserve-box">
    <h2>승인 예정</h2>
    <table class="table">
        <thead>
            <tr>
                <th class="td1">번호</th>
                <th class="td3">클래스명</th>
                <th class="td5">클래스 수강 일</th>
                <th class="td2">수강인원</th>
                <th class="td2"></th>
                <th class="td5"></th>
            </tr>
            <tr>
            	<th class="td1"></th>
                <th class="td3"></th>
                <th class="td5">결제일</th>
                <th class="td2">결제금액</th>
                <th class="td2">결제현황</th>
                <th class="td5">버튼</th>
            </tr>
        </thead>
        <tbody class="schedule-due">
            <!-- 예약 리스트 생성 구간-->
        </tbody>
    </table>
</div>

<div id="schedule-return" class="reserve-box">
    <h2>승인 거절</h2>
    <table class="table">
        <thead>
            <tr>
                <th class="td1">번호</th>
                <th class="td3">클래스명</th>
                <th class="td5">클래스 수강 일</th>
                <th class="td2">수강인원</th>
                <th class="td2"></th>
                <th class="td5"></th>
            </tr>
            <tr>
            	<th class="td1"></th>
                <th class="td3"></th>
                <th class="td5">결제일</th>
                <th class="td2">결제금액</th>
                <th class="td2">결제현황</th>
                <th class="td5">승인여부</th>
            </tr>
        </thead>
        <tbody class="schedule-return">
            <!-- 예약 리스트 생성 구간-->
        </tbody>

    </table>
</div>
		

 
<div id="schedule-complete" class="reserve-box">
    <h2>승인 완료</h2>
    <table class="table">
        <thead>
            <tr>
                <th class="td1">번호</th>
                <th class="td3">클래스명</th>
                <th class="td5">클래스 수강 일</th>
                <th class="td2">수강인원</th>
                <th class="td2"></th>
                <th class="td5"></th>
            </tr>
            <tr>
            	<th class="td1"></th>
                <th class="td3"></th>
                <th class="td5">결제일</th>
                <th class="td2">결제금액</th>
                <th class="td2">결제현황</th>
                <th class="td5">승인여부</th>
            </tr>
        </thead>
        <tbody class="schedule-complete">
            <!-- 예약 리스트 생성 구간-->
        </tbody>



		<!-- 예약 리스트 생성 구간-->
    </table>
</div>
		
	
		
	
	
	
	
	<%@include file="includes/owner_footer.jsp"%>



<script type="text/javascript">
$(document).ready(function(){
	
    const user_id = "${sessionScope.loginUser.userid}";
    showList(0);
    showList(1);
    showList(2);

	function showList(approval){
        var str = "";

        ReserveService.getOwnerListState({user_id:user_id,approval:approval},function (data) {
            console.log(data)
            var code;

            for (let i = 0; i < data.length; i++) {
                var list = data[i];
                var reserve = list.reserve;
                var schedule = list.schedule;
                var product = list.product;

                if(reserve.reserve_approval == 1){
                    code = "승인완료"
                } else if(reserve.reserve_approval == 2){
                    code = "승인거절"
                };

                str += '<tr><td colspan="6"><table class="table table-striped table-borderless"><tr>'; 
                str += '<td class="td1">'+ reserve.reserve_no  +'</td>';    // 번호
                str += '<td class="td3">'+ product.product_title +'</td>';  // 클래스명
                str += '<td class="td5">'+ schedule.schedule +'</td>';  // 클래스 수강일
                str += '<td class="td2">'+ reserve.reserve_number +'명</td>'; // 수강인원
                str += '<td class="td2"></td><td class="td5"</td></tr>';  

                str += '<tr><td class="td1"></td><td class="td3"></td>';
                str += '<td class="td5">'+ ReserveService.displayTime(reserve.reserve_date) +'</td>'; // 결제일
                str += '<td class="td2">'+ reserve.reserve_amount+'원</td>';  // 결제 금액
                str += '<td class="td2">결제완료</td>';
                if(approval === 0){     // 버튼 생성
                    str += '<td class="td5"><button class="update-button" data-reserve_no='+reserve.reserve_no+' data-approval="1">승인</button>';
                    str += '<button class="update-button" data-reserve_no='+reserve.reserve_no+' data-approval="2">거절</button></td>';
                } else{
                    str += '<td class="td5">'+ code +'</td>';   // 승인여부
                }
                str += '</tr></table></td></tr>';

            }

            var tbody;

            if(approval === 0){
                tbody = $(".schedule-due")
            } else if(approval === 1){
                tbody = $(".schedule-complete")
            } else if(approval === 2){
                tbody = $(".schedule-return")
            }

            tbody.html(str);

        });  //ReserveService.getOwnerListState
    }; //function showList(approval)


  
 
	// 승인여부 업데이트
	$(document).on("click", ".update-button", function(e) {
        const reserve_no = $(this).data('reserve_no');
		const approval = $(this).data('approval');
        var confirmation;

        if (approval == 1){
            confirmation = confirm("승인 하겠습니까?");
        } else if (approval == 2){
            confirmation = confirm("거절 하겠습니까?");
        }

        console.log("update 버튼의 approval : ", approval);

        var rVo = {
            reserve_no : reserve_no,
            reserve_approval : approval
        }

        if (confirmation) {
            ReserveService.updateApproval(rVo, function (result) {
                if (result == "success") {
                    console.log("result : ", result);
                    alert("변경되었습니다.");

					history.go(0);
					return;
                     // 삭제 후, 질문 목록 갱신
                } else {
                    alert("변경을 실패했습니다.");
                    return;
                }
            });
        } else {
            console.log("답변삭제 > 아니오 클릭");
        }
    }); //.question-remove	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});	//$(document).ready

</script>







</body>
</html>