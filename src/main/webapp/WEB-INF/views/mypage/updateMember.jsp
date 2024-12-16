<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }
    label {
        flex: 0 0 30%; /* 레이블의 너비를 30%로 설정 */
        margin-right: 10px; /* 레이블과 입력 필드 사이의 간격 */
    }
    input[type="text"],
    input[type="password"] {
        flex: 1; /* 입력 필드가 남은 공간을 차지하도록 설정 */
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #3d7373;
        color: white;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        width: 100%;
    }
    input[type="submit"]:hover {
        background-color: #3d7373;
    }
    p {
        margin-top: 20px;
    }
    
    button {
        background-color: #3d7373;
        color: white;
        border: none;

        cursor: pointer;
        transition: background-color 0.3s;
    }
    button > a {
        color: white;
        text-decoration: none;
    }
</style>
	<script>
    window.onload = function() {
        var birthInput = document.getElementById("user_birth");
        var birthValue = birthInput.value;
        birthInput.value = birthValue.split(" ")[0]; // "1996.10.10"만 남김
    };

    function validateForm() {
        var password = document.getElementById("user_pw").value;
        var confirmPassword = document.getElementById("user_pw_confirm").value;

        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
            return false; // 폼 제출을 막음
        }
        return true; // 폼 제출 허용
    }
</script>

</head>




<body>
	<%@include file="includes/mypage_header.jsp"%>
	
	
	
	
	<div id="review-box">
    <h2>회원정보 업데이트</h2><br><br>
    <table class="table table-hover">

        <c:if test="${not empty loginUser}">
        <form action="/mypage/updateMember" method="post" onsubmit="return validateForm();">
            <div class="form-group">
                <label for="user_id">아이디:</label>
                <input type="text" name="user_id" value="${loginUser.userid}" readonly/>
            </div>
            
            <div class="form-group">
                <label for="user_name">사용자 이름:</label>
                <input type="text" id="user_name" name="user_name" value="${loginUser.username}" required/>
            </div>

            <div class="form-group">
                <label for="user_pw">비밀번호:</label>
                <input type="password" id="user_pw" name="user_pw" required>
            </div>
            
            <div class="form-group">
                <label for="user_pw_confirm">비밀번호 확인:</label>
                <input type="password" id="user_pw_confirm" name="user_pw_confirm" required>
            </div>
            
            <div class="form-group">
                <label for="user_birth">생년월일:</label>
                <input type="date" id="user_birth" name="user_birth" value="${loginUser.birth}" required/>
            </div>
            
            <div class="form-group">
                <label for="user_number">전화번호:</label>
                <input type="text" id="user_number" name="user_number" value="${loginUser.number}" required/>
            </div>

            <div class="form-group">
                <label for="user_addr">주소:</label>
                <input type="text" id="user_addr" name="user_addr" value="${loginUser.addr}" required/>
            </div>

            <button><input type="submit" value="수정하기"/></button>
        </form>
        </c:if>

        <c:if test="${empty loginUser}">
            <p>로그인하지 않으셨습니다. <a href="/customLogin">로그인</a></p>
        </c:if>
    </table>
</div>
	
		
	
	
	
	
	<%@include file="includes/mypage_footer.jsp"%>

</body>
</html>