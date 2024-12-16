console.log("Question Module.........");


// 즉시 실행 함수
var questionService = (function() {

    // param : 리뷰 목록을 가져오기 위한 매개변수(review_no)
    // function getList(param, callback, error){
    //     var product_no =  param.product_no;
    //     console.log("확인 : " + product_no)

    //     $.ajax({
    //         type: "get",
    //         url: "/api/question/getList/"+ product_no + ".json",    // json 형태가 필요하므로 확장자 지정
    //         success: function(result,status,xhr){
    //             if(callback){
    //                 callback(result);
    //             }
    //         },
    //         error: function (xhr,status,er) {
    //             if(error){error(er)}
    //         },
    //     });
    // }   // getList()

    

    // param : 문의 목록을 가져오기 위한 매개변수(question_no)
    // getJSON : json 타입만 간단하게 가져올 수 있음(설정이 자유롭지 x)\
    // $.getJSON( "URL" , function(data){}).fail(function(xhr, status, exx){}); // 성공하면 콜백함수 .실패하면
    function getPagingList(param, callback, error){
        var product_no =  param.product_no;
        var pageNum =  param.pageNum;

        $.getJSON("/api/question/getPagingList/"+ product_no + "/" + pageNum + ".json",function(data){
            if(callback){
                callback(data.questionCnt, data.list);    // 복수 데이터를 가져오므로 .로 접근
            }
        }).fail(function(xhr,status,err){
            if(err){
                error();
            }
        })
    }   // getPagingList()


    function getListForUser(user_id, callback, error){


        $.getJSON("/api/question/getListForUser/"+ user_id + ".json",function(data){
            if(callback){
                callback(data); 
            }
        }).fail(function(xhr,status,err){
            if(err){
                error();
            }
        })
    }   // getListForUser()



    // 날짜 포멧 지정
    function displayTime(time){
        var date =  new Date(time);

        var yy = date.getFullYear();
        var mm = date.getMonth() + 1; // getMonth()는 zero-based
        var dd = date.getDate();

        return [ yy, '-', (mm > 9 ? '' : '0') + mm, '-', (dd > 9 ? '' : '0') + dd ].join('');

    } 


        
    function add(question, callback, error){
        $.ajax({
            type: "post",
            url: "/api/question/register", 
            data: JSON.stringify(question),
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
          url: "/api/question/remove/" + param.question_no +"/" + param.user_id ,
    
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


    function getListForOwner(user_id, callback, error) {
        
        $.getJSON("/api/question/getListForOwner/"+ user_id + ".json",function(data){
            if(callback){
                callback(data); 
            }
        }).fail(function(xhr,status,err){
            if(err){
                error();
            }
        })
        
    }


    function getListForOwnerNon(user_id, callback, error) {
        
        $.getJSON("/api/question/getListForOwnerNon/"+ user_id + ".json",function(data){
            if(callback){
                callback(data); 
            }
        }).fail(function(xhr,status,err){
            if(err){
                error();
            }
        })
        
    }

    function getListForOwnerPaging(param, callback, error) {
        var user_id =  param.user_id;
        var status =  param.status;
        var page =  param.page;
    

        $.getJSON("/api/question/getListForOwnerPaging/"+ user_id 
                        +"/" +status+ "/" + page + ".json",function(data){
            if(callback){
                callback(data); 
            }
        }).fail(function(xhr,status,err){
            if(err){
                error();
            }
        })
        
    }
    
   function getListForUserPaging(param, callback, error) {
        var user_id =  param.user_id;
        var status =  param.status;
        var page =  param.page;
    

        $.getJSON("/api/question/getListForUserPaging/"+ user_id 
                        +"/" +status+ "/" + page + ".json",function(data){
            if(callback){
                callback(data); 
            }
        }).fail(function(xhr,status,err){
            if(err){
                error();
            }
        })
        
    }
    
    return {
        add : add,
        displayTime : displayTime,
        getPagingList : getPagingList,
        remove : remove,
        getListForUser:getListForUser,
        getListForOwner : getListForOwner,
        getListForOwnerNon : getListForOwnerNon,
        getListForOwnerPaging : getListForOwnerPaging,
        getListForUserPaging : getListForUserPaging,
 
    }

})();