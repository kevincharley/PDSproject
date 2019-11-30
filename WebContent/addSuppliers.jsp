<!DOCTYPE html>
<!--
	Document   : Add Supplier by admin
    Created on : November 13, 2019, 10:00 AM
    Author     : Neeraja R
-->

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
	<form method="post" name="supplieraddpage"
		action="addSuppliersAction.jsp">
		<h1 align="center">Add Supplier</h1>
		<table align="center">
			<tr>

				<td><b>Supplier Name </b></td>
				<td><input type="text" name="susername" required="" /></td>
			</tr>
			<tr>
				<td><b>Password</b></td>
				<td><input type="password" name="spassword" required="" /></td>
			</tr>
			<tr>
				<td><b>Region</b></td>
				<td><input type="text" name="sregion" required="" /></td>
			</tr>
			<tr>
				<td><b>Email</b></td>
				<td><input type="text" name="semail" required="" /></td>
			</tr>
			


			<tr>
				<td></td>
				<td><button type="submit">Insert</button></td>
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
