<%@page import="java.io.FileNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	
	String userIdPath = application.getRealPath("/user/" + userId + ".txt");
	BufferedReader userIdCheck = null; // ����� ���� Ȯ��
	
	//����� file ���� Ȯ��
	try{
		userIdCheck = new BufferedReader(new FileReader(userIdPath));
		userIdCheck.close();
		%>
		<script>
			alert("�̹� �����ϴ� ���̵� �Դϴ�."); 
			location.replace("/join") ;
		</script>
		<% 
	//����� ������ ���ٸ�, ����� ���� ����	
	}catch (FileNotFoundException ex){
		String userBuyList = application.getRealPath("/user/" + userId + "_�̿볻��.txt");
		PrintWriter writer = null;
		
		try{
			writer = new PrintWriter(userIdPath);	//���� ���� ���
			
			writer.printf(userPw + "%n");
			writer.printf("500000%n");	// ȸ�� ���Խ� ����Ʈ 500,000 ����
			writer.flush();
			session.setAttribute("id", userId);
			%>
			<script> 
				alert("���̵� ���� ����"); 
				location.replace("/onlineShop");
			</script>
			<%
			writer.close();
			writer = new PrintWriter(userBuyList);//���ϻ���
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