<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- 
    Document   : Add customer by admin
    Created on : November , 2019, 10:51:05 AM
    Author     : chindhusha
--%>
<%@page import="com.bean.AdminBean" %>
<%@page import="com.dao.AdminDao" %>
<%@page import="java.util.ArrayList" %>
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
	<form method="post" name="custmeraddpage"
		action="AddCustomersAction.jsp">
		<h1 align="center">Add Customer</h1>
		
		<table align="center">
			<tr>
				<td><b>Customer name :</b></td>
				<td><input type="text" name="cname" required /></td>
			<tr>
			<tr>
				<td><b>Password:</b></td>
				<td><input type="password" name="cpass" required /></td>
			</tr>
			<tr>
				<td><b>Address</b></td>
				<td><textarea rows=4 cols= 22 name="address" required ></textarea></td>
			</tr>
			<tr>
				<td><b>Region</b></td>
				<!--  <td><input type="text" name="region" required /></td>-->
				
				<td><select name="region" id="customerDrop" style="color: black;" >
				<option value="select">select</option>

						<%
							AdminBean admBean = new AdminBean();
						
							ArrayList<AdminBean> eb = AdminDao.viewSuppliers();
							AdminBean spBean = new AdminBean();
							for (AdminBean it : eb) {
								
						%>

						<option value="<%=it.getSregion()%>"><%=it.getSregion()%></option>
						<%
							}
						%>

				</select></td>
				
				
				
			</tr>
			<tr>
				<td><b>Annual Income</b></td>
				<td><input type="text" name="income" required /></td>
			</tr>
			
			<tr>
				<td></td>
				<td><button type="submit">Add Customer</button></td>
			</tr>

		</table>

	</form>
    </div>
    </div>
 <footer class="container-fluid text-center" style=" background-color: #000000; padding: 25px;">
  <p>e-Ration Copyright @ Hexclan</p>  
</footer>

</body>
</html>