<%-- 
    Document   : Supplier update Action
    Created on : November 13, 2019,11.30 AM
    Author     : Neeraja R
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.dao.AdminDao"%>
<%@ page import="com.bean.AdminBean"%>
<%@ page import="java.util.ArrayList"%>
<%
	String susername = request.getParameter("susername");
	String semail = request.getParameter("semail");
	Integer sid = Integer.parseInt(request.getParameter("sid"));
	AdminBean adminBean = new AdminBean();
	adminBean.setSusername(susername);
	adminBean.setSemail(semail);
	adminBean.setSid(sid);
	boolean flag = AdminDao.updateSupplier(adminBean);
	if (flag == true) {

		response.sendRedirect("viewSupplierAction.jsp");
	} else {

		response.sendRedirect("error.html");
	}
%>
