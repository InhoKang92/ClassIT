<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>질문</title>
    <script type="text/javascript" src="/resources/js/question.js"></script>
    <script type="text/javascript" src="/resources/js/answer.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style type="text/css">

li {
    list-style: none;
}
.question-wrapper {
    width: 100%;
    max-width: 1000px;
    margin: 0 auto;
}
.question-list {
    width: 100%;
}
.question-item {
    display: flex;
    justify-content: flex-start;
    border-bottom: 1px solid #ddd;
    
    position: relative;
}
.question-content {
    display: flex;
    flex-direction: column; /* 세로로 정렬 */
    padding: 15px;
    width: 100%;
    position: relative;
}
.question-text {
    display: -webkit-box;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;  /* 기본적으로 줄바꿈을 허용 */
}
.question-user, .answer-user {
    margin-right: 10px;
    font-weight:bold;
}
#question-pagination{
    display: flex; /* Flexbox 사용 */
    justify-content: center; /* 중앙 정렬 */
    margin-top: 20px; /* 필요 시 간격 추가 */
}
.pagination {
    display: inline-flex; /* 내부 리스트 정렬 */
}

.button-container {
    display: flex;
    justify-content: space-between; /* 버튼을 좌우로 배치 */
    margin-top: 10px; /* 텍스트와 버튼 사이 간격 추가 */
}
.view-reply{

    padding: 5px;
    width: 60px;
    height: 35px;
    font-size: 13px;
    text-align: center;
}
.view-reply:active{
    background-color: rgb(97, 97, 97);
}

.answer-remove {
    float: right;
    padding: 0;
    width: 60px;
    height: 35px;
    font-size: 13px !important;
}



.answer-item {
    display: flex;
    align-items: flex-start; /* 내용 정렬 */
    padding: 20px 20px;
    border-bottom: 1px solid #ddd;
    background-color: #ffffff;

}

.answer-icon {
    width: 60px; /* 고정된 너비 */
    flex-shrink: 0; /* 너비 고정 */
}

.answer-content {
    flex-grow: 1; /* 나머지 공간을 차지 */
    padding-left: 10px; /* 간격 조정 */

    
}

.answer-icon img {
    width: 50px;
    height: 50px;
    object-fit: cover; /* 이미지 비율 유지 */
}

.question-text{
    margin-top: 20px;

}
.answer-text{
    margin-top: 20px;
}
.btn:focus {
    outline: none;
    box-shadow: none; /* box-shadow를 제거하여 그림자도 제거 */
}

.question-button{
    float: right;
    display: block;
    margin-top: 20px;

}

input {
    width: 450px;
    margin-bottom: 10px;
}

.modal-body textarea {
    width: 450px;
    height: 400px;
}

.answer-add-container {
    width: 100%;  /* 부모 div가 전체 너비를 차지 */
    height: 100%; /* 부모 div가 전체 높이를 차지 */
    padding: 20px 20px;
    display: flex;  /* flexbox로 자식 요소 정렬 */
    align-items: flex-start;  /* 텍스트가 위에 정렬되도록 */
    justify-content: center; /* 수평 중앙 정렬 */
    
}


.answer-add-container textarea {
    width: 85%;                /* textarea가 부모 요소의 80% 너비 차지 */
    min-height: 40px;          /* 최소 높이를 2줄 텍스트가 보이도록 설정 */
    padding: 10px;             /* 텍스트와 테두리 간의 여백 설정 */
    font-size: 16px;           /* 텍스트 크기 설정 */
    line-height: 1.4;          /* 줄 간격 설정 */
    border: 2px solid #ccc;    /* 기본 테두리 색상 */
    border-radius: 4px 0 0 4px;        /* 테두리 둥글게 설정 */
    outline: none;             /* 포커스 시 기본 outline 제거 */
    resize: none;              /* 사용자가 크기 조절할 수 없게 설정 */
    overflow-y: hidden;        /* 세로 스크롤이 생기지 않도록 설정 */
    box-sizing: border-box;    /* 패딩과 보더를 크기에 포함 */
}

/* input에 포커스 시 테두리 색상 변경 */
.answer-add-container textarea:focus {
  border-color: orange; /* 포커스 시 주황색 테두리 */
}

