console.log("ReserveService Module.........");



var ReserveService = (function() {

    function getOwnerListState(params, callback, error) {
        var user_id =  params.user_id;
        var approval =  params.approval;

        console.log("user_id : " + user_id);
        console.log("approval : " + approval);

        $.getJSON("/api/reserve/getOwnerListState/"+ user_id + "/" + approval + ".json",function(data){
            if(callback){
                callback(data);    // 복수 데이터를 가져오므로 .로 접근
            }
        }).fail(function(xhr,status,err){
            if(err){
                error();
            }
        })
    } 

	

    // 날짜 포멧 지정
    function displayTime(time){
        var date =  new Date(time);

        var yy = date.getFullYear();
        var mm = date.getMonth() + 1; // getMonth()는 zero-based
        var dd = date.getDate();

        return [ yy, '-', (mm > 9 ? '' : '0') + mm, '-', (dd > 9 ? '' : '0') + dd ].join('');

    } 


    // 업데이트
    function updateApproval(rVo, callback, error) {

        $.ajax({
            type: "put",
            url: "/api/reserve/updateApproval", 
            data: JSON.stringify(rVo),
            contentType: "application/json; charset=utf-8",
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
	

    function remove(param, callback, error) {
        //데이타 삭제
        $.ajax({
          type: "delete",
          url: "/api/reserve/remove/" + param.reserve_no +"/" + param.user_id ,
    
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























    return {
        getOwnerListState : getOwnerListState,
        displayTime : displayTime,
        updateApproval:updateApproval,
        remove:remove,
 
    }








})();// 즉시 실행 함수
 