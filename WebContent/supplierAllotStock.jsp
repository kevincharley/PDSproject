<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%-- 
    Document   :  Supplier allot food grain to user  
    Created on : November 15, 2019, 10:51:05 PM
    Author     : chindhusha
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="com.bean.AdminBean"%>
<%@page import="com.dao.AdminDao"%>
<%@page import="com.dao.SupplierDao"%>
<%@page import="com.bean.SupplierBean"%>

<%
	AdminBean stk = new AdminBean();
	ArrayList<AdminBean> lst = (ArrayList<AdminBean>) session.getAttribute("list");
	Date lastDate = null;
	String category = "";

	if (lst != null) {
		for (AdminBean e : lst) {
			lastDate = e.getcLastPurchaseDate();
			category = e.getCategory();

		}
	}
	out.println(category);
	// session.setAttribute("region", a);
%>
<html>
<head>
<link rel="stylesheet" href="styles/header.css">
<!-- <link rel="stylesheet" href="styles/style.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>e-ration</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
<script>
	function show() {
		var select = document.getElementById("customerDrop");
		var rationId = select.options[select.selectedIndex].value;
		window.location = "supplierStockPurchaseDetailsAction.jsp?id="
				+ rationId + "";
	}
</script>
</head>

<body>
<header class="header-area">
         <div class="logo">
             <img src="images/small.JPG" alt="">
             <div class="navigation">
                    <nav>
                        <ul>
                            <li><a href="supplierHome.jsp">Home</a></li>
                            
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
	<form method="post" name="allot" action="supplierAllotStockAction.jsp">
	
		<h1 align="center">Choose Customer</h1>
		<table align="center"  style="text-align: center;">
			

			<tr>
				<td><b>Customer:</b></td>
				<td><select class="sup-select" name="user" id="customerDrop" onChange="show()">
				<option value="select">select</option>

						<%
							AdminBean admBean = new AdminBean();
							int uid = (Integer) session.getAttribute("uid");
							System.out.println(uid);
							admBean.setSid(uid);
							
							int b = 0;
							ArrayList<AdminBean> eb = SupplierDao.supplierViewCustomers(admBean);
							AdminBean spBean = new AdminBean();
							for (AdminBean it : eb) {
								b = it.getCid();
						%>

						<option value="<%=it.getCrationid()%>"><%=it.getCrationid()%></option>
						<%
							}
						%>

				</select></td>


			</tr>

			<tr>
				<td><b>Date: </b></td>
				<td><input class="sup-date" type="date" name="date" required /></td>
			</tr>

			<tr>
				<td>
					<h3> Customer Details</h3>
				</td>
			</tr>

			<%
				for (AdminBean it : eb) {
			%>
			<tr>
				<td><input type="hidden" name="cid" 
					value="<%=it.getCid()%>"></td>
			</tr>

			<%
				}
			%>

			<tr>
				<td><input type="hidden" name="sid"
					value="<%=admBean.getSid()%>"></td>
			</tr>

			<tr>
				<td>Card Type:
				</td>
				<td><input class="sup-inp" type="text" readonly="readonly" name="category"
					value="<%=category%>"></td>
			</tr>

			<tr>
				<td></td>
				<td><input  type="hidden" name="lastDate" value="<%=lastDate%>"></td> 
			</tr>



			<tr>
				<td></td>
				<td><button class="sup-but"type="submit">Allote Stock</button></td>
			</tr>

			<tr><td style="color:red;">
			<% String msg="";
			msg=request.getParameter("msg");
			if(msg==""||msg==null){
			msg="";
			
			%><label><%=msg%></label><%
					}else{%><label><%=msg%></label><%} %>
			
			</td></tr>

		</table>
		
	</form>
	</div>
	</div>
	 <footer class="container-fluid text-center" style=" background-color: #000000; padding: 25px;">
  <p>e-Ration Copyright @ Hexclan</p>  
</footer>
</body>
</html>