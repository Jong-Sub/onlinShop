<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>카카오프렌즈 로그인 페이지</title>
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
					<td><input type="submit" value="로그인"/></td>
					<td><a href = "/join"><input type="button" value="회원가입"/></a></td>
				</tr>
			</table>
		</form>
	</body>
	
</html>