<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

     <%-- 
    Document   : edit user
    Created on : october 30, 2019, 10:51:05 AM
    Author     : chindhusha
--%>


<%@page import="com.bean.AdminBean" %>
<%@page import="com.dao.AdminDao" %>


    <%  
    AdminBean admBean=new AdminBean();
    Integer cid=Integer.parseInt(request.getParameter("cid"));
    String cname=request.getParameter("cname");
    String caddress=request.getParameter("caddress");
    String cregion=request.getParameter("cregion");
    Integer cincome=Integer.parseInt(request.getParameter("cincome"));
   // String name=request.getParameter("uname");
   	//out.println(income);
    admBean.setCid(cid);
    admBean.setCusername(cname);
    admBean.setCaddress(caddress);
    admBean.setCregion(cregion);
   	admBean.setCincome(cincome);
   	
    boolean flag=AdminDao.updateCustomerDetails(admBean);
    out.println(flag);
    if(flag==true){
        
        response.sendRedirect("ViewCustomers.jsp");
    }
    else{
      
     //  response.sendRedirect("error.html");
    }
   
   
   
    %>
    
    
    