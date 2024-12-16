console.log("Review Module.........");

// 즉시 실행 함수
var reviewService = (function() {

    // param : 리뷰 목록을 가져오기 위한 매개변수(review_no)
    function getList(param, callback, error){
        var product_no =  param.product_no;

        $.ajax({
            type: "get",
            url: "/api/review/getList/"+ product_no + ".json",    // json 형태가 필요하므로 확장자 지정
            success: function(result,status,xhr){
                if(callback){
                    callback(result);
                }
            },
            error: function (xhr,status,er) {
                if(error){error(er)}
            },
        });
    }   // getList()

    // 작성자 별 리뷰 리스트
    function getListForUser(user_id, callback, error){
        

        $.ajax({
            type: "get",
            url: "/api/review/getListForUser/"+ user_id + ".json",     // json 형태가 필요하므로 확장자 지정
            success: function(result,status,xhr){
                if(callback){
                    callback(result);
                }
            },
            error: function (xhr,status,er) {
                if(error){error(er)}
            },
        });
    }   // getList()

    
    // // param : 리뷰 목록을 가져오기 위한 매개변수(review_no)
    // function getPagingList(param, callback, error){
    //     var product_no =  param.product_no;
    //     var pageNum = param.pageNum || 1;

    //     $.ajax({
    //         type: "get",
    //         url: "/api/review/getPagingList/"+ product_no + "/" + pageNum + ".json",    // json 형태가 필요하므로 확장자 지정
    //         success: function(result,status,xhr){
    //             if(callback){
    //                 callback(result);
    //             }
    //         },
    //         error: function (xhr,status,er) {
    //             if(error){error(er)}
    //         },
    //     });
    // }   // getPagingList()

    // param : 리뷰 목록을 가져오기 위한 매개변수(review_no)
    // getJSON : json 타입만 간단하게 가져올 수 있음(설정이 자유롭지 x)\
    //$.getJSON( "URL" , function(data){}).fail(function(xhr, status, exx){});  성공하면 콜백함수 .실패하면
    function getPagingList(param, callback, error){
        var product_no =  param.product_no;
        var pageNum =  param.pageNum;

        $.getJSON("/api/review/getPagingList/"+ product_no + "/" + pageNum + ".json",function(data){
            if(callback){
                callback(data.reviewCnt, data.list);    // 복수 데이터를 가져오므로 .로 접근
            }
        }).fail(function(xhr,status,err){
            if(err){
                error();
            }
        })
    }   // getPagingList()


    // 리뷰no로 리뷰 단건 가져오기
    function getOne(review_no, callback, error){
        $.ajax({
            type: "get",
            url: "/api/review/getOne/"+ review_no + ".json",     // json 형태가 필요하므로 확장자 지정
            success: function(review,status,xhr){
                if(callback){
                    callback(review);
                }
            },
            error: function (xhr,status,er) {
                if(error){error(er)}
            },
        });
    }   // getOne()


    // 날짜 포멧 지정
    function displayTime(time){
        var date =  new Date(time);

        var yy = date.getFullYear();
        var mm = date.getMonth() + 1; // getMonth()는 zero-based
        var dd = date.getDate();

        return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');

    } 


    // 문자열 > 날짜로 포멧변경
    function StringDate(dateString){

        // 문자열을 정규 표현식을 사용하여 필요한 부분으로 분리
        let match = dateString.match(/(\d{4})년 (\d{2})월 (\d{2})일 (\d{2})시/);

        if (match) {
            // 추출한 값을 이용해 Date 객체 생성
            let str_year = parseInt(match[1]);
            let str_month = parseInt(match[2]) - 1; // JavaScript의 월은 0부터 시작하므로 1을 뺀다
            let str_day = parseInt(match[3]);
            let str_hour = parseInt(match[4]);

            let date = new Date(str_year, str_month, str_day, str_hour);

            let year = date.getFullYear();
            let month = date.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
            let day = date.getDate();
            // 시간 가져오기
            let hour = date.getHours();
            return date;
            // return {
            //     "date" : date,
            //     "year" : year,
            //     "month" : month,
            //     "day" : day,
            //     "hour" : hour,
            //     };

        } else {
            console.log("형식이 잘못되었습니다.");
        }

        return;
    }

    // 예약승인여부 판단
    function reserveApproval(reserve_approval) {

        let str;
        switch (reserve_approval) {
            case 0:
                str = "대기";
                break;
            case 1:
                str = "승인";
                break;
            case 2:
                str = "반려";
                break;
            default:
                str = "알 수 없음"; // 예외 처리
                break;
        }
         return str;   
    }


    // 리뷰저장
    function register(formData, callback, error) {

        $.ajax({
            type: "post",
            url: "/api/review/register", 
            processData: false,                 // multiple form 데이터를 전송할때는 기존의 post와 작성법이 다름!!
            contentType: false,
            data: formData,
            success: function(result,status,xhr){
                if(callback){
                    callback(result);
                }
            },
            error: function (xhr,status,er) {
                    console.error("AJAX 오류 발생: ", status, er);
                    console.error("응답 내용: ", xhr.responseText);  // 서버의 응답 내용 확인
            },
        });
    }

    // 업데이트
    function modify(formData, callback, error) {

        $.ajax({
            type: "put",
            url: "/api/review/modify", 
            processData: false,                 // multiple form 데이터를 전송할때는 기존의 post와 작성법이 다름!!
            contentType: false,
            data: formData,
            success: function(result,status,xhr){
                if(callback){
                    callback(result);
                }
            },
            error: function (xhr,status,er) {
                    console.error("AJAX 오류 발생: ", status, er);
                    console.error("응답 내용: ", xhr.responseText);  // 서버의 응답 내용 확인
            },
        });
    }

    function remove(param, callback, error) {
        $.ajax({
            type: "delete",
            url: "/api/review/remove/"+ param.review_no + "/" + param.user_id,     // json 형태가 필요하므로 확장자 지정
            success: function(review,status,xhr){
                if(callback){
                    callback(review);
                }
            },
            error: function (xhr,status,er) {
                if(error){error(er)}
            },
        });
    }



    return {
        getList : getList,
        displayTime : displayTime,
        getPagingList : getPagingList,
        getListForUser : getListForUser,
        StringDate : StringDate,
        reserveApproval : reserveApproval,
        register : register,
        getOne : getOne,
        modify : modify,
        remove: remove,
    }

})();







