<%@page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.sql.*" %>
<%@page import="com.bean.AdminBean" %>
    <%@page import="com.dao.AdminDao" %>
    <%@page import="com.dao.SupplierDao" %>
    <%@page import ="java.util.ArrayList" %>
    <%@page import="com.bean.SupplierBean" %>
    <%@page import="java.util.*" %>
    <%@page import="java.text.DateFormat" %>
    <%@page import="java.text.*" %>
    <%@page import="java.lang.Math" %>
    <%@page import="java.util.concurrent.TimeUnit" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 

Integer cId=Integer.parseInt(request.getParameter("cid"));
Integer sId=Integer.parseInt(request.getParameter("sid"));

//Date date=Date.valueOf(request.getParameter("date"));

//System.out.println(date);
//java.util.Date now=new java.util.Date();
//java.sql.Date s=new java.sql.Date(now.getTime());


String category=request.getParameter("category");
    
    AdminBean stk=new AdminBean();
    stk.setCid(cId);
   	//stk.setCurrentDate(s);
    //stk.setcLastPurchaseDate(laDate);
    stk.setCategory(category);
    stk.setSid(sId);
    Boolean f=SupplierDao.allotStockToCustomers(stk); 
   // ArrayList<AdminBean> view=SupplierDao.allotStockToCustomers(stk); 
    if(f){
    	
    	response.sendRedirect("supplierViewStock.jsp");
    
    
    }else{
    	out.println("FALSE");
    	//String msg="You have already purchased for this month";
    	//response.sendRedirect("supplierAllotStock.jsp?msg="+msg);
   
    }

   %>
</body>
</html>