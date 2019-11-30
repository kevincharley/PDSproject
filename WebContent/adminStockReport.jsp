<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.bean.AdminBean" %>
    <%@page import="com.dao.AdminDao" %>
   <%@page import="java.util.ArrayList" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>report</title>
</head>
<body>
<form method="post" name="Stockreport" action="adminStockReportAction.jsp">
            <h1>Stock Report </h1>
            <table>
                <tr><td><b>select region </b></td><td><select name="stockReport">
                <option>--select--</option>
                <%
                AdminBean admBean = new AdminBean();
				
				ArrayList<AdminBean> eb = AdminDao.viewSuppliers();
				AdminBean spBean = new AdminBean();
				for (AdminBean it : eb) {
                %>
                
                <option value="<%=it.getSregion()%>"><%=it.getSregion()%></option>
						<%
							}
						%>
                </select> </td></tr>
       
        
        
        <tr><td></td><td><button type="submit" >View Report</button></td></tr>
            </table>
           
        </form> <div>
        
        <table border="1px">
        <tr>
        <td><b>Sl No</b></td>
        <td><b>Region</b></td>
        <td><b>Month</b></td>
        <td><b>Wheat Apl</b></td>
        <td><b>Sugar Apl</b></td>
        <td><b>Rice Apl</b></td>
        <td><b>Wheat Bpl</b></td>
        <td><b>Sugar Bpl</b></td>
        <td><b>Rice Bpl</b></td>
        <td><b>Stock Type</b></td>
       
        
        </tr>
       <%
       
        ArrayList<AdminBean> list=(ArrayList<AdminBean>)session.getAttribute("list");
       int i=1;
        for(AdminBean sl:list){
        	%>
        	<tr>
        	<td><%=i %></td>
        	<td><%=sl.getStregion()%></td>
        	<td><%=sl.getStMonth() %></td>
        	<td><%=sl.getStwheatA()%></td>
        	<td><%=sl.getStsugarA()%></td>
        	<td><%=sl.getStriceA()%></td>
        	<td><%=sl.getStwheatB()%></td>
        	<td><%=sl.getStsugarB()%></td>
        	<td><%=sl.getStriceB()%></td>
        	<td><%=sl.getSttype()%></td>
        	</tr>
        	<% 
        	
        	
        	      	
        i++;	
        	
        }
        
        %> 
       
        
       
        </table>
        </div>
</body>
</html>