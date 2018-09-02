<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("EUC-KR");
	String userId = request.getParameter("userId");	
	String userPw = request.getParameter("userPw");
	
	boolean login = true;	// 로그인 확인 변수
	BufferedReader reader = null;
	
	try{
		String userIdPath = application.getRealPath("/user/" + userId + ".txt");
		reader = new BufferedReader(new FileReader(userIdPath));
		String pw = reader.readLine();	// user폴더의 txt파일 내부 첫번째 줄은 패스워드
		
		// 로그인 세션 유지
		if( pw.equals(userPw) ){ // 패스워드 확인
			session.setAttribute("id", userId);
			session.setMaxInactiveInterval(1000); // 1000초 동안 로그인 세션 유지
			login = true;	
		}
	} catch( FileNotFoundException e ){
		login = false;
		System.out.println("===== login : false");
	}
%>

<script>
	var login = <%=login%>;
	if( !login ) {
		alert("'아이디' 또는 '비밀번호'를 확인하세요.");
		location.replace("/"); // login 페이지 이동
	} else{
		location.replace("/onlineShop"); // onlineShop 페이지 이동
	}
</script>