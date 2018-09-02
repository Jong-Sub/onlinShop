<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>카카오프렌즈 회원가입 페이지</title>
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
		<td>이름:</td>
		<td><input name = "userName" type="text" required/></td>
	</tr>
	<tr>
		<td><input type="submit" value="가입" /></td>
	</tr>
	</table>
</form>
</body>
</html>