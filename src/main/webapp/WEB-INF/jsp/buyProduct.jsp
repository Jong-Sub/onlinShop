<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = (String) session.getAttribute("id");	// 로그인된 아이디 정보
	int productNum = Integer.parseInt(request.getParameter("productNumber"));
	int result = 0; // 0 구매 성공, 1 재고 없음, 2 포인트 부족
	
	String filePathProduct = application.getRealPath("/shopContent/product_" + productNum+".txt");
		System.out.println("구입합였습니다. --- product_" + productNum);
	String filePathUser = application.getRealPath("/user/" + id + ".txt");
	String filePathuserBuyList = application.getRealPath("/user/" + id + "_이용내역.txt");
		
	// reader
	BufferedReader readerProduct = null;
	BufferedReader readerUser = null;
	BufferedReader readerBuyList = null;
	
	int int_productPrice; // 제품 가격
	int int_point; // 사용자 보유 포인트
	
	String productName = null;
	String productPrice = null;
	String productCount = null;
	String productImgUrl = null;
	String pw = null;
	
	ArrayList<String> breakdownList;
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
	
	try{
		// 제품, 사용자, 이용내역 reader
		readerProduct = new BufferedReader(new FileReader(filePathProduct));
		readerUser = new BufferedReader(new FileReader(filePathUser));
		readerBuyList = new BufferedReader(new FileReader(filePathuserBuyList));

		// 제품 정보 읽기
		productName = readerProduct.readLine();
		int_productPrice = Integer.parseInt(readerProduct.readLine().replace(",", ""));
		productPrice = Integer.toString(int_productPrice);
		productCount = readerProduct.readLine();
		productImgUrl = readerProduct.readLine();
		
		if( Integer.parseInt(productCount) < 0 ) 
			result = 1; //재고 없음
		
		if( result != 1 ){
			pw = readerUser.readLine();
			int_point = Integer.parseInt(readerUser.readLine());
			if( int_point - int_productPrice < 0 ){
				result = 2;
			} else {
				// product 수정
				productCount = Integer.toString((Integer.parseInt(productCount)-1));	
					System.out.println("제품 제고 --- " + productCount);
				File userFile = new File(filePathProduct);
				userFile.delete();	
				readerProduct.close();
				PrintWriter writer = null;	//해당 아이디 다시 생성해서 비번, 포인트 다시 입력해주기
				writer = new PrintWriter(filePathProduct);
				writer.printf(productName+"%n");
				writer.printf(productPrice+"%n");	
				writer.printf(productCount+"%n");	
				writer.printf(productImgUrl+"%n");
				writer.flush();
				writer.close();
				
				// 사용자 파일에서 보유포인트 수정
				String totalPoint = Integer.toString( int_point - int_productPrice );
				userFile = new File(filePathUser);
				userFile.delete();	
				readerUser.close();
				writer = new PrintWriter(filePathUser);
				writer.printf(pw+"%n");
				writer.printf(totalPoint+"%n");
				writer.flush();
				writer.close(); 
				
				// 이용 내역 수정
				breakdownList = new ArrayList<String>();
				String buffer;
				while( (buffer = readerBuyList.readLine()) != null ){
					breakdownList.add(buffer);
				}
				userFile = new File(filePathuserBuyList);
				userFile.delete();	
				readerBuyList.close();
				writer = new PrintWriter(filePathuserBuyList);
				
				String[] data;
				int i = 1;
				for( String list : breakdownList ){
					data = list.split("\\|");
					writer.printf(i+"|");
					writer.printf(data[1]+"|");
					writer.printf(data[2]+"|");
					writer.printf(data[3]+"|");
					writer.printf(data[4]+"|\r\n");
					i++;
				}
				writer.printf(i+"|");
				writer.printf(productName+"|");
				writer.printf(productPrice+"|");
				writer.printf(sdf.format(d)+"|");
				writer.printf("구매|");
				writer.flush();
				writer.close(); 
			}
		}
	} catch( Exception e ){
		e.printStackTrace();
	} finally{
		try{
			readerProduct.close();
			readerUser.close();
			readerBuyList.close();
		} catch( Exception e) {}
	}
%>

<script>
	var result = <%=result%>;
	if( result == 0 ){
		
	} else if ( result == 1 ){
		alert("재고가 없습니다.");
	} else {
		alert("포인트가 부족합니다.");
	}
	location.replace("/onlineShop");
</script>