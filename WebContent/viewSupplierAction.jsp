<%-- 
    Document   : Supplier View Action
    Created on : November 13, 2019, 10:30 AM
    Author     : Neeraja R
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.dao.AdminDao"%>
<%@ page import="com.bean.AdminBean"%>
<%@ page import="java.util.ArrayList"%>
<html>
<head>
<link rel="stylesheet" href="styles/header.css">
<link rel="stylesheet" href="styles/tables.css">
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
<%
	ArrayList<AdminBean> ab = AdminDao.viewSuppliers();

	AdminBean enquiryBean = new AdminBean();

	int size = 0;
	size = ab.size();
	if (size == 0) {
%>
<h3 align="center">NO DATA TO SHOWN</h3>
<%
	} else {
%>
    <div class="view-img">
    <div class="tb">
<table width="500" border="1" align="center">

	<tr>
		<td align="center">Sl.No</td>

		<td align="center">Supplier Name</td>
		<td align="center">Region</td>
		<td align="center">Email</td>
		<td align="center">Supplier Code</td>
		<td align="center">Action</td>
		<td align="center">Action</td>


	</tr>
	<%
		int i = 0;

			for (AdminBean it : ab) {

				i = i + 1;
	%>


	<tr>
		<td width="12" height="20" align="center"><span
			style="font-size: 14"><%=i%></span></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getSusername()%> </span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getSregion()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getSemail()%></span>
			</div></td>
			<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getSsid()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><a
					href="supplierUpdate.jsp?sid=<%=it.getSid()%>&susername=<%=it.getSusername()%>&semail=<%=it.getSemail()%>">Edit</a></span></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><a
					href="supplierDeleteAction.jsp?sid=<%=it.getSid()%>">Delete</a></span></td>

	</tr>

	<%
		}
		}
	%>
	
</table>
</div>
</div>
<footer class="container-fluid text-center" style=" background-color: #000000; padding: 25px;">
  <p style="color: grey;">e-Ration Copyright @ Hexclan</p>  
</footer>
</body>
</html>