<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>īī�������� ȸ������ ������</title>
</head>
<body>
	<form action ="/makeUser" method="post" >
	<table>
	
	<tr>
		<td>ID:</td>
		<td><input name = "userId" type="text" required/></td>
	</tr>
	<tr>
		<td>PW:</td>
		<td><input name = "userPw" type="password" required/></td>
	</tr>	
	<tr>
		<td>�̸�:</td>
		<td><input name = "userName" type="text" required/></td>
	</tr>
	<tr>
		<td><input type="submit" value="����" /></td>
	</tr>
	</table>
</form>
</body>
</html>