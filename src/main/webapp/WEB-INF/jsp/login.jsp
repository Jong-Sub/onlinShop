<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>īī�������� �α��� ������</title>
	</head>
	
	<body>
		<form action ="/loginCheck" method ="post">
			<table>
				<tr>
					<td>ID : </td>
					<td><input name = "userId" type="text" required/></td>
				</tr>
				<tr>
					<td>PW : </td>
					<td><input name = "userPw" type="password" required/></td>
				</tr>	
				<tr>
					<td><input type="submit" value="�α���"/></td>
					<td><a href = "/join"><input type="button" value="ȸ������"/></a></td>
				</tr>
			</table>
		</form>
	</body>
	
</html>