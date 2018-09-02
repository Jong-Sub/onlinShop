<%@page import="java.io.FileNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	
	String userIdPath = application.getRealPath("/user/" + userId + ".txt");
	BufferedReader userIdCheck = null; // 사용자 파일 확인
	
	//사용자 file 유무 확인
	try{
		userIdCheck = new BufferedReader(new FileReader(userIdPath));
		userIdCheck.close();
		%>
		<script>
			alert("이미 존재하는 아이디 입니다."); 
			location.replace("/join") ;
		</script>
		<% 
	//사용자 파일이 없다면, 사용자 파일 생성	
	}catch (FileNotFoundException ex){
		String userBuyList = application.getRealPath("/user/" + userId + "_이용내역.txt");
		PrintWriter writer = null;
		
		try{
			writer = new PrintWriter(userIdPath);	//생성 파일 경로
			
			writer.printf(userPw + "%n");
			writer.printf("500000%n");	// 회원 가입시 포인트 500,000 적립
			writer.flush();
			session.setAttribute("id", userId);
			%>
			<script> 
				alert("아이디 생성 성공"); 
				location.replace("/onlineShop");
			</script>
			<%
			writer.close();
			writer = new PrintWriter(userBuyList);//파일생성
		}catch(IOException e){
			out.println("err");
		}finally{
			try{
				writer.close();
			}catch(Exception e){
			}
		}
	}
%>