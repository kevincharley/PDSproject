<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%-- 
    Document   : sign in action
    Created on : November 15, 2019, 10:51:05 AM
    Author     : chindhusha
--%>

    <%@page import="java.util.*"%>
    <%@page import="com.bean.AdminBean" %>
    <%@page import="com.bean.LoginBean" %>
    <%@page import="com.dao.LoginDao" %>
<%@page import="com.dao.AdminDao" %>
    <%
    //String role=null;
    String uname=request.getParameter("uname");
    String pass=request.getParameter("pass");
    LoginBean logBean=new  LoginBean();
    logBean.setlUserName(uname);
    logBean.setlPassword(pass);
   String role=LoginDao.logCheck(logBean);
   
  
  if(role==null){
    	response.sendRedirect("login.jsp?msg=enter correct username or password");
   
	}else if(role.equals("supplier")){
    	int id=LoginDao.userNameFetch(logBean);								
  	 	session.setAttribute("uid",id);
  	 
    	response.sendRedirect("supplierHome.jsp?user="+uname);
    	
    }else if(role.equals("admin")){	
    	session.setAttribute("uid",1);
    	response.sendRedirect("adminHome.jsp");
    }else{
    	
    }
   
    
    %>