/* 버튼 스타일 */
.answer-add-container .submit-btn {
    padding: 10px 20px;         /* 버튼 안쪽 여백 */
    width: 15%;
    height: 70px;                
    font-size: 16px;             /* 글자 크기 */
    background-color: orange;   /* 버튼 배경색 오렌지로 설정 */
    color: white;               /* 글자 색을 흰색으로 설정 */
    border: none;               /* 기본 테두리 제거 */
    border-radius: 0 4px 4px 0;         /* 테두리 둥글게 */
    cursor: pointer;            /* 마우스 포인터 커서 */
    display: inline-flex;       /* 버튼 내부에서 텍스트를 가로로 배치 */
    align-items: center;        /* 텍스트가 수평으로 배치되도록 설정 */
    justify-content: center;    /* 텍스트가 수평 중앙 정렬되도록 설정 */
    text-align: center;         /* 텍스트를 중앙 정렬 */
}

/* 버튼 hover 상태 */
.answer-add-container .submit-btn:hover {
  background-color: #e07b00;  /* hover 시 배경색을 더 어두운 오렌지로 변경 */
}

/* 페이지네이션 컬러 변경 */
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
}
/* 페이지네이션 컬러 변경 */
    </style>
</head>
<body>
    
    <div class="question-wrapper">

        <!-- 질문 게시물 등록 -->
        <div class="question-list" id="question-list"></div>
        <!-- 페이징바 생성 -->
        <c:choose>
		    <c:when test="${sessionScope.loginUser.userid != null}">
		        <button type="button" class="question-button btn btn-outline-dark"  data-bs-toggle="modal" data-bs-target="#questionModal">문의하기</button>
	    	</c:when>
	    </c:choose>
        <div id="question-pagination"></div>
		

        
    </div>




    <!-- Modal -->
    <div class="modal fade" id="questionModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" >
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="staticBackdropLabel">문의하기</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <input type="text" placeholder="제목을 입력하세요." name="question_title"></input>
                    <textarea placeholder="문의하실 내용을 입력하세요." name="question_text"></textarea>
                </form>
            </div>
            <div class="modal-footer">
	            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	            <button type="button" class="btn btn-primary"  id="questionModal-submit">저장</button>
            </div>
        </div>
        </div>
    </div>










</body>
</html>

<script type="text/javascript">

