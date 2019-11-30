<%-- 
    Document   : Supplier update 
    Created on : November 13, 2019, 10:45 AM
    Author     : Neeraja R
--%>


<%
	String susername = request.getParameter("susername");
	String semail = request.getParameter("semail");
	int sid = Integer.parseInt(request.getParameter("sid"));
%>
<html>
<head>
<link rel="stylesheet" href="styles/header.css">
<link rel="stylesheet" href="styles/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update Supplier</title>
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
<form method="post" name="supplierupdatepage"
	action="supplierUpdateAction.jsp">
	<h1 align="center">Update Details</h1>
	<table align="center">
		<tr>
			<td><input type="hidden" name="sid" value=<%=sid%>></td>
		</tr>
		<tr>
			<td><b>Supplier Name </b></td>
			<td><input type="text" name="susername" value=<%=susername%> /></td>

		</tr>
		<tr>
			<td><b>Email </b></td>
			<td><input type="text" name="semail" value=<%=semail%> /></td>
		</tr>
		

		<tr>
			<td></td><td><input type="submit" value="UPDATE" /></td>
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
