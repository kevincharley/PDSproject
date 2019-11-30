<%-- 
    Document   : Supplier Delete Action
    Created on : November 13, 2019, 12:00PM
    Author     : Neeraja R
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.dao.AdminDao"%>
<%@ page import="com.bean.AdminBean"%>
<%@ page import="java.util.ArrayList"%>
<%
	Integer sid = Integer.parseInt(request.getParameter("sid"));
	AdminBean adminBean = new AdminBean();
	adminBean.setSid(sid);
	boolean flag = AdminDao.deleteSupplier(adminBean);
	if (flag == true) {

		response.sendRedirect("viewSupplierAction.jsp");
	} else {

		response.sendRedirect("error.html");
	}
%>
>
