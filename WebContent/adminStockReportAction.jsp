<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@page import="com.bean.AdminBean" %>
    <%@page import="com.dao.AdminDao" %>
   <%@page import="java.util.ArrayList" %>
    <% 
    String region=request.getParameter("stockReport");
    
    AdminBean adobj=new AdminBean();
    adobj.setSregion(region);
    ArrayList<AdminBean> lst=AdminDao.stockReport(adobj);
    session.setAttribute("list",lst);
    for( AdminBean sl:lst){
    	
    	 AdminBean ad=new AdminBean();
    	ad.setStregion(sl.getSregion());
    	ad.setStMonth(sl.getStMonth());
    	ad.setStriceA(sl.getStwheatA());
    	ad.setStsugarA(sl.getStsugarA());
    	ad.setStwheatA(sl.getStriceA());
    	ad.setStriceB(sl.getStwheatB());
    	ad.setStsugarB(sl.getStsugarB());
    	ad.setStwheatB(sl.getStriceB());
    	ad.setSttype(sl.getSttype());
    	
    	
    	
    }
    response.sendRedirect("adminStockReport.jsp");
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