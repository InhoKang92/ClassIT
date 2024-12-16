<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스잇 관리페이지</title>
<style>
	#review-box {padding: 20px 0 ;}
</style>


<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/mypage/sidebar.css" />



</head>




<body>
<%@include file="includes/owner_header.jsp"%>
<div id="review-box">
<h2>관리자 전용 페이지 입니다.</h2>
<table class="table table-hover">
	<thead>
		<tr>
			<th>번호</th>
			<th>클래스명</th>
			<th>클래스일정</th>
			<th>후기제목</th>
			<th>작성일</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th scope="row">1</th>
			<td>Mark</td>
			<td>Otto</td>
			<td>@mdo</td>
			<td>@mdo</td>
		</tr>
	</tbody>
</table>
</div>


<%@include file="includes/owner_footer.jsp"%>

</body>
</html>