<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	String userId = (String)session.getAttribute("id");	// 로그인된 아이디 정보
	System.out.println("사용자 === " + userId); 
	
	// 로그인 여부 확인
	if( userId == null ) {
		response.sendRedirect("/"); // login 페이지 이동
		return;
	}

	String filePathProduct = application.getRealPath("/shopContent/"); // 제품 정보가 있는 경로
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
			if(file.isFile()){ // 정상 파일인지 확인
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
		<title>카카오프렌즈 공식 온라인스토어</title>
	</head>

	<body>
		<!-- 사용자 정보 레이아웃 -->
		<article class="productHeder">
			<jsp:include page="/WEB-INF/jsp/userInfo.jsp"></jsp:include>
		</article>
		
		<!-- 제품 목록 레이아웃 -->
		<article class="productForm">
			<%
				for( int i = 0; i < 10; i++ ){
			%>
			<form action="/buyProduct" method="post" class="productArticle" onsubmit="return checkCount(this)">
				<!-- 화면에 나타나진 않지만 buyPtoduct.jsp로 보내어지는 제품정보 값 -->
				<input type="hidden" name="productNumber" value="<%=i%>">
				<input type="hidden" name="productCount" value="<%=fileCount[i]%>">
				<div class="productClass">
					<div>
						<img src="<%=fileImgUrl[i]%>" alt="제품 이미지"/>
					</div>
					<div>
						이름 :&nbsp;<%=fileName[i]%>
					</div>
					<div>
						가격 :&nbsp;<%=filePrice[i]%>
					</div>
					<div>
						재고 :&nbsp;<span><%=fileCount[i]%></span>
					</div>
					<div>
						<%
							// 제고 확인
							if( !fileCount[i].equals("0") ){
						%>
								<input type = "submit" value = "구매">
						<%
							} else {
						%>
								구매 불가
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