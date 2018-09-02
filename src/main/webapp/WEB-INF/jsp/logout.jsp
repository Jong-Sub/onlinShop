<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%session.invalidate(); %>

<script>
	alert("로그아웃");
	location.replace("/"); // login 페이지 이동
</script>