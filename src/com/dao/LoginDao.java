package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.bean.LoginBean;


public class LoginDao {
	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// ---------START-------access connection----------------
	/**
	 * @author : CHINDHUSHA
	 * @date : 14/11/2019
	 * @version: 1.0
	 * @purpose: accessing connection
	 * @param  :  Connection
	 * @throws :Exception in case of accessing connection
	 * @return : Nothing
	 */

	public static Connection getDbConnection() throws SQLException {

		try {
			DBDAO.connect();
			con = DBDAO.getDbCon();

		} catch (ClassNotFoundException ex) {
			ex.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	// ------------------END----------Access connection-----------------
	
	//---------START------Checking login details----------------------------
	  /**
	  @author : CHINDHUSHA 
		 * @date   :  15/11/2019
		 * @version: 1.0
		 * @purpose: checking login details
		 * @param  : LoginBean class object containing sign in credentials
		 * @throws :Exception in case of retrieving data
		 * @return : String value
	  */ 
	  
	  
	  
	  public static String logCheck(LoginBean logBean) throws SQLException{
		  
		  String na=null;
		  String role=null;
	      try{
	         
	          con=getDbConnection();
	      pst=con.prepareStatement("select * from  tb_login where l_username=? and l_password=?");
	      pst.setString(1, logBean.getlUserName());
	      pst.setString(2, logBean.getlPassword());
	      rs= pst.executeQuery();
	    /* if(!rs.next()){
	    	role =null;
	     }else{*/
	      while(rs.next()){
	    	  role=rs.getString("l_role");
	    	  na=rs.getString("l_username");
	    	 // session.setAttribute("uname",na);
	      }
	     //}   
	      
	  } catch(Exception e){
	      e.printStackTrace();
	  }
	  return role;
	      
	}
	//---------END-------Checking login details---------------------------------
	 
	//---------START-------fetch username----------------------------
	  /**
	  @author : CHINDHUSHA 
		 * @date   :  29/10/2019
		 * @version: 1.0
		 * @purpose: fetch user name
		 * @param  : EnquiryBean class object
		 * @throws :Exception in case of inserting data
		 * @return :int
	  */ 
	  
	 public static int userNameFetch(LoginBean logBean) throws SQLException{
		  
		  int na=0;
	      try{
	         
	          con=getDbConnection();
	      pst=con.prepareStatement("select * from  tb_login where l_username=? and l_password=?");
	      pst.setString(1, logBean.getlUserName());
	      pst.setString(2, logBean.getlPassword());
	      
	     rs= pst.executeQuery();
	      flag=true;
	      if(flag){
	      while(rs.next()){
	    	  
	    	  na=rs.getInt("l_userid");
	   	  
	      }
	      }
	      
	  } catch(Exception e){
	      e.printStackTrace();
	  }
	  return na;
	      
	}
	  
	//---------END-------fetch username----------------------------


}
