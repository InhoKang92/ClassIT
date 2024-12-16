<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>리뷰</title>
		<!-- 
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script type="text/javascript" src="/resources/js/review.js"></script>
		<style type="text/css">

li {
    list-style: none;
}

.review-wrapper {
    width: 100%;
    max-width: 1000px;
    margin: 0 auto;
}

.review-list {
    width: 100%;
}

.review-item {
    display: flex;
    justify-content: flex-start;
    /* margin-bottom: 20px; */
    border-bottom: 1px solid #ddd;

    /* border-radius: 8px;*/
    position: relative;
}

.review-content {
    flex: 1;
    padding: 15px;
    position: relative;
}

/* 기본적으로 텍스트 줄바꿈을 허용하고, 2줄까지만 표시 */
.review-text {
    display: -webkit-box;
    -webkit-line-clamp: 2; /* 텍스트를 2줄까지만 표시 */
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;  /* 기본적으로 줄바꿈을 허용 */
}

.review-text.expanded {
    -webkit-line-clamp: unset;  /* '더보기' 클릭 시 모든 텍스트 표시 */
}

.review-image {
    width: 150px;
    height: 150px;
    object-fit: cover;
    margin-left: 15px;
}

.toggle-btn {
    position: absolute;
    bottom: 0;
    right: 10px;
    background-color: gray;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    display: none; /* 기본적으로 숨김 */
    margin-bottom: 5px;
}

.toggle-btn:hover {
    background-color: #0056b3;
}

.review-user {
    margin-right: 10px;
    font-weight:bold;
}
#review-pagination{
    display: flex; /* Flexbox 사용 */
    justify-content: center; /* 중앙 정렬 */
    margin-top: 20px; /* 필요 시 간격 추가 */
}
.pagination {
    display: inline-flex; /* 내부 리스트 정렬 */
}

    	</style>
	</head>

<body>

<div class="review-wrapper">

    <!-- 리뷰 게시물 등록 -->
    <div class="review-list"></div>
    <!-- 페이징바 생성 -->
    <div id="review-pagination"></div>
</div>



	
</body>

</html>


