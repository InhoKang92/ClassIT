console.log("Common Module.........");

// 즉시 실행 함수
var common = (function() {


    function displayTime(time){
        var date =  new Date(time);

        var yy = date.getFullYear();
        var mm = date.getMonth() + 1; // getMonth()는 zero-based
        var dd = date.getDate();

        return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');

    } 

    return {
        displayTime : displayTime
    }

})();