$(document).ready(function () {
	const user_id = "${sessionScope.loginUser.userid}";

    const urlParams = new URLSearchParams(window.location.search);
    const product_no = urlParams.get('product_no');
    const pageBarCount = 5; // 페이지네이션 바에서 보여지는 숫자의 개수


    

    // 태그
    var question_list = $("#question-list");

    console.log("현재 상품 번호 : " + product_no);   

    showQuestionList()
    function showQuestionList(pageNum) {
        questionService.getPagingList({product_no:product_no, pageNum:pageNum||1},function(questionCnt,list){
            //console.log("질문목록 : " + list);
            var str="";

            // 첫번째 페이지로 이동하게 한다.
            if(pageNum == -1){
                pageNum = Math.ceil(questionCnt/5.0);   //Math.ceil 입력된 실수보다 큰 정수값을 반환
                showQuestionList(pageNum);
                return;
            }

            // 문의 내역이 없는 경우
            if(list == null || list == ""){
                str += '<div class ="question-list"><div class ="question-item" data-question_no><div class ="question-content">';
                str += "문의 내역이 없습니다.";
                str += '</div></div></div>'

                question_list.html(str);      
                return;
            }

            // 문의 내역이 있는경우
            for (let i = 0; i < list.length; i++) {
                const data = list[i];

                str += '<div class ="question-item" data-question_no = "';
                str += data.question_no;
                str += '"><div class ="question-content"><div><div class ="question-header"><span class="question-user">';
                str += data.user_id;
                str += '</span><span class="question-date">';
                str += questionService.displayTime(data.question_date);
                str += '</span></div><p class ="question-text">';
                str += data.question_text;
                str += '</p></div><div class="button-container"><button class ="view-reply btn btn-secondary" data-bs-toggle="button" data-question_no ="';
                str += data.question_no;
                str += '" data-question_id ="'
                str += data.user_id;
                str += '">답글 ('
                str += data.answercnt
                str +=  ')</button>';
                
                // 삭제 버튼 생성
                if(data.user_id == user_id){
                	str += '<button class ="question-remove btn btn-outline-secondary" data-question_no ="'+ data.question_no + '" >삭제</button>';
                }               
                
                str += '</div></div></div><div class ="answer-list" data-question_no ="'
                str += data.question_no;
                str += '"></div>';
            }
            question_list.html(str);     
            questionPagenation(questionCnt);

        })  // end questionService.getList


    }   // end showQuestionList()


    ////// 페이징 처리
    var pageNum = 1;    // 최초 페이지 = 1
    var questionPagenationTag = $("#question-pagination");

    function questionPagenation(questionCnt) {
            // 현재 페이지 바의 첫번쨰 숫자와 마지막 숫자
        var endNum = Math.ceil(pageNum / parseFloat(pageBarCount)) * pageBarCount; 
        var startNum = endNum - (pageBarCount-1);

        var prev = startNum != 1;
        var next = false;

        // html 시작
        var str = '<nav aria-label=""><ul class="pagination">';

        // 페이지네이션 바의 마지막 페이지의 마지막 번호 지정
        if(endNum*pageBarCount >= questionCnt){
            endNum = Math.ceil(questionCnt/pageBarCount);
        }
        // next 버튼 생성 여부
        if(endNum*pageBarCount < questionCnt){
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
        questionPagenationTag.html(str);

    }   // end questionPagenation()


    // 페이지네이션 클릭시 이벤트 처리
    questionPagenationTag.on("click","li a",function(e){
        
        e.preventDefault();	//	e(클릭이벤트항목)의 기능 중지
        console.log("question page nev 클릭");

        var targetPageNum = $(this).attr("href"); // href에 이동할 페이지 번호가 저장되어있음
        console.log("targetPageNum : " + targetPageNum);

        pageNum = targetPageNum; // pageNum 에 목표페이지 저장

        showQuestionList(pageNum);

    });	// 페이지네이션 클릭시 이벤트 처리
    

    // 답글 버튼 클릭 > 답변리스트 생성
    $(document).on('click', '.view-reply', function() {
        const questionNo = $(this).data('question_no');
        const questionID = $(this).data('question_id');
        const button = $(this);

        // 답변 목록 생성위치
        const answerList = $('.answer-list').filter('[data-question_no='+questionNo+']');

        // 답변 목록이 있을 떄 답변목록 제거
        if (answerList.html().trim() !== "") {
            answerList.html("");

            return;
        }        
        // 답변 목록이 없을 때 답변 생성
        answerService.getList({question_no:questionNo},function (list) {
            var str="";

            // 입력된 답변이 없는 경우
            // 답변 등록 input 생성(질문자 혹은 담당자만 입력가능)
            if(list == null || list == ""){  
                str = ""
            }else{
                // 입력된 답변이 있는 경우
                // 답변 등록 input 생성(질문자 혹은 담당자만 입력가능)
                for (let i = 0; i < list.length; i++) {
                    const data = list[i];
                    console.log(data);

                    str += '<div class ="answer-item" data-question_no = "';
                    str += data.answer_no;
                    str += '"><div class="answer-icon"><img src="/resources/img/icon/answer_arrow_icon.png"></div><div class ="answer-content"><div class ="question-header"><span class="answer-user">';
                    
                        // owner의 아이디 대신 담당자로 표츌
                    if(data.user_role == "ROLE_사장"){
                        str += "담당자";
                    }else{
                        str += data.user_id;
                    }

                    str += '</span><span class="answer-date">';
                    str += answerService.displayTime(data.answer_date);
                    str += '</span>'
                    // 답변 삭제버튼 생성
                    if(data.user_id == user_id){
                        str += '<button class ="answer-remove btn btn-secondary" data-answer_no = "';
                        str += data.answer_no;
                        str += '" data-question_no='+ data.question_no+' >삭제</button>'
                    }             
                    str += '</div><div class ="answer-text">';
                    str += data.answer_text;
                    str += '</div>';  
                    
                    str += '</div></div><div class ="answer-list" data-question_no ="'
                    str += data.question_no;
                    str += '"></div>';
                }
            }

            // 답변 리스트 생성 후 입력창 생성
            answerService.getOwnerId(product_no,function(data){
		    	var	owner_id = data;

	            if((user_id.trim() == owner_id.trim()) || (user_id.trim() == questionID.trim())){        
	                str += '<div class="answer-add-container"><textarea placeholder="입력하세요" name="answer-text" ></textarea>';
	                str += '<button class="submit-btn answer-submit" data-question_no="'
	                str += questionNo;
	                str += '">등록</button></div>';
	            }
	            answerList.html(str);

	            
		    });
			            
            


     

        }); //questionService.getList()

    }); //end .view-reply click

    // 문의사항 등록

    var questionModal = $("#questionModal"); 
    const questionSubmit = $("#questionModal-submit");  // submit 버튼

    
    var modalQuestionTitle = questionModal.find("[name='question_title']"); // 제목 입력 필드 선택
    var modalQuestionText = questionModal.find("[name='question_text']"); // 내용 입력 필드 선택


    questionSubmit.on("click",function(e){
    	if(modalQuestionTitle.val() === null || modalQuestionTitle.val().trim() === "" ){
		    alert("제목을 입력하세요");
		    modalQuestionTitle.focus();
		    return; // 함수 실행 중단
    	}
    	
    	if (modalQuestionText.val() === null || modalQuestionText.val().trim() === "") {
    		alert("내용을 입력하세요");
    		modalQuestionText.focus();
    		return; // 함수 실행 중단
    	}
    	
    	
        var question = {
   			product_no : product_no,
   			question_title : modalQuestionTitle.val(),
   			question_text : modalQuestionText.val(),
    		user_id : user_id
    	};
    	

       questionService.add(question,function (result) {
            if(result == "success") {
                console.log("result : " ,result);
                modalQuestionTitle.val("");
                modalQuestionText.val("");
                questionModal.modal("hide");
                alert("등록되었습니다.")
                showQuestionList();
            }else{
                alert("등록을 실패했습니다.")
                return;
            }
        });
    });//questionSubmit.on

    // 문의 사항 삭제
    // 동적으로 생성된 버튼이라 아래처럼 적용해야 작동함
    $(document).on("click", ".question-remove", function(e) {
        const question_no = $(this).data('question_no');
        const confirmation = confirm("삭제하겠습니까?");

        if (confirmation) {
            questionService.remove({question_no: question_no, user_id: user_id}, function (result) {
                if (result == "success") {
                    console.log("result : ", result);
                    alert("삭제되었습니다.");
                    showQuestionList(pageNum); // 삭제 후, 질문 목록 갱신
                } else {
                    alert("삭제를 실패했습니다.");
                    return;
                }
            });
        } else {
            console.log("삭제 > 아니오 클릭");
        }
    }); //.question-remove


    // 답변 등록
    $(document).on("click", ".answer-submit", function(e) {
        const question_no = $(this).data('question_no'); // 현재 클릭된 버튼의 데이터 속성 값
        const textarea = $(this).closest('.answer-add-container').find("textarea[name='answer-text']"); // 현재 클릭된 버튼의 부모요소 >textarea 선택
        const answer_text = textarea.val(); // textarea의 내용 가져오기

        var answer = {
            question_no : question_no,
            answer_text : answer_text,
    		user_id : user_id
    	};

        const confirmation = confirm("답변을 등록하겠습니까?");

        if (confirmation) {
            answerService.add(answer, function(result) {
                if (result === "success") {
                    console.log("result:", result);
                    alert("답변이 추가되었습니다.");
                    showQuestionList(pageNum); // 삭제 후, 질문 목록 갱신
                } else {
                    alert("추가를 실패했습니다.");
                    return;
                }
            });
        } else {
            console.log("답변추가 > 아니오 클릭");
        }
    });

    // 답변 삭제
    $(document).on("click", ".answer-remove", function(e) {
        const answer_no = $(this).data('answer_no');
        const question_no = $(this).data('question_no');
        const confirmation = confirm("삭제하겠습니까?");
        console.log("delete 버튼의 answer_no : ", answer_no);
		
        answerService.getOwnerId(product_no,function(data){
        	owner_id = data;
        	
            if (confirmation) {
            	if(user_id === owner_id){
            		console.log("user_id === owner_id" );
                    answerService.removeOwner({answer_no: answer_no, user_id: user_id,question_no:question_no}, function (result) {
                        if (result == "success") {
                            console.log("result : ", result);
                            alert("삭제되었습니다.");
                            showQuestionList(pageNum);
        					return;
                             // 삭제 후, 질문 목록 갱신
                        } else {
                            alert("삭제를 실패했습니다.");
                            return;
                        }
                    });
            	}else{
                    answerService.remove({answer_no: answer_no, user_id: user_id,question_no:question_no}, function (result) {
                        if (result == "success") {
                            console.log("result : ", result);
                            alert("삭제되었습니다.");
                            showQuestionList(pageNum); // 삭제 후, 질문 목록 갱신
                        } else {
                            alert("삭제를 실패했습니다.");
                            return;
                        }
                    });
            	}
            } else {
                console.log("답변삭제 > 아니오 클릭");
            }
        	
        	
        	
        	
        	
        	
        	
        })
        

    }); //.question-remove








})// end $(document).ready


</script>