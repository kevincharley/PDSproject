<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%-- 
    Document   : Add stockACtion
    Created on : November , 2019, 10:51:05 AM
    Author     : KEVIN
--%>
    <%@page import="com.bean.AdminBean" %>
    <%@page import="com.dao.AdminDao" %>
    <%@page import ="java.util.ArrayList" %>
    <%
    	String ssId=request.getParameter("id");
    
    
    AdminBean stk=new AdminBean();
    stk.setSsid(ssId);
    ArrayList<AdminBean> view=AdminDao.selectView(stk); 
    session.setAttribute("list",view);
    for(AdminBean sv:view){
		AdminBean ad=new AdminBean();
		ad.setSregion(sv.getSregion());
		ad.setSusername(sv.getSusername());
		ad.setSemail(sv.getSemail());
		ad.setSid(sv.getSid());
		
	}
    response.sendRedirect("AdminAddStock.jsp");
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