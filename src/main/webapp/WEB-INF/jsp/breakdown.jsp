<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String id = (String) session.getAttribute("id");
	String filePath1 = application.getRealPath("/user/"+id+"_이용내역.txt");
	boolean isLogin = false;
	if( id == null ) isLogin = false;
	else isLogin = true;
	
	BufferedReader reader = null;
	ArrayList<String> breakdownList = null;
	try{
		reader = new BufferedReader(new FileReader(filePath1));
		breakdownList = new ArrayList<String>();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
		String buffer;
		while( (buffer = reader.readLine()) != null ){
			breakdownList.add(buffer);
		}
	} catch( Exception e ){}
%>
<!DOCTYPE html>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>카카오프렌즈 공식 온라인스토어</title>
		<link href="/css/onlineShop.css" rel="stylesheet" type="text/css"></link>
		<script type="text/javascript">
			var isLogin = <%=isLogin%>;
			if( !isLogin ){
				alert("로그인 후 사용해주시기 바랍니다.");
				location.replace("/"); // login 페이지 이동
			}
		</script>
		<link href="/css/onlineShop.css" rel="stylesheet" type="text/css"></link>
		<script type="text/javascript" src="/js/onlineShop.js"></script>
	</head>
	
	<body>
		<section>
			<article>
				<jsp:include page="/WEB-INF/jsp/userInfo.jsp"></jsp:include>
			</article>
			<article>
				<table class="shoppingList">
					<tr>
						<th></th>
						<th>물품명</th>
						<th>가격</th>
						<th>날짜</th>
						<th></th>
					</tr>
					<%
					String[] data;
					for( String datas : breakdownList ){
						data = datas.split("\\|");
					%>
					<tr>
						<td><%=data[0] %></td>
						<td><%=data[1] %></td>
						<td><%=data[2] %></td>
						<td><%=data[3] %></td>
					</tr>
					<%
					}
					%>
				</table>
			</article>
		</section>
	</body>

</html>