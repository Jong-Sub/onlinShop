<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("EUC-KR");
	String userId = request.getParameter("userId");	
	String userPw = request.getParameter("userPw");
	
	boolean login = true;	// �α��� Ȯ�� ����
	BufferedReader reader = null;
	
	try{
		String userIdPath = application.getRealPath("/user/" + userId + ".txt");
		reader = new BufferedReader(new FileReader(userIdPath));
		String pw = reader.readLine();	// user������ txt���� ���� ù��° ���� �н�����
		
		// �α��� ���� ����
		if( pw.equals(userPw) ){ // �н����� Ȯ��
			session.setAttribute("id", userId);
			session.setMaxInactiveInterval(1000); // 1000�� ���� �α��� ���� ����
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
		alert("'���̵�' �Ǵ� '��й�ȣ'�� Ȯ���ϼ���.");
		location.replace("/"); // login ������ �̵�
	} else{
		location.replace("/onlineShop"); // onlineShop ������ �̵�
	}
</script>