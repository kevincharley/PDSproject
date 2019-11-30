<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- 
    Document   : edit Customers
    Created on : November 12, 2019, 10:51:05 PM
    Author     : chindhusha
--%>


<%@page import="com.bean.AdminBean"%>
<%@page import="com.dao.AdminDao"%>

<%
	//String name=(String)session.getAttribute("uname");
	Integer id = Integer.parseInt(request.getParameter("uname"));
	
	String cname = (request.getParameter("cname"));
	String caddress = (request.getParameter("add"));
	String cregion = (request.getParameter("reg"));
	Integer cincome = Integer.parseInt(request.getParameter("inc"));

	session.setAttribute("cid", id);
	AdminBean admBean = new AdminBean();
%>
<html>
	<head>
	<link rel="stylesheet" href="styles/header.css">
<link rel="stylesheet" href="styles/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Customer</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	</head>
	<body>

<header class="header-area">
         <div class="logo">
             <img src="images/small.JPG" alt="">
             <div class="navigation">
                    <nav>
                        <ul>
                            <li><a href="adminHome.jsp">Home</a></li>
                            
                            <li><a href="">AboutUs</a></li>
                            <li><a href="">Contact</a></li>
                            
                        </ul>
                    </nav>
         </div>
         <div class="line"></div>
        </div>
        
    </header>
     <div class="cadd-img">
     <div class="cadd-div">
<form method="post" action="editCustomerAction.jsp">
	<h1 align="center">Update Customer Details</h1>
	<table align="center">
		<tr>
			<td><b></b></td>
			<td><input type="hidden" name="cid" value="<%=id%>"  /></td>
		</tr>
		<tr>
			<td><b>Update Customer name:</b></td>
			<td><input type="text" name="cname" value="<%=cname%>"  /></td>
		</tr>
		<tr>
			<td><b>Update Address </b></td>
			<td><input type="text" name="caddress" value="<%=caddress%>"  /></td>
		</tr>

		<tr>
			<td><b>Update Region </b></td>
			<td><input type="text" name="cregion" value="<%=cregion%>"  /></td>
		</tr>

		<tr>
			<td><b>Update Income </b></td>
			<td><input type="text" name="cincome" value="<%=cincome%>"  /></td>
		</tr>

		<tr>
			<td></td>
			<td><button type="submit">Update</button></td>
		</tr>
	</table>

</form>
</div>
</div>
<footer class="container-fluid text-center" style=" background-color: #000000; padding: 25px;">
  <p style="color: grey;">e-Ration Copyright @ Hexclan</p>  
</footer>
</body>
</html>