<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String userId = (String) session.getAttribute("id");	// �α��ε� ���̵� ����
	String userIdPath = application.getRealPath("/user/" + userId + ".txt");
	BufferedReader reader = new BufferedReader(new FileReader(userIdPath));
	String point = null;
	try{
		point = reader.readLine();//�н����� (����Ʈ ���� �������� ���� 2�� ����)
		point = reader.readLine();//����Ʈ
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
	<div>���̵� : <%=userId%></div>
	<div>����Ʈ : <%=point%></div>
	<div>
		<a href = "/onlineShop"><button>�¶��ν����</button></a>
		<a href = "/breakdown"><button>�̿볻�� Ȯ��</button></a>
		<a href = "/logout"><button>�α׾ƿ�</button></a>
	</div>
</div>