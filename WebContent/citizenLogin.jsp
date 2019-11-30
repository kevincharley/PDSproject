<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%-- 
    Document   : citizen
    Created on : November , 2019, 10:51:05 AM
    Author     : KEVIN
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="styles/citizen.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	/* function removeQuerry(){
		var uri = window.location.toString();
		if (uri.indexOf("?") > 0) {
		    var cl
		    ean_uri = uri.substring(0, uri.indexOf("?"));
		    window.history.replaceState({}, document.title, clean_uri);
		   document.getElementById("remove").style.display="none";
		}
	} */
</script>
</head>
<body>
	<header class="header-area">
         <div class="logo">
             <img src="images/small.JPG" alt="">
             <div class="navigation">
                    <nav>
                        <ul>
                            <li><a href="">Home</a></li>
                            
                            <li><a href="">AboutUs</a></li>
                            <li><a href="">Contact</a></li>
                        </ul>
                    </nav>
         </div>
         <div class="line"></div>
        </div>
        
    </header>
    <div class="bg-img">
        <div >
   <div class="lg-div">
	<form name="citizenLogin" method="post" action="citizenLoginAction.jsp"><br>
	 <table>
	    <tr>
	 	  <td ><label style="color: white; padding-right: 7px;">Enter your ration id</label></td><td><input type="text" name="crationid" placeholder=" rationid" required></td>
	 	</tr>
	 	<tr>
	 		<td></td><td><button class="lg-btn" type="submit" onclick="removeQuerry()">submit</button></td>
	 	</tr>
	  </table>
	</form>
	</div>
		<div><%
			String msg="";
		try{
			msg=request.getParameter("msg");
			if(msg=="" || msg==null){
				msg="";
				
			}
		}catch(Exception e){
		     msg="";
			}
			%>	
			<label id="remove"><%=msg %></label>	
		</div>
	</div>
</div>
<footer class="container-fluid text-center" style=" background-color: #000000; padding: 25px;">
  <p> Copyright @ Hexclan</p>  
</footer>
</body>
</html>
