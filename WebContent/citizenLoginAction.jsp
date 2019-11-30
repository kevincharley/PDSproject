
 <%-- 
    Document   : citizen
    Created on : November , 2019, 10:51:05 AM
    Author     : KEVIN
--%><%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.bean.CitizenBean" %>
    <%@page import="com.dao.CitizenDao" %>
    <%@page import="java.sql.ResultSet" %>
    <%
    String crationid=request.getParameter("crationid");
 
    CitizenBean cobj=new CitizenBean();
    cobj.setCrationid(crationid);
    ResultSet rs=CitizenDao.citizenIdCheck(cobj);
    String rId="";int cId=0;
    while(rs.next()){
    	 rId=rs.getString(7);
    	cId=rs.getInt(1);
    }
    System.out.print(""+rId+" "+cId);
    session.setAttribute("cId", cId);
    if(rId.equalsIgnoreCase(crationid)){
    	response.sendRedirect("citizeDetails.jsp");
    }
    else{
    	String msg="Enter correct RatioonId";
    	response.sendRedirect("citizenLogin.jsp?msg="+msg);
    }
  
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>