<%-- 
    Document   : Enquiry insert Action
    Created on : october 30, 2019, 10:51:05 AM
    Author     : chindhusha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bean.AdminBean" %>
<%@page import="com.dao.AdminDao" %>

<%
    String cname=request.getParameter("cname");
    String cpass=request.getParameter("cpass");
    String caddress=request.getParameter("address");
    String cregion=request.getParameter("region");
    Integer cincome=Integer.parseInt(request.getParameter("income"));
    //String crationid=request.getParameter("rno");
   // String ccategory=request.getParameter("category");
    
    AdminBean admBean=new AdminBean();
    admBean.setCusername(cname);
    admBean.setCpassword(cpass);
    admBean.setCaddress(caddress);
    admBean.setCregion(cregion);
    admBean.setCincome(cincome);
   // admBean.setCrationid(crationid);
    
    
    boolean flag=AdminDao.addCustomers(admBean);
    
    if(flag){
        
        response.sendRedirect("ViewCustomers.jsp");
    }
    else{
      
     response.sendRedirect("error.html");
    }
    
   
   
    %>
    
    
