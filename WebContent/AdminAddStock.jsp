<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%-- 
    Document   : Add stock
    Created on : November , 2019, 10:51:05 AM
    Author     : KEVIN
--%>
    <%@page import="com.bean.AdminBean" %>
    <%@page import="com.dao.AdminDao" %>
     <%@ page import="java.util.ArrayList" %>
     
    <% ArrayList<AdminBean> sview=AdminDao.supplierSelect(); 
    
       AdminBean stk=new AdminBean();
       ArrayList<AdminBean> lst=(ArrayList<AdminBean>)session.getAttribute("list");
       String a="";
       String b="";
       String c="";
       int sid=0;
      if(lst!=null){
    	  for(AdminBean e:lst){
    		  a=e.getSregion();
    		  b=e.getSemail();
    		  c=e.getSusername();
    		  sid=e.getSid();
    	  }
      }
       session.setAttribute("region", a);
       session.setAttribute("sId", sid);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>

function show(){
	var select=document.getElementById("drp");
	var ssId = select.options[select.selectedIndex].value;
	window.location="AdminAddStockAction.jsp?id="+ssId+"";
}
</script>
<link rel="stylesheet " href="styles/style.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="styles/style.css">
    <link href='https://fonts.googleapis.com/css?family=Sofia' rel='stylesheet'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link rel="stylesheet" href="styles/style.css">
<link rel="stylesheet" href="styles/stock.css">
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
  
    <div class="bg-img">
    <div class="box">
<div class="selection">
<form name="adminaddstock" method="post" action="Addingstock.jsp">
<div>
<b>supplierid :</b>
<select name="supplier" id="drp" onchange="show()" required>
<option value="select">select</option>
<%for(AdminBean it:sview){
	%><option value="<%= it.getSsid()%>"><%= it.getSsid() %></option>
	
	
<% }%>

</select></div><br>
<input type="hidden" readonly="readonly" name="" value="<%=c%>">
<input type="hidden" readonly="readonly" name="region" value="<%= a%>" >
<input type="hidden" readonly="readonly" name="" value="<%= b%>"> 
<input type="hidden" name="stockType" value="normal">
 <button type="submit" class="btn1">add normal Stock</button>
</form>
</div>
<div><br>
<form name="festivalStock" method="post"  action="AddFestivalStock.jsp">
<input type="hidden" readonly="readonly" name="region" value="<%= a%>" >
<input type="hidden" name="stockType" value="festival">
 <button type="submit" class="btn2">add festival season stock</button>
 </form>
 </div>
 <div>
<h3>details of selected supplier</h3>
<label>Name of supplier:<%=c%></label><br>
<label>Region of supplier :<%=a %></label><br>
<label>Email of supplier :<%=b %></label><br>
</div>
</div>
</div>
<%@ include file="footer.jsp"%>