<%@page import="com.bean.AdminBean"%>
<%@page import="java.util.ArrayList"%>
 <%-- 
    Document   :citizen
    Created on : November , 2019, 10:51:05 AM
    Author     : KEVIN
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <%@ page import="com.bean.CitizenBean" %>
    <%@page import="com.dao.CitizenDao" %>
<%
int cId=(Integer)session.getAttribute("cId");
System.out.println(cId);
CitizenBean cobj=new CitizenBean();
cobj.setCid(cId);

ArrayList<CitizenBean> clst=CitizenDao.viewCustomerDetail(cobj);


ArrayList<CitizenBean> cHistory=CitizenDao.viewCustomerPurchaseHistory(cobj);

%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function myFunction() {
	  var x = document.getElementById("myDIV");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
function hisFunction() {
	  var x = document.getElementById("pHistory");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
	</script>
	<link rel="stylesheet" href="styles/citizen.css">
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
                            <li><a href="">Home</a></li>
                            
                            <li><a href="">AboutUs</a></li>
                            <li><a href="">Contact</a></li>
                            <li><button onclick="myFunction()">Your Details</button></li>
                            <li><button onclick="hisFunction()">Purchase History</button></li>
                        </ul>
                    </nav>
         </div>
         <div class="line"></div>
        </div>
        
    </header>
<div class="bg-div">



<div id="myDIV" style="display: none">
<%
for(CitizenBean it:clst){
	%>
	Name :<label><%=it.getCusername() %></label><br>
	Category :<label><%=it.getCategory() %></label><br>
	Address :<label><%=it.getCaddress() %></label><br>
	Region :<label><%=it.getCregion() %></label><br>
	
	<%
	/* String region=it.getCregion();
		CitizenBean regionobj=new CitizenBean();
		regionobj.setCregion(region);
		ArrayList<CitizenBean> regionList=CitizenDao.getSeason(regionobj);
		 */
		 
String	category=it.getCategory();
   if(category.equals("APL")){
	   %><br>
	   <label>rice=25 Kgs</label><br>
	   <label>wheat=8 Kgs</label><br>
	   <label>sugar=3 Kgs</label><br>
	   <% 
   }
   else if(category.equalsIgnoreCase("BPL")){
	   %>
	   <label>rice=36 kgs</label><br>
	   <label>wheat=11.5 kgs</label><br>
	   <label>sugar=4.5 kgs</label><br>
	   <% 
   }
   else{
	   
   }
}
%>
</div>
<div id="pHistory" style="display: none">
<table border="1px">
		<tr>
		<th>SL NO</th>
		<th>Date</th>
		<th>Purchase Status</th>
		</tr>
		<%
		int i=0;
		for(CitizenBean ch:cHistory){
			%><tr>
			<td><%=i %></td>
			<td><%=ch.getpDate() %></td>
			<td><%=ch.getpStatus()%></td>
			</tr>
			
			<% i++;
		}
		%>
</table>
</div>
</div>

<div class="bg-img">

 </div>
<footer class="container-fluid text-center" style=" background-color: #000000; padding: 25px;">
  <p> Copyright @ Hexclan</p>  
</footer>
</body>
</html>