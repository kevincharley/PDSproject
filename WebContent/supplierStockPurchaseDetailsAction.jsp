<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bean.AdminBean" %>
    <%@page import="com.dao.AdminDao" %>
    <%@page import="com.dao.SupplierDao" %>
    <%@page import ="java.util.ArrayList" %>
    <%@page import="com.bean.SupplierBean" %>
    <%
    	String rationId=request.getParameter("id");
    out.println(rationId);
    
    AdminBean stk=new AdminBean();
    stk.setCrationid(rationId);
    ArrayList<AdminBean> view=SupplierDao.supplierViewPurchaseDetails(stk); 
    session.setAttribute("list",view);
   for(AdminBean sv:view){
		AdminBean ad=new AdminBean();
		ad.setCid(sv.getCid());
		ad.setCategory(sv.getCategory());
		ad.setcLastPurchaseDate(sv.getcLastPurchaseDate());
		
	}
    
    response.sendRedirect("supplierAllotStock.jsp");
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