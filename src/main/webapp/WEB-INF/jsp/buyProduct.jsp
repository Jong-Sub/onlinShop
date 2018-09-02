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
	String id = (String) session.getAttribute("id");	// �α��ε� ���̵� ����
	int productNum = Integer.parseInt(request.getParameter("productNumber"));
	int result = 0; // 0 ���� ����, 1 ��� ����, 2 ����Ʈ ����
	
	String filePathProduct = application.getRealPath("/shopContent/product_" + productNum+".txt");
		System.out.println("�����տ����ϴ�. --- product_" + productNum);
	String filePathUser = application.getRealPath("/user/" + id + ".txt");
	String filePathuserBuyList = application.getRealPath("/user/" + id + "_�̿볻��.txt");
		
	// reader
	BufferedReader readerProduct = null;
	BufferedReader readerUser = null;
	BufferedReader readerBuyList = null;
	
	int int_productPrice; // ��ǰ ����
	int int_point; // ����� ���� ����Ʈ
	
	String productName = null;
	String productPrice = null;
	String productCount = null;
	String productImgUrl = null;
	String pw = null;
	
	ArrayList<String> breakdownList;
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMdd");
	
	try{
		// ��ǰ, �����, �̿볻�� reader
		readerProduct = new BufferedReader(new FileReader(filePathProduct));
		readerUser = new BufferedReader(new FileReader(filePathUser));
		readerBuyList = new BufferedReader(new FileReader(filePathuserBuyList));

		// ��ǰ ���� �б�
		productName = readerProduct.readLine();
		int_productPrice = Integer.parseInt(readerProduct.readLine().replace(",", ""));
		productPrice = Integer.toString(int_productPrice);
		productCount = readerProduct.readLine();
		productImgUrl = readerProduct.readLine();
		
		if( Integer.parseInt(productCount) < 0 ) 
			result = 1; //��� ����
		
		if( result != 1 ){
			pw = readerUser.readLine();
			int_point = Integer.parseInt(readerUser.readLine());
			if( int_point - int_productPrice < 0 ){
				result = 2;
			} else {
				// product ����
				productCount = Integer.toString((Integer.parseInt(productCount)-1));	
					System.out.println("��ǰ ���� --- " + productCount);
				File userFile = new File(filePathProduct);
				userFile.delete();	
				readerProduct.close();
				PrintWriter writer = null;	//�ش� ���̵� �ٽ� �����ؼ� ���, ����Ʈ �ٽ� �Է����ֱ�
				writer = new PrintWriter(filePathProduct);
				writer.printf(productName+"%n");
				writer.printf(productPrice+"%n");	
				writer.printf(productCount+"%n");	
				writer.printf(productImgUrl+"%n");
				writer.flush();
				writer.close();
				
				// ����� ���Ͽ��� ��������Ʈ ����
				String totalPoint = Integer.toString( int_point - int_productPrice );
				userFile = new File(filePathUser);
				userFile.delete();	
				readerUser.close();
				writer = new PrintWriter(filePathUser);
				writer.printf(pw+"%n");
				writer.printf(totalPoint+"%n");
				writer.flush();
				writer.close(); 
				
				// �̿� ���� ����
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
				writer.printf("����|");
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
		alert("��� �����ϴ�.");
	} else {
		alert("����Ʈ�� �����մϴ�.");
	}
	location.replace("/onlineShop");
</script>