<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%-- 
    Document   : Add stock for festival
    Created on : November , 2019, 10:51:05 AM
    Author     : KEVIN
--%>
    <%@page import="com.bean.AdminBean" %>
<%@page import="com.dao.AdminDao" %>
<%@page import="java.sql.Date" %>
<%
String region=request.getParameter("region");

String stockType=request.getParameter("stockType");

AdminBean addStock=new AdminBean();
addStock.setSregion(region);
int countApl= AdminDao.getAplCount(addStock) ;


int countBpl=AdminDao.getBplCount(addStock);


double riceApl = countApl*25;
double riceBpl=  countBpl*(35.5+6.125);
double wheatApl=countApl*(8);
double wheatBpl=countBpl*(8+3.5+2.1);
double sugarApl=countApl*(2.5);
double sugarBpl=countBpl*(2.5+1+0.61);
double totalStockRequired=riceApl+riceBpl+wheatApl+wheatBpl+sugarApl+sugarBpl;

%>
<html>

<head>
<link rel="stylesheet" href="styles/citizen.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function checkStock(){
	

	var riceReqA=document.getElementById("ricereqApl").value;
	var wheatReqA=document.getElementById("wheatreqApl").value;
	var sugarReqA=document.getElementById("sugarreqApl").value;
	
	var riceReqB=document.getElementById("ricereqBpl").value;
	var wheatReqB=document.getElementById("wheatreqBpl").value;
	var sugarReqB=document.getElementById("sugarreqBpl").value
	
	
	var riceA=document.addStock.riceStockA.value;
	var wheatA=document.addStock.wheatStockA.value;
	var sugarA=document.addStock.sugarStockA.value;
	var riceB=document.addStock.riceStockB.value;
	var wheatB=document.addStock.wheatStockB.value;
	var sugarB=document.addStock.sugarStockB.value;
	

	
	if(parseFloat(riceReqA)>parseFloat(riceA) ){
		document.getElementById("demo").innerHTML = "add stock to meet minimum requirement!!!";
		return false;
	}
	else if( parseFloat(riceA)>parseFloat(riceReqA)+(3)){
		document.getElementById("demo").innerHTML = "too much higher than the requirement!!! ";
		return false;
	}
	else if(parseFloat(wheatReqA)>parseFloat(wheatA)){
		document.getElementById("demo1").innerHTML = "add stock to meet minimum requirement";
		return false;
	}
	else if( parseFloat(wheatA)>parseFloat(wheatReqA)+(2)){
		document.getElementById("demo1").innerHTML = "too much higher than the requirement!!! ";
		return false;
	}
	else if(parseFloat(sugarReqA)>parseFloat(sugarA)){
		document.getElementById("demo2").innerHTML = "add stock to meet minimum requirement";
		return false;
		
	}
	else if( parseFloat(sugarA)>parseFloat(sugarReqA)+(1)){
		document.getElementById("demo2").innerHTML = "too much higher than the requirement!!! ";
		return false;
	}
	if(parseFloat(riceReqB)>parseFloat(riceB)){
		document.getElementById("demo3").innerHTML = "add stock to meet minimum requirement";
		return false;
	}
	else if( parseFloat(riceB)>parseFloat(riceReqB)+(3)){
		document.getElementById("demo3").innerHTML = "too much higher than the requirement!!! ";
		return false;
	}
	else if(parseFloat(wheatReqB)>parseFloat(wheatB)){
		document.getElementById("demo4").innerHTML = "add stock to meet minimum requirement";
		return false;
	}
	else if( parseFloat(wheatB)>parseFloat(wheatReqB)+(2)){
		document.getElementById("demo4").innerHTML = "too much higher than the requirement!!! ";
		return false;
	}
	else if(parseFloat(sugarReqB)>parseFloat(sugarB)){
		document.getElementById("demo5").innerHTML = "add stock to meet minimum requirement";
		return false;
	}
	else if( parseFloat(sugarB)>parseFloat(sugarReqB)+(1)){
		document.getElementById("demo5").innerHTML = "too much higher than the requirement!!! ";
		return false;
	}
	else{
		// alert("enter stock to meet minimum requirement"); 
		return true;
	} 
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
                            <li><a href="">Home</a></li>
                            
                            <li><a href="">AboutUs</a></li>
                            <li><a href="">Contact</a></li>
                        </ul>
                    </nav>
         </div>
         <div class="line"></div>
        </div>
        
    </header>
    <div class="bg-div">
<div class="grid-div">
   
   
<div class="labels">
<label>Minimum stock required for the region is :<%=totalStockRequired %>Kgs </label><br>

<label>Minimum rice required for all APL cards is:<%=riceApl%>Kgs</label><br>
<label>Minimum wheat required for all APL cards is:<%=wheatApl %>Kgs</label><br>
<label>Minimum sugar required for all APL cards is<%=sugarApl %>Kgs</label><br>

<label>Minimum rice required for all BPl cards is:<%=riceBpl %>Kgs</label><br>
<label>Minimum wheat required for all BPl cards is:<%=wheatBpl %>Kgs</label><br>
<label>Minimum sugar required for all BPl cards is:<%=sugarBpl %>Kgs</label><br></div>
<div class="tab-div">
	<form name="addStock" method="post" action="AddingStockAction.jsp"> 
	  <table align="center">
		<tr><td>Rice for Apl :</td>
		<td><input type="text" name="riceStockA" required ><br><p id="demo" style="color :red ;"></p></td></tr>
        <tr><td>wheat for Apl :</td>
		<td><input type="text" name="wheatStockA" required><br><p id="demo1" style="color :red ;"></p></td></tr>
        <tr><td>sugar for Apl  :</td>
		<td><input type="text" name="sugarStockA" required><br><p id="demo2" style="color :red ;"></p></td></tr>
        <tr><td>rice for Bpl  :</td>
		<td><input type="text" name="riceStockB" required><br><p id="demo3" style="color :red ;"></p></td></tr>
        <tr><td>wheat for Bpl :</td>
		<td><input type="text" name="wheatStockB" required><br><p id="demo4" style="color :red ;"></p></td></tr>
        <tr><td>sugar for Bpl :</td>
		<td><input type="text" name="sugarStockB" required><br><p id="demo5" style="color :red ;"></p></td></tr>
        <tr><td>enter date</td><td><input type="date" name="StockDate" required></td></tr><tr></tr>
        <tr><td></td><td><button type="submit" onclick=" return checkStock()">submit</button><br></td></tr>
        <tr><td><input type="hidden" id="ricereqApl" value="<%= riceApl%>"></td>
        <tr><td><input type="hidden" id="wheatreqApl" value="<%=wheatApl %>"></td>
        <tr><td><input type="hidden" id="sugarreqApl" value="<%= sugarApl%>"></td>
        <tr><td><input type="hidden" id="ricereqBpl" value="<%= riceBpl%>"></td>
        <tr><td><input type="hidden" id="wheatreqBpl" value="<%=wheatBpl %>"></td>
        <tr><td><input type="hidden" id="sugarreqBpl" value="<%= sugarBpl%>"></td>
        <tr><td><input type="hidden" name="stockType" value="<%=stockType%>"></td>
     </table>
	</form>
</div>
</div>
</div>



</form>
</body>
</html>

<%@ include file="footer.jsp"%>