<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- 
    Document   :  delete Action
    Created on : November 30, 2019, 10:51:05 AM
    Author     : chindhusha
--%>


<%@page import="com.bean.AdminBean" %>
<%@page import="com.dao.AdminDao" %>

<%
    int cid=Integer.parseInt(request.getParameter("uname"));
    
    AdminBean admBean=new AdminBean();
    admBean.setCid(cid);
     boolean flag=AdminDao.deleteCustomerDetails(admBean); 
    
    if(flag==true){
      response.sendRedirect("ViewCustomers.jsp");
    }else{
    	response.sendRedirect("error.html");
    }
    
    
       
    
    %>