<script type="text/javascript">
$(document).ready(function () {
    const urlParams = new URLSearchParams(window.location.search);
    const product_no = Number(urlParams.get('product_no'));
	const pageBarCount = 5; // 페이지네이션 바에서 보여지는 숫자의 개수
    // 태그
    var review_list = $(".review-list");

    // console.log("현재 상품 번호 : " + product_no);

    
    showReviewList(1)
    
    
    function showReviewList(pageNum) {
        reviewService.getPagingList({ product_no: product_no, pageNum: pageNum|| 1 }, function(reviewCnt,list) {
            //console.log("review list: "+ list);
            //console.log("review Count: "+ reviewCnt);
            let str = "";

            if(pageNum == -1){
                pageNum = Math.ceil(reviewCnt/5.0);   //Math.ceil 입력된 실수보다 큰 정수값을 반환
                showReviewList(pageNum);
                return;
            }

            if (list == null || list.length == 0) {
                str = '<div class="review-item"><div class="review-content"><div class="review-header">'
                    + '<span class="review-user"></span><span class="review-date"></span></div>'
                    + '<div class="review-stars"></div><p class="review-text">작성된 리뷰가 없습니다.'
                    + '</p></div><img></div>';
                review_list.html(str);
                return;
            }

            for (let i = 0; i < list.length; i++) {
                const li = list[i];
                console.log(li)
                console.log("이미지 : " + li.review_img)

                str += '<div class="review-item" data-review_no="'
                str += li.review_no ;
                str += '"><div class="review-content"><div class="review-header"><span class="review-user">';
                str += li.user_id;
                str += '</span><span class="review-date">';
                str += reviewService.displayTime(li.review_date) ;
                str += '</span></div><div class="review-stars">';
                str += '⭐'.repeat(li.review_rate);
                str += '</div><p class="review-text">';
                str += li.review_text;
                str += '</p><button class="toggle-btn">더보기</button></div><img src="/resources/uploadIMG/review/'
                str += li.review_img;
                str +='" alt="리뷰 이미지" class="review-image"></div>';
            }	
            review_list.html(str);
            reviewPagenation(reviewCnt);

            
         // '더보기' 버튼 처리
            $(".review-item").each(function () {
                var reviewText = $(this).find(".review-text");
                var toggleBtn = $(this).find(".toggle-btn");

                // 텍스트의 실제 높이를 측정하여 2줄 이상일 경우에만 버튼 표시
                var initialHeight = reviewText.height(); // 처음 보여지는 높이
                var fullHeight = reviewText[0].scrollHeight; // 텍스트가 전체 길이일 때 높이


                // 텍스트가 2줄을 초과하면 더보기 버튼 표시
                if (fullHeight > initialHeight) {
                    toggleBtn.show(); // 버튼 표시
                } else {
                    toggleBtn.hide(); // 버튼 숨김
                }

                // '더보기' 버튼 클릭 시
                toggleBtn.click(function () {
                    if (reviewText.hasClass("expanded")) {
                        reviewText.removeClass("expanded");
                        toggleBtn.text("더보기");
                    } else {
                        reviewText.addClass("expanded");
                        toggleBtn.text("줄이기");
                    }
              
                }); // $(".review-item").each
            }); // $(window).on('load') 더보기 버튼 
        }); // reviewService.getList 리스트 api
    	
    	
	}	// end showReviewList()

    

    ///////////////////페이징처리
    var pageNum = 1;
    var reviewPagenationTag = $("#review-pagination");

    function reviewPagenation(reviewCnt){

        // 현재 페이지 바의 첫번쨰 숫자와 마지막 숫자
        var endNum = Math.ceil(pageNum / parseFloat(pageBarCount)) * pageBarCount; 
        var startNum = endNum - (pageBarCount-1);
        
        var prev = startNum != 1;
        var next = false;
		
        // html 시작
        var str = '<nav aria-label=""><ul class="pagination">';

        // 페이지네이션 바의 마지막 페이지의 마지막 번호 지정
        if(endNum*pageBarCount >= reviewCnt){
            endNum = Math.ceil(reviewCnt/pageBarCount);
        }
        // next 버튼 생성 여부
        if(endNum*pageBarCount < reviewCnt){
            next = true;
        }
        
        
        // prev 버튼 여부
        if(prev){
        	str += '<li class="page-item"><a class="page-link" href="'+ (startNum -1) +'">&laquo;</a></li>';
        } else {
        	str += '<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&laquo;</a></li>';
        }
        
        // 페이지 번호
        for(var i=startNum; i <= endNum; i++){
            var active = pageNum == i? "active":"";
            str += '<li class="page-item ' +active+ '"><a class="page-link" href="'+ i +'">'+ i +'</a></li>';
        }
        
        // next 버튼
		if(next){
			str += '<li class="page-item"><a class="page-link" href="'+ (endNum+1) +'">&raquo;</a></li>';
		} else {
			str += '<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">&raquo;</a></li>';
		}
        
        // html 끝
        str += '</ul></nav>'
        

        reviewPagenationTag.html(str);

    }   // end reviewPagenation() 페이징 처리 끝
    
    
    reviewPagenationTag.on("click","li a",function(e){
    
    	e.preventDefault();	//	e(클릭이벤트항목)의 기능 중지
    	console.log("review page nev 클릭");

        var targetPageNum = $(this).attr("href"); // href에 이동할 페이지 번호가 저장되어있음
        console.log("targetPageNum : " + targetPageNum);

        pageNum = targetPageNum; // pageNum 에 목표페이지 저장

        showReviewList(pageNum);

    	
    	
    	
    });	// 페이지네이션 클릭시 이벤트 처리
    
    
	
	
	
	
	


















});//$(document).ready

</script>
    
    