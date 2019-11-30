<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%-- 
    Document   : Add stockaction
    Created on : November , 2019, 10:51:05 AM
    Author     : KEVIN
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.bean.AdminBean" %>
<%@page import="com.dao.AdminDao" %>
<%@page import="java.sql.Date" %>
<%@page import="java.util.Calendar" %>
    <%@page import="java.text.SimpleDateFormat" %>
<%
float riceApl=Float.parseFloat(request.getParameter("riceStockA"));
float wheatApl=Float.parseFloat(request.getParameter("wheatStockA"));
float sugarApl=Float.parseFloat(request.getParameter("sugarStockA"));

float riceBpl=Float.parseFloat(request.getParameter("riceStockB"));
float wheatBpl=Float.parseFloat(request.getParameter("wheatStockB"));
float sugarBpl=Float.parseFloat(request.getParameter("sugarStockB"));

int sId=(Integer)session.getAttribute("sId");
System.out.println(sId);

String stDate=request.getParameter("StockDate");

Date da=Date.valueOf(stDate);
int month=da.getMonth();
Calendar cal = Calendar.getInstance();
cal.set(2, month);
Date d=new Date(cal.getTimeInMillis());
String stockMonth=new SimpleDateFormat("MMMM").format(d);


 System.out.print(stockMonth);
 



float totalStock=riceApl+wheatApl+sugarApl+riceBpl+wheatBpl+sugarBpl;
out.print(totalStock);

String region=(String)session.getAttribute("region");

String stockType=request.getParameter("stockType");

AdminBean addObj=new AdminBean();

addObj.setStriceA(riceApl);
addObj.setStwheatA(wheatApl);
addObj.setStsugarA(sugarApl);

addObj.setStriceB(riceBpl);
addObj.setStwheatB(wheatBpl);
addObj.setStsugarB(sugarBpl);

addObj.setStMonth(stockMonth);
addObj.setStDate(da);
addObj.setSttotal(totalStock);
addObj.setStregion(region);
addObj.setSttype(stockType);
addObj.setSid(sId);

boolean flag=AdminDao.addStock(addObj);
if(flag){
	response.sendRedirect("AdminAddStock.jsp");
}else{
	response.sendRedirect("error.html");
}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>

</body>
</html>