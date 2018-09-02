<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String userId = (String)session.getAttribute("id");	// �α��ε� ���̵� ����
	System.out.println("����� === " + userId); 
	
	// �α��� ���� Ȯ��
	if( userId == null ) {
		response.sendRedirect("/"); // login ������ �̵�
		return;
	}

	String filePathProduct = application.getRealPath("/shopContent/"); // ��ǰ ������ �ִ� ���
	File dir = new File(filePathProduct); 
	File[] fileList = dir.listFiles();
	String[] fileName = new String[10];
	String[] filePrice = new String[10];
	String[] fileCount = new String[10];
	String[] fileImgUrl = new String[10];
	BufferedReader reader = null;
	
	try{
		for(int i = 0 ; i < fileList.length ; i++){
			File file = fileList[i]; 
			if(file.isFile()){ // ���� �������� Ȯ��
				reader = new BufferedReader(new FileReader(filePathProduct + "\\" + file.getName()));
				fileName[i] = reader.readLine();
				filePrice[i] = reader.readLine();
				fileCount[i] = reader.readLine();
				fileImgUrl[i] = reader.readLine();
				reader.close();
			}
		}
	}catch(Exception e){
		
	}
	
%>
<!DOCTYPE html>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link href="/css/onlineShop.css" rel="stylesheet" type="text/css"></link>
		<script type="text/javascript" src="/js/onlineShop.js"></script>
		<title>īī�������� ���� �¶��ν����</title>
	</head>

	<body>
		<!-- ����� ���� ���̾ƿ� -->
		<article class="productHeder">
			<jsp:include page="/WEB-INF/jsp/userInfo.jsp"></jsp:include>
		</article>
		
		<!-- ��ǰ ��� ���̾ƿ� -->
		<article class="productForm">
			<%
				for( int i = 0; i < 10; i++ ){
			%>
			<form action="/buyProduct" method="post" class="productArticle" onsubmit="return checkCount(this)">
				<!-- ȭ�鿡 ��Ÿ���� ������ buyPtoduct.jsp�� ���������� ��ǰ���� �� -->
				<input type="hidden" name="productNumber" value="<%=i%>">
				<input type="hidden" name="productCount" value="<%=fileCount[i]%>">
				<div class="productClass">
					<div>
						<img src="<%=fileImgUrl[i]%>" alt="��ǰ �̹���"/>
					</div>
					<div>
						�̸� :&nbsp;<%=fileName[i]%>
					</div>
					<div>
						���� :&nbsp;<%=filePrice[i]%>
					</div>
					<div>
						��� :&nbsp;<span><%=fileCount[i]%></span>
					</div>
					<div>
						<%
							// ���� Ȯ��
							if( !fileCount[i].equals("0") ){
						%>
								<input type = "submit" value = "����">
						<%
							} else {
						%>
								���� �Ұ�
						<%
							}
						%>
					</div>
				</div>
			</form>
			<%
				}
			%>
		</article>
	</body>
	
</html>