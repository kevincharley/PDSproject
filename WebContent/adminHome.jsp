<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 <% 
	 
	 session=request.getSession(false);
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma","no-cache");
  
    
    if (session.getAttribute("uid")==null) {
      response.sendRedirect("index.jsp?val=You are successfully logged out");
  }
    else{
    	  int uid = (Integer) session.getAttribute("uid");
    }
    

    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet" href="styles/login.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<header class="header-area">
         <div class="logo">
             <img src="images/small.JPG" alt="">
             <div class="navigation-admin">
                    <nav>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="AddCustomers.jsp">Add Customers</a></li>
                            <li><a href="ViewCustomers.jsp">Customers List</a></li>
                            <li><a href="addSuppliers.jsp">Add Suppliers</a></li>
                            <li><a href="viewSupplierAction.jsp">Suppliers List</a></li>
                            <li><a href="AdminAddStock.jsp">Stock</a></li>
                            <li><a href="">Report</a></li>
                            <li><a href="">Contact</a></li>
                            <li><a href="signout.jsp">Sign Out</a></li>
                        </ul>
                    </nav>
         </div>
         <div class="line"></div>
        </div>
        
    </header>
    
	
<div class="bg-img">
<h3>
</div>


    <footer class="container-fluid text-center" style=" background-color: #000000; padding: 25px;">
  <p>e-Ration Copyright @ Hexclan</p>  
</footer>
</body>
</html>