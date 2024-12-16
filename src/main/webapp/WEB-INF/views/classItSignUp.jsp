<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/classItSignUp.css" />

    <title>클래스잇 회원가입</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    var isIdAvailable = false; // 아이디 사용 가능 여부를 저장하는 변수

    function validateForm() {
        var password = document.getElementById("user_pw").value;
        var confirmPassword = document.getElementById("user_pw_confirm").value;

        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
            return false; // 폼 제출을 막음
        }

        if (!isIdAvailable) { // 아이디가 사용 중인 경우
            alert("아이디 중복체크를 해주세요.");
            return false; // 폼 제출을 막음
        }

        return true; // 폼 제출 허용
    }

    $(document).ready(function() {
        $('#checkIdBtn').click(function() {
            const id = $('#user_id').val();

            if (!id) {
                alert("아이디를 입력해주세요.");
                return;
            }

            $.ajax({
                url: '/confirmID',
                type: 'get',
                data: { id: id },
                success: function(response) {
                    alert(response.msg);
                    isIdAvailable = response.msg === "사용 가능한 아이디입니다."; // 아이디 사용 가능 여부 설정
                },
                error: function() {
                    console.log("ajax error");
                }
            });
        });
    });
</script>

</head>
<body>

<div class="page-wrapper">


	<div class="container">
		
		<div class="form_box">
    	<h1 class="login_title"><a href='/'>CLASS IT</a></h1>
    	<form class="join_form" action="/classItSignUp" method="post" onsubmit="return validateForm()">
        	<input type="text" id="user_name" name="user_name" required placeholder="이름">
	
			<div class="id_box">
        		<input type="text" id="user_id" name="user_id" placeholder="아이디">
        		<button type="button" id="checkIdBtn">중복 체크</button>
			</div>
			
        	<input type="password" id="user_pw" name="user_pw" required placeholder="비밀번호">
        
        	<input type="password" id="user_pw_confirm" name="user_pw_confirm" required placeholder="비밀번호 확인">

        	<input type="date" id="user_birth" name="user_birth" required placeholder="생년월일">

        	<input type="text" id="user_number" name="user_number" required placeholder="전화번호">

        	<input type="text" id="user_addr" name="user_addr" required placeholder="주소">

        	<input class="join_join_btn" type="submit" value="회원가입">
    	</form>
    	</div>
    
	</div>
</div>
</body>
</html>
