<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String userId = (String) session.getAttribute("id");	// 로그인된 아이디 정보
	String userIdPath = application.getRealPath("/user/" + userId + ".txt");
	BufferedReader reader = new BufferedReader(new FileReader(userIdPath));
	String point = null;
	try{
		point = reader.readLine();//패스워드 (포인트 값을 가져오기 위해 2번 읽음)
		point = reader.readLine();//포인트
	} catch( Exception e ){
		e.printStackTrace();
	} finally{
		try{
			reader.close();
		}catch( Exception e2 ){
			e2.printStackTrace();
		}
	}
%>
<head>
	<link href="/css/onlineShop.css" rel="stylesheet" type="text/css"></link>
</head>

<div id="userInfo" class="userInfo">
	<div>아이디 : <%=userId%></div>
	<div>포인트 : <%=point%></div>
	<div>
		<a href = "/onlineShop"><button>온라인스토어</button></a>
		<a href = "/breakdown"><button>이용내역 확인</button></a>
		<a href = "/logout"><button>로그아웃</button></a>
	</div>
</div>