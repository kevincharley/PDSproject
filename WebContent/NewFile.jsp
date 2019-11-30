<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.util.Calendar" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.sql.Date" %>
    <%@ page import="java.lang.Math" %>
    
    <%
     int a=191;
    int b =5;
    Calendar cal = Calendar.getInstance();
   
    cal.set(2, b);
   Date d=new Date(cal.getTimeInMillis());
   String s=new SimpleDateFormat("MMMM").format(d);
   out.println("Month Name :"+s);
   float flo=2.7f;
   int i = Math.round(flo);
   out.print(i);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>