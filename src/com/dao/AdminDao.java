package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.bean.AdminBean;
import com.bean.LoginBean;
import com.dao.LoginDao;

public class AdminDao {

	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;
	static int tempId = 0;

	// ---------START-------access connection----------------
	/**
	 * @author : CHINDHUSHA
	 * @date : 29/10/2019
	 * @version: 1.0
	 * @purpose: accessing connection
	 * @param :Connection
	 * @throws :Exception
	 *             in case of accessing connection
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

	// ---------START-------insert customers data ----------------------------
	/**
	 * @author : CHINDHUSHA
	 * @date : 11/12/2019
	 * @version: 1.0
	 * @purpose: inserting customers
	 * @param :
	 *            AdminBean class object
	 * @throws :Exception
	 *             in case of inserting data
	 * @return : Boolean value
	 */

	public static boolean addCustomers(AdminBean admBean) throws SQLException {
		String cat = null;

		boolean f = false;

		try {
			if (admBean.getCincome() > 15000) {
				cat = "APL";
				admBean.setCategory(cat);
			} else {
				cat = "BPL";
				admBean.setCategory(cat);
			}

			con = getDbConnection();
			pst = con.prepareStatement(
					"insert into tb_customer(c_username,c_password,c_address,c_region,c_income,c_category)values(?,?,?,?,?,?)");
			pst.setString(1, admBean.getCusername());
			pst.setString(2, admBean.getCpassword());
			pst.setString(3, admBean.getCaddress());
			pst.setString(4, admBean.getCregion());
			pst.setInt(5, admBean.getCincome());

			pst.setString(6, admBean.getCategory());
			pst.executeUpdate();
			f = true;
			System.out.println(f);

			if (f) {
				pst = con.prepareStatement("select c_id from tb_customer where c_username=? and c_password=? ");
				pst.setString(1, admBean.getCusername());
				pst.setString(2, admBean.getCpassword());

				rs = pst.executeQuery();

				while (rs.next()) {
					tempId = rs.getInt("c_id");
				}

				String tempRationNo = "KER000";
				String tempName = (admBean.getCusername()).substring(0, 2);
				tempName = tempName.concat(String.valueOf(tempId));
				tempRationNo = tempRationNo.concat(tempName);

				pst = con.prepareStatement("update tb_customer set c_rationid=? where c_id=?");
				pst.setString(1, tempRationNo);
				pst.setInt(2, tempId);
				pst.executeUpdate();

				pst = con
						.prepareStatement("insert into tb_login(l_username,l_password,l_role,l_userid)values(?,?,?,?)");
				pst.setString(1, admBean.getCusername());
				pst.setString(2, admBean.getCpassword());
				pst.setString(3, "user");
				pst.setInt(4, tempId);
				pst.executeUpdate();
				flag = true;
			} else {

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	// ---------END-------insert customers data---------------------------------

	// ---------START-------view table data----------------------------
	/**
	 * @author : CHINDHUSHA
	 * @date : 29/10/2019
	 * @version: 1.0
	 * @purpose: display table data
	 * @param :
	 *            Nothing
	 * @throws :Exception
	 *             in case of displaying data
	 * @return : Arraylist containing table data
	 */

	public static ArrayList<AdminBean> viewCustomerDetails() throws SQLException {

		ArrayList<AdminBean> eb = new ArrayList<AdminBean>();
		try {

			con = getDbConnection();
			pst = con.prepareStatement("select * from tb_customer");
			rs = pst.executeQuery();
			while (rs.next()) {
				AdminBean admBean = new AdminBean();
				admBean.setCid(rs.getInt(1));
				admBean.setCusername(rs.getString(2));
				admBean.setCpassword(rs.getString(3));
				admBean.setCaddress(rs.getString(4));
				admBean.setCregion(rs.getString(5));
				admBean.setCincome(rs.getInt(6));
				admBean.setCrationid(rs.getString(7));
				admBean.setCategory(rs.getString(8));
				eb.add(admBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return eb;

	}
	// ---------END-------view table data----------------------------

	// ---------START-------delete user record----------------------------
	/**
	 * @author : CHINDHUSHA
	 * @date : 29/10/2019
	 * @version: 1.0
	 * @purpose: delete record
	 * @param :
	 *            EnquiryBean class object
	 * @throws :Exception
	 *             in case of deleting data
	 * @return : Boolean value
	 */

	public static boolean deleteCustomerDetails(AdminBean admBean) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("delete tb_customer where c_id=?");

			pst.setInt(1, admBean.getCid());

			pst.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}
	// --------END--------delete user record--------------------

	// ---------START-------update user record----------------------------
	/**
	 * @author : CHINDHUSHA
	 * @date : 29/10/2019
	 * @version: 1.0
	 * @purpose: update user record
	 * @param :
	 *            EnquiryBean class object
	 * @throws :Exception
	 *             in case of updating data
	 * @return : Boolean value
	 */

	public static boolean updateCustomerDetails(AdminBean admBean) throws SQLException {
		String cat = null;
		try {
			if (admBean.getCincome() > 15000) {
				cat = "APL";
				admBean.setCategory(cat);
			} else {
				cat = "BPL";
				admBean.setCategory(cat);
			}
			con = getDbConnection();
			pst = con.prepareStatement(
					"update tb_customer set c_username=?,c_address=?,c_region=?,c_income=?,c_category=? where c_id=?");
			pst.setString(1, admBean.getCusername());
			pst.setString(2, admBean.getCaddress());
			pst.setString(3, admBean.getCregion());
			pst.setInt(4, admBean.getCincome());
			pst.setString(5, admBean.getCategory());
			pst.setInt(6, admBean.getCid());

			pst.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	// ---------------END----------update user
	// record----------------------------

	// --------------START------Supplier insert operation--------------
	/**
	 *
	 * @author : NEERAJA R
	 * @date : 13/101/2019
	 * @version: 1.0
	 * @purpose: Supplier insert operation
	 * @param :
	 *            Nothing
	 * 
	 * @return : Nothing
	 * 
	 */
	public static boolean insertSuppliers(AdminBean adminBean) throws SQLException {
		boolean f = true;
		boolean b = false;
		int uid = 0;
		try {

			con = getDbConnection();
			pst = con.prepareStatement("select * from tb_supplier where s_region=?");
			pst.setString(1, adminBean.getSregion());
			rs = pst.executeQuery();
			String region = adminBean.getSregion();
			System.out.println("form Region......"+region);
			if(rs.next()== true) {
				// nregion = rs.getString("s_region");

				//if (nregion.equals(region)) {
					f = false;
				/*} else {
					f = true;
				}*/
			}

			if (f) {
				pst = con.prepareStatement(
						"insert into tb_supplier(s_username,s_password,s_region,s_email)values(?,?,?,?)");
				pst.setString(1, adminBean.getSusername());
				pst.setString(2, adminBean.getSpassword());
				pst.setString(3, adminBean.getSregion());
				pst.setString(4, adminBean.getSemail());
				// pst.setString(5, adminBean.getSsid());
				pst.executeUpdate();

				b = true;
				System.out.println(b);

				if (b) {
					pst = con.prepareStatement("select s_id from tb_supplier where s_region=?  ");
					pst.setString(1, adminBean.getSregion());
					rs = pst.executeQuery();

					while (rs.next()) {
						tempId = rs.getInt("s_id");
					}

					String tempShopNo = "KER000";
					String tempName = (adminBean.getSregion()).substring(0, 3);
					tempName = tempName.concat(String.valueOf(tempId));
					tempShopNo = tempShopNo.concat(tempName);

					pst = con.prepareStatement("update tb_supplier set s_sid=? where s_id=?");
					pst.setString(1, tempShopNo);
					pst.setInt(2, tempId);
					pst.executeUpdate();

					pst = con.prepareStatement(
							"insert into tb_login(l_username,l_password,l_role,l_userid)values(?,?,?,?)");
					pst.setString(1, adminBean.getSusername());
					pst.setString(2, adminBean.getSpassword());
					pst.setString(3, "supplier");
					pst.setInt(4, tempId);
					pst.executeUpdate();
					flag = true;
				} else {

				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	}

	// --------------END------supplier insert operation---------- //------------

	// --------------START------supplier update operation--------------

	/**
	 *
	 * 
	 * @author : NEERAJA R
	 * @date : 13/11/2019
	 * @version: 1.0
	 * @purpose: Supplier update operation
	 * @param :Nothing
	 * 
	 * @return : Nothing
	 * 
	 */

	public static boolean updateSupplier(AdminBean adminBean) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("update tb_supplier set s_username=?,s_email=? where s_id=?");
			pst.setString(1, adminBean.getSusername());
			pst.setString(2, adminBean.getSemail());
			pst.setInt(3, adminBean.getSid());

			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;

	} // --------------END------supplier update operation----------
		// //------------

	// --------------START------supplier delete operation--------------

	/**
	 *
	 * 
	 * @author : NEERAJA R
	 * 
	 * @date : 13/11/2019
	 * 
	 * @version: 1.0
	 * 
	 * @purpose:Supplier Delete operation
	 * 
	 * @param :Nothing
	
	 * @return : boolean
	 * 
	 */

	public static boolean deleteSupplier(AdminBean adminBean) throws SQLException {

		try {

			con = getDbConnection();
			pst = con.prepareStatement("delete from tb_supplier where s_id=?");

			pst.setInt(1, adminBean.getSid());
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// --------------END------supplier delete operation---------- //------------

	// --------------START------supplier view operation--------------

	/**
	 *
	 * 
	 * @author : NEERAJA
	 * @date : 13/11/2019
	 * @version: 1.0
	 * @purpose: Supplier View operation
	 * @param : Nothing	 
	 * @return : List
	 * 
	 */

	public static ArrayList<AdminBean> viewSuppliers() throws SQLException {

		ArrayList<AdminBean> ab = new ArrayList<AdminBean>();
		try {

			con = getDbConnection();
			pst = con.prepareStatement("select * from tb_supplier");
			rs = pst.executeQuery();
			while (rs.next()) {
				AdminBean adminBean = new AdminBean();
				adminBean.setSid(rs.getInt(1));
				adminBean.setSusername(rs.getString(2));
				adminBean.setSregion(rs.getString(4));
				adminBean.setSemail(rs.getString(5));
				adminBean.setSsid(rs.getString(6));
				ab.add(adminBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ab;
	}

	// --------------END------supplier view operation---------- //------------
	/**
	 *
	 * 
	 * @author : KEVIN
	 * @date : 13/11/2019
	 * @version: 1.0
	 * @purpose: Supplier View operation
	 * @param :   Nothing
	 * @return : LIST
	 * 
	 */

	public static ArrayList<AdminBean> supplierSelect() throws SQLException {
		ArrayList<AdminBean> adSelect = new ArrayList<AdminBean>();
		try {

			con = getDbConnection();
			pst = con.prepareStatement("select * from tb_supplier");

			rs = pst.executeQuery();
			while (rs.next()) {
				AdminBean adSel = new AdminBean();
				adSel.setSusername(rs.getString(2));
				adSel.setSid(rs.getInt(1));
				adSel.setSregion(rs.getString(4));
				adSel.setSsid(rs.getString(6));
				adSelect.add(adSel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return adSelect;
	}
	// --------------END------select supplier operation---------- //------------
		/**
		 *
		 * 
		 * @author : KEVIN
		 * @date : 13/11/2019
		 * @version: 1.0
		 * @purpose: Supplier select
		 * @param :   Nothing
		 * @return : LIST
		 * 
		 */


	public static ArrayList<AdminBean> selectView(AdminBean adm) throws SQLException {
		ArrayList<AdminBean> selectView = new ArrayList<AdminBean>();
		try {

			con = getDbConnection();

			pst = con.prepareStatement("select * from tb_supplier where S_SID=? ");
			pst.setString(1, adm.getSsid());
			rs = pst.executeQuery();
			while (rs.next()) {
				AdminBean adSel = new AdminBean();
				adSel.setSusername(rs.getString(2));
				adSel.setSid(rs.getInt(1));
				adSel.setSregion(rs.getString(4));
				adSel.setSsid(rs.getString(6));
				adSel.setSemail(rs.getString(5));
				selectView.add(adSel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectView;
	}
	// --------------END------select supplier operation---------- //------------
			/**
			 *
			 * 
			 * @author : KEVIN
			 * @date : 13/11/2019
			 * @version: 1.0
			 * @purpose: getcount
			 * @param :   Admin Object
			 * @return : INT
			 * 
			 */
	public static int getAplCount(AdminBean addStock) throws SQLException {
		int countApl = 0;

		try {
			con = getDbConnection();
			pst = con.prepareStatement("select count(*) from tb_customer where c_region=? and c_category='APL' ");
			pst.setString(1, addStock.getSregion());
			rs = pst.executeQuery();
			while (rs.next()) {
				countApl = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countApl;
	}
	// --------------END------count---------- //------------
				/**
				 *
				 * 
				 * @author : KEVIN
				 * @date : 13/11/2019
				 * @version: 1.0
				 * @purpose: getcount
				 * @param :   Admin Object
				 * @return : INT
				 * 
				 */
	public static int getBplCount(AdminBean cBpl) throws SQLException {
		int countBpl = 0;
		try {
			con = getDbConnection();
			pst = con.prepareStatement("select count(*) from tb_customer where c_region=? and c_category='BPL' ");
			pst.setString(1, cBpl.getSregion());
			rs = pst.executeQuery();
			while (rs.next()) {
				countBpl = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return countBpl;

	}
	
	// --------------END------count---------- //------------
				/**
				 *
				 * 
				 * @author : KEVIN
				 * @date : 13/11/2019
				 * @version: 1.0
				 * @purpose: add  Stock
				 * @param :   Admin Object
				 * @return : boolean
				 * 
				 */
	public static boolean addStock(AdminBean addObj) throws SQLException {
		try {
			con = getDbConnection();
			pst = con.prepareStatement(
					"insert into TB_STOCK(ST_REGION,ST_RICEA,ST_WHEATA,ST_SUGARA,ST_RICEB,ST_WHEATB,ST_SUGARB,ST_TOTAL,SUPPLIERID,ST_DATE,ST_BALANCE,ST_STOCKTYPE,ST_MONTH) values (?,?,?,?,?,?,?,?,?,?,?,?,?) ");
			pst.setString(1, addObj.getStregion());
			pst.setFloat(2, addObj.getStriceA());
			pst.setFloat(3, addObj.getStwheatA());
			pst.setFloat(4, addObj.getStsugarA());
			pst.setFloat(5, addObj.getStriceB());
			pst.setFloat(6, addObj.getStwheatB());
			pst.setFloat(7, addObj.getStsugarB());
			pst.setFloat(8, addObj.getSttotal());
			pst.setInt(9, addObj.getSid());
			pst.setDate(10, (java.sql.Date) addObj.getStDate());
			pst.setFloat(11, addObj.getSttotal());
			pst.setString(12, addObj.getSttype());

			pst.setString(13, addObj.getStMonth());
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	// --------------END------count---------- //------------
	/**
	 *
	 * 
	 * @author : KEVIN
	 * @date : 13/11/2019
	 * @version: 1.0
	 * @purpose: select stock
	 * @param :   Admin Object
	 * @return :LIST
	 * 
	 */
	public static ArrayList<AdminBean> stockReport(AdminBean adobj)throws SQLException{
	ArrayList<AdminBean> lst=new ArrayList<AdminBean>();
	try{
		con = getDbConnection();
		pst = con.prepareStatement("select * from tb_stock where st_region=?");
		pst.setString(1, adobj.getSregion());
		rs = pst.executeQuery();
		while (rs.next()){
			AdminBean stobj=new AdminBean();
			stobj.setStregion(rs.getString(2));
			stobj.setStMonth(rs.getString(14));
			stobj.setSttype(rs.getString(13));
			stobj.setStbalance(rs.getFloat(12));
			stobj.setSttotal(rs.getFloat(9));
			stobj.setStriceA(rs.getFloat(3));
			stobj.setStriceB(rs.getFloat(6));
			stobj.setStwheatA(rs.getFloat(4));
			stobj.setStwheatB(rs.getFloat(7));
			stobj.setStwheatB(rs.getFloat(8));
			stobj.setStsugarA(rs.getFloat(5));
			lst.add(stobj);
		}
		
	}catch(Exception e){
		e.printStackTrace();
		
	}
	return lst;	
	}
	//---------------------END VIEW_----______------------

}
