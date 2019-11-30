package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.AdminBean;
//import com.bean.AdminBean;
import com.bean.CitizenBean;
import com.dao.DBDAO;

public class CitizenDao {
	static Connection con=null;
	   static PreparedStatement pst=null;
	   static ResultSet rs=null;
	   static boolean flag=false;
	   
	 //----------start get database connection-------------------------
	      /**
	      *
	      * @author :KEVIN
	      * @version:1.0
	      * @see :DBDAO.java
	      * @param :nothing
	      * @return :connection
	      * @purpose:getdatabase connection **/

	
	public  static Connection getDbConnection() {
		// TODO Auto-generated method stub
		
		try	  {
				DBDAO.connect();
				con = DBDAO.getDbCon();
		   
	  }	catch(ClassNotFoundException  ex)		   {
			 ex.printStackTrace();
		}catch(SQLException e)		{
			e.printStackTrace();
		}
		return con;
	}
	
	 //----------end get database connection-------------------------
    /**
    *
    * @author :KEVIN
    * @version:1.0
    * @param :object
    * @return :resultset
    * @purpose:ccheck citizen 
    * **/
	public static ResultSet citizenIdCheck(CitizenBean cobj)throws SQLException{
		 try{
			   con=getDbConnection();
			   pst=con.prepareStatement("select * from TB_CUSTOMER	 where C_RATIONID=? ");
			   pst.setString(1, cobj.getCrationid());
			   
			   rs=pst.executeQuery();
			   
			   
		   }
		   catch(Exception e){
			   e.printStackTrace();
		   }
		
		return rs;
	}
	//-------------------------END o citizen check----------------
	 /**
    *
    * @author :KEVIN
    * @version:1.0
    * @param :object
    * @return :LIST
    * @purpose:View citizen details 
    * **/
	
	  public static ArrayList<CitizenBean> viewCustomerDetail(CitizenBean cobj)throws SQLException{
		   ArrayList<CitizenBean> clist=new ArrayList<CitizenBean>();
		   try{
	            
		        con=getDbConnection();
		        
		        pst=con.prepareStatement("select * from TB_CUSTOMER	 where C_ID=? ");
		        pst.setInt(1, cobj.getCid());
		       rs=pst.executeQuery();
		       while(rs.next()){
		        	CitizenBean cobjd=new CitizenBean();
		        	cobjd.setCusername(rs.getString(2));
		        	cobjd.setCaddress(rs.getString(4));
		        	cobjd.setCategory(rs.getString(8));
		        	cobjd.setCregion(rs.getString(5));
		        	clist.add(cobjd);
		        }
		       }
			   catch(Exception e){
				   e.printStackTrace();
			   }
			   return clist;
	  }
	//-------------------------END of citizen detail view----------------
		 /**
	    *
	    * @author :KEVIN
	    * @version:1.0
	    * @param :object
	    * @return :LIST
	    * @purpose:View purchase details 
	    * **/
		  public static ArrayList<CitizenBean> viewCustomerPurchaseHistory(CitizenBean cobj)throws SQLException{
			   ArrayList<CitizenBean> cHistorylist=new ArrayList<CitizenBean>();
			   try{
		            
			        con=getDbConnection();
			        
			        pst=con.prepareStatement("select * from TB_PURCHASE where P_CID=? ");
			        pst.setInt(1, cobj.getCid());
			       rs=pst.executeQuery();
			       while(rs.next()){
			        	CitizenBean cobjd=new CitizenBean();
			        	cobjd.setpDate(rs.getDate(3));
			        	cobjd.setpStatus(rs.getString(4));
			        	
			        	cHistorylist.add(cobjd);
			        }
			       }
				   catch(Exception e){
					   e.printStackTrace();
				   }
				   return cHistorylist;
		  }
		  //-----------------END of purchase details---------------
}

