
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%-- 
    Document   : view customers for admin
    Created on : october 31, 2019, 10:51:05 AM
    Author     : chindhusha
--%>
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
 
 <%@page import="java.util.*"%>
 <%@page import="com.bean.AdminBean"%>
 <%@page import="com.dao.AdminDao" %>
    <div class="view-img">
    <div class="tb">
   <% ArrayList<AdminBean> eb=AdminDao.viewCustomerDetails();

AdminBean admBean=new AdminBean();

 		int size=0;
 		size=eb.size();
      if(size==0){%>
    	  <h3 align="center">NO DATA TO SHOWN</h3>
      <% }else{%>
      
      <table align="center" border="1">
      

<tr>
	<th align="center">Sl.No</th>
	
	<th align="center">Customer Name</th>	
		
     <th align="center">Password</th> 
     
     <th align="center">Address</th> 
     
     <th align="center">Region</th> 
     
     <th align="center">Income</th> 
     
     <th align="center">Ration Card No</th> 
     
     <th align="center">Category</th> 
      
     <th align="center">Action</th>
     
     <th align="center">Action</th> 
	
</tr>
      <% 
 		int i=0;
      	
 			for(AdminBean it:eb){
				
 				i=i+1;
  
                %>
 
 
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i %></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCusername()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCpassword()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCaddress()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCregion()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCincome()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCrationid()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCategory()%></span></div></td>
	 <td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="deleteCustomer.jsp?uname=<%=it.getCid()%>">Delete</a></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><a href="editCustomer.jsp?uname=<%=it.getCid()%>&cname=<%=it.getCusername()%>&add=<%=it.getCaddress()%>
	&reg=<%=it.getCregion()%>&inc=<%=it.getCincome()%>">
	Edit</a></span></div></td>
	</tr>
  
  <% } }%>

</table>
</div>
</div>
<footer class="container-fluid text-center" style=" background-color: #000000; padding: 25px;">
  <p style="color: grey;">e-Ration Copyright @ Hexclan</p>  
</footer>
</body>
</html>