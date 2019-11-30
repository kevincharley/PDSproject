<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="styles/login.css">
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
                            <li><a href="index.jsp">Home</a></li>
                            
                            <li><a href="">AboutUs</a></li>
                            <li><a href="">Contact</a></li>
                            
                        </ul>
                    </nav>
         </div>
         <div class="line"></div>
        </div>
        
    </header>
    <div class="bgimg">
  <div id="formContent">
                      
                        <div class="lg-heading">
                        <div class="log-img"><img src="images/citizen.png"></div>
                         <h2>Login</h2>
                        </div>
                    
                        <!-- Login Form -->
                        <form  method="post" name="logpage" action="loginAction.jsp">
                          <input type="text" id="uname" name="uname" required placeholder="username"/>
                          <input type="password" id="pass" name="pass" required placeholder="password"/>
                          <input type="submit"  value="Log In">
                        </form>
                    
                        <!-- Remind Passowrd -->
                        <div id="formFooter">
                        <%
                        
                        %>
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
			<label id="remove" style="color: red;"><%=msg %></label>
                          <!-- <a class="underlineHover" href="#">Forgot Password?</a> -->
                        </div>
               </div>     
        </div>
        </div>
     
        <footer class="container-fluid text-center" style=" background-color: #000000; padding: 25px;">
  <p>e-Ration Copyright @ Hexclan</p>  
</footer>
</body>
</html>
        
