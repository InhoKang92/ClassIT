console.log("Answer Module.........");


// 즉시 실행 함수
var answerService = (function() {

    // param : 목록을 가져오기 위한 매개변수(question_no)
    function getList(param, callback, error){
        var question_no =  param.question_no;
        console.log("확인 : " + question_no)

        $.ajax({
            type: "get",
            url: "/api/answer/getList/"+ question_no + ".json",    // json 형태가 필요하므로 확장자 지정
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


    // 날짜 포멧 지정
    function displayTime(time){
        var date =  new Date(time);

        var yy = date.getFullYear();
        var mm = date.getMonth() + 1; // getMonth()는 zero-based
        var dd = date.getDate();

        return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');

    } 

    function add(answer, callback, error){
        $.ajax({
            type: "post",
            url: "/api/answer/register", 
            data: JSON.stringify(answer),
            contentType: "application/json; charset=utf-8",
            success: function(result,status,xhr){
                if(callback){
                    callback(result);
                }
            },
            error: function (xhr,status,er) {
                if(error){error(er)}
            },
        });
    }

    function remove(param, callback, error) {
        //데이타 삭제
        $.ajax({
          type: "delete",
          url: "/api/answer/remove/" + param.answer_no +"/" + param.user_id + "/" + param.question_no ,
    
          success: function (result, status, xhr) {
            if (callback) {
              callback(result);
            }
          },
          error: function (xhr, status, er) {
            if (error) {
              error(er);
            }
          },
        });
    }
    
    function removeOwner(param, callback, error) {
        //데이타 삭제
        $.ajax({
          type: "delete",
          url: "/api/answer/removeOwner/" + param.answer_no +"/" + param.user_id + "/" + param.question_no ,
    
          success: function (result, status, xhr) {
            if (callback) {
              callback(result);
            }
          },
          error: function (xhr, status, er) {
            if (error) {
              error(er);
            }
          },
        });
    }
    
    

    function getOwnerId(product_no, callback, error){
        $.ajax({
            type: "get",
            url: "/api/answer/getOwnerId/"+ product_no , 
            success: function(result,status,xhr){
                if(callback){
                    callback(result);
                }
            },
            error: function (xhr,status,er) {
                if(error){error(er)}
            },
        });
    }  
    
    return {

        displayTime : displayTime,
        getList : getList,
        add : add,
        remove : remove,
        removeOwner : removeOwner,
        getOwnerId : getOwnerId,
    }

})();