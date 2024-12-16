<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@include file="../../includes/header.jsp"%>

<head>
	<style>
    	.header_btns {
    		display: none
    	}
	</style>
</head>

    <div id="mypage-header">
       <p>Class Owner</p>
    </div>
    <div class="main-container">
        <nav class="sidebar">
            <div id="profile">
	           	<img alt="프로필이미지" src="/resources/img/icon/user_profile.png">            
	            <div class="profile_text">
	                <p>ID : ${sessionScope.loginUser.userid}</p>
	                <p>이름 : ${sessionScope.loginUser.username}님</p>
	                <p>${sessionScope.loginUser.role}</p>
  
                </div>
            </div>
            <a href="/owner/reserve">예약관리</a>
            <a href="/owner/qna">Q&A관리</a>
        </nav>
        <div class="content">


