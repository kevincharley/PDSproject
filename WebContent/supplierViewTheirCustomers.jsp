<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import="java.util.*"%>
 <%@page import="com.bean.AdminBean"%>
 <%@page import="com.dao.AdminDao" %>
 <%@page import="com.dao.SupplierDao" %>
    
    
   <% 
   AdminBean admBean = new AdminBean();
	int uid = (Integer) session.getAttribute("uid");
	System.out.println(uid);
	admBean.setSid(uid);
	
   ArrayList<AdminBean> eb=SupplierDao.supplierViewCustomers(admBean);

AdminBean adBean=new AdminBean();

 		int size=0;
 		
 		size=eb.size();
      if(size==0){%>
    	  <h3 align="center">NO DATA TO SHOWN</h3>
      <% }else{%>
      
      <table align="center" border="1">
      

<tr>
	<th align="center">Sl.No</th>
	
	<th align="center">Customer Name</th>	
		
    
     
     <th align="center">Address</th> 
     
    
     
     <th align="center">Income</th> 
     
     <th align="center">Ration Card No</th> 
     
     <th align="center">Category</th> 
      
    
     
	
</tr>
      <% 
 		int i=0;
      	
 			for(AdminBean it:eb){
				
 				i=i+1;
  
                %>
 
 
    <tr><td width="12" height="20" align="center"><span style="font-size: 14"><%=i %></span></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCusername()%> </span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCaddress()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCincome()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCrationid()%></span></div></td>
	<td width="43" align="center"><div align="center" ><span style="font-size: 14"><%=it.getCategory()%></span></div></td>
	
	
	</tr>
  
  <% } }%>

</table>

</body>
</html>