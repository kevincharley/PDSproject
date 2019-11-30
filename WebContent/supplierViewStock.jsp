<%-- 
    Document   : Supplier View Action
    Created on : November 13, 2019, 10:30 AM
    Author     :Mijna
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.dao.AdminDao"%>
<%@ page import="com.bean.AdminBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.dao.SupplierDao"%>
<%
	AdminBean admBean = new AdminBean();

	
	
	Integer sId=(Integer)session.getAttribute("uid");
	admBean.setSid(sId);

	ArrayList<AdminBean> ab = SupplierDao.supplierViewStock(admBean);

	AdminBean spBean = new AdminBean();

	int size = 0;
	size = ab.size();
	if (size == 0) {
%>
<h3 align="center">NO DATA TO SHOWN</h3>
<%
	} else {
%>
<table width="500" border="1" align="center">

	<tr>
		<td align="center">Sl.No</td>

		
		<td align="center">Rice APL</td>
		<td align="center">Wheat APL</td>
		<td align="center">Sugar APL</td>
		<td align="center">Rice BPL</td>
		<td align="center">Wheat BPL</td>
		<td align="center">Sugar BPL</td>
		<td align="center">TOTAL</td>
		
		<td align="center">Date</td>
		<td align="center">Balance</td>
		<td align="center">Stock Type</td>
		<td align="center">Month</td>



	</tr>
	<%
		int i = 0;

			for (AdminBean it : ab) {

				i = i + 1;
	%>


	<tr>
		<td width="12" height="20" align="center"><span
			style="font-size: 14"><%=i%></span></td>
		
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getStriceA()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getStwheatA()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getStsugarA()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getStriceB()%> </span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getStwheatB()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getStsugarB()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getSttotal()%></span>
			</div></td>
		
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getStDate()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getStbalance()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getSttype()%></span>
			</div></td>
		<td width="43" align="center"><div align="center">
				<span style="font-size: 14"><%=it.getStMonth()%></span>
			</div></td>
	</tr>

	<%
		}
		}
	%>

</table>
