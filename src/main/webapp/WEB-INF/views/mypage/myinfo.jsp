<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>클래스잇 마이페이지</title>
	
	<!-- 부트스트랩과 충돌되어서 추가 -->
	<style>		
		a {
		text-decoration: none;
		}
	</style>
	<!-- 헤더, 마이페이지헤더의 css -->
	<link rel="stylesheet" href="/resources/css/common.css" />
	<link rel="stylesheet" href="/resources/css/mypage/sidebar.css" />
	<!-- 제이쿼리 -->
  	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
   	<!-- 부트스트랩 // 사용여부에 따라 삭제하셔도 됩니다. -->
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<style>
    body {
        font-family: Arial, sans-serif;
        color: #333;
    }
    #review-box {
        padding: 20px;
        margin: 0 100px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        max-width: 600px;
    }
    h2 {
        color: #3d7373;
        margin-bottom: 20px;
    }
    ul {
        list-style-type: none;
        padding: 0;
    }
    li {
        margin: 10px 0;
        padding: 10px;
        background: #f9f9f9;
        border-radius: 4px;
    }
    button {
        background-color: #3d7373;
        color: white;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    button:hover {
        
    }
    button > a {
        color: white;
        text-decoration: none;
    }
</style>
	

</head>




<body>
	<%@include file="includes/mypage_header.jsp"%>
	
	
	
	
		<div id="review-box">
    <h2>Mypage</h2>
    <table class="table table-hover">

        <c:if test="${not empty sessionScope.loginUser}">
            <h2>환영합니다, ${sessionScope.loginUser.username}님!</h2>
            <ul>
                <li>아이디: ${sessionScope.loginUser.userid}</li>
                <li>이름: ${sessionScope.loginUser.username}</li>
                <li>생년월일:<span class="birth">${sessionScope.loginUser.birth}</span> </li>
                <li>전화번호: ${sessionScope.loginUser.number}</li>
                <li>주소: ${sessionScope.loginUser.addr}</li>
                <li>역할: ${sessionScope.loginUser.role}</li>
            </ul>
            <button><a href="/mypage/updateMember">수정하기</a></button>
        </c:if>
        
        <c:if test="${empty sessionScope.loginUser}">
            <h2>로그인 정보가 없습니다. 로그인 해주세요.</h2>
        </c:if>
        
   
    </table>
</div>
	
		
	
	
	
	
	<%@include file="includes/mypage_footer.jsp"%>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	
	<script>
		var birth = $(".birth").html().substr(0, 10);
		$(".birth").html(birth);
	</script>

</body>
</html>