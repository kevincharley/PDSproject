<%-- 
    Document   : Supplier Insert Action
    Created on : November 13, 2019, 10:15 AM
    Author     : Neeraja R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bean.AdminBean"%>
<%@page import="com.dao.AdminDao"%>

<%
	String susername = request.getParameter("susername");
	String spassword = request.getParameter("spassword");
	String sregion = request.getParameter("sregion");
	String semail = request.getParameter("semail");
	
	AdminBean adminBean = new AdminBean();
	adminBean.setSusername(susername);
	adminBean.setSpassword(spassword);
	adminBean.setSregion(sregion);
	adminBean.setSemail(semail);
	
	boolean flag = AdminDao.insertSuppliers(adminBean);
	if (flag == true) {

		response.sendRedirect("viewSupplierAction.jsp");
	} else {

		//response.sendRedirect("error.html");
	}
%>


