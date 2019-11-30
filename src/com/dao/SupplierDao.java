package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;

import com.bean.AdminBean;
import com.dao.AdminDao;

import com.bean.SupplierBean;

public class SupplierDao {

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
	 * @param :Connection             
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

	// ---------START------- supplier view user data -------------------------------
	/**
	 * @author : CHINDHUSHA
	 * @date : 29/10/2019
	 * @version: 1.0
	 * @purpose: view customers
	 * @param :
	 *            nothing
	 * @throws :Exception
	 *             in case of fetching users record
	 * @return : arraylist
	 */

	public static ArrayList<AdminBean> supplierViewCustomers(AdminBean admBean) throws SQLException {

		ArrayList<AdminBean> eb = new ArrayList<AdminBean>();
		try {

			con = getDbConnection();
			pst = con.prepareStatement(
					"select c_id,c_username,c_address,c_income,c_rationid,c_category from tb_customer join tb_supplier on s_region=c_region and s_id=?");
			pst.setInt(1, admBean.getSid());
			rs = pst.executeQuery();

			while (rs.next()) {
				AdminBean supBean = new AdminBean();
				// admBean.setUid(rs.getInt(1));
				supBean.setCid(rs.getInt("c_id"));
				supBean.setCusername(rs.getString("c_username"));
				supBean.setCaddress(rs.getString("c_address"));
				supBean.setCincome(rs.getInt("c_income"));
				supBean.setCrationid(rs.getString("c_rationid"));
				supBean.setCategory(rs.getString("c_category"));
				// admBean.setPassword(rs.getString(3));

				eb.add(supBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return eb;

	}
	// ---------END-------view users data----------------------------
	
	// ---------START------- supplier view user data -------------------------------
		/**
		 * @author : CHINDHUSHA
		 * @date : 29/10/2019
		 * @version: 1.0
		 * @purpose: view customers
		 * @param :
		 *            nothing
		 * @throws :Exception
		 *             in case of fetching users record
		 * @return : arraylist
		 */


	public static ArrayList<AdminBean> supplierViewPurchaseDetails(AdminBean admBean) throws SQLException {
		boolean f = false;
		ArrayList<AdminBean> eb = new ArrayList<AdminBean>();
		try {

			con = getDbConnection();

			pst = con.prepareStatement("select c_id,c_lastpdate,c_category from tb_customer where c_rationid=?");
			pst.setString(1, admBean.getCrationid());
			rs = pst.executeQuery();
			f = true;
			System.out.println(f);

			while (rs.next()) {
				AdminBean supBean = new AdminBean();

				supBean.setCid(rs.getInt("c_id"));
				supBean.setCategory(rs.getString("c_category"));
				supBean.setcLastPurchaseDate(rs.getDate("c_lastpdate"));

				eb.add(supBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return eb;

	}
	// ---------END-------view users data----------------------------
	
	// ---------START------- supplier view user data -------------------------------
		/**
		 * @author : CHINDHUSHA
		 * @date : 29/10/2019
		 * @version: 1.0
		 * @purpose: view customers
		 * @param :
		 *            nothing
		 * @throws :Exception
		 *             in case of fetching users record
		 * @return : arraylist
		 */



	
	
	// ---------START-------Allot Stock to customers by supplier----------------------------
	/**
	 * @author : CHINDHUSHA
	 * @date : 29/10/2019
	 * @version: 1.0
	 * @purpose: Allot Stock to customers
	 * @throws :Exception
	 *             in case of fetching users record
	 * @return : boolean
	 */

	public static boolean allotStockToCustomers(AdminBean addObj) throws SQLException {
		float riceApl = 0;
		float wheatApl = 0;
		float sugarApl = 0;
		float riceBpl = 0;
		float wheatBpl = 0;
		float sugarBpl = 0;
		float total = 0;
		float balance = 0;
		boolean i=false;
		boolean b=false;
		
		
		
		
		try {
			con = getDbConnection();
			//int days=Days.daysBetween(addObj.getcLastPurchaseDate(),addObj.getCurrentDate()).getDays();
			System.out.println(addObj.getSid());
			//if(b){
				pst = con.prepareStatement("select * from tb_stock where supplierid=?");
				pst.setInt(1, addObj.getSid());
				rs = pst.executeQuery();
				boolean f=true;
				if(f)
					System.out.println("jhgfdjmnbvc");

					while (rs.next()) {
				

							riceApl = rs.getFloat("st_ricea");
							wheatApl = rs.getFloat("st_wheata");
							sugarApl = rs.getFloat("st_sugara");
							riceBpl = rs.getFloat("st_riceb");
							wheatBpl = rs.getFloat("st_wheatb");
							sugarBpl = rs.getFloat("st_sugarb");
							total = rs.getFloat("st_total");
							balance = rs.getFloat("st_balance");

					}
					System.out.println(riceApl);
				
				if (addObj.getCategory().equals("APL")) {
					pst = con.prepareStatement(
						"update  TB_STOCK set ST_RICEA=?,ST_WHEATA=?,ST_SUGARA=?,ST_BALANCE=?  where SUPPLIERID=?  ");
					riceApl = riceApl - 25;
					System.out.println(riceApl);
					pst.setFloat(1, riceApl);

					wheatApl = wheatApl - 8;
					pst.setFloat(2, wheatApl);

					sugarApl = (float) (sugarApl - 2.5);
					pst.setFloat(3, sugarApl);

					// total=total-riceApl+wheatApl+sugarApl;
					// pst.setFloat(4, total);
					balance = balance - riceApl + wheatApl + sugarApl;
					pst.setFloat(4, balance);

					pst.setInt(5, addObj.getSid());
					pst.executeUpdate();
					i=true;
				
				}
				if (addObj.getCategory().equals("BPL")) {
					pst = con.prepareStatement(
						"update  TB_STOCK set ST_RICEB=?,ST_WHEATB=?,ST_SUGARB=?,ST_BALANCE=?  where SUPPLIERID=? ");

					riceBpl = (float) (riceBpl - 35.5);
					pst.setFloat(1, riceBpl);

					wheatBpl = (float) (wheatBpl - 11.5);
					pst.setFloat(2, wheatBpl);

					sugarApl = (float) (sugarBpl - 3.5);
					pst.setFloat(3, sugarBpl);

					// total=total-riceApl+wheatApl+sugarApl;
					// pst.setFloat(4, total);
					balance = balance - (riceBpl + wheatBpl + sugarBpl);
					pst.setFloat(4, balance);

					pst.setInt(5, addObj.getSid());
					pst.executeUpdate();
					i=true;
				}
				if(i){
					/*if(balance==0){
						pst = con.prepareStatement("delete * from TB_STOCK   where SUPPLIERID=? ");
						pst.setInt(1, addObj.getSid());
						pst.executeUpdate();
					}*/
					pst = con.prepareStatement(
							"update tb_customer set C_LASTPDATE=? where c_id=?");
					pst.setDate(1, (Date) addObj.getCurrentDate());
					pst.setInt(2, addObj.getCid());
					pst.executeUpdate();
					
					pst = con.prepareStatement(
							"insert into TB_PURCHASE(P_CID,P_DATE,P_STATUS) values (?,?,?) ");
					pst.setInt(1, addObj.getCid());
					pst.setDate(2, (java.sql.Date) addObj.getCurrentDate());
					pst.setString(3, "purchased");
					pst.executeUpdate();
					flag = true;
				}else{
					flag=false;
				}
		
	
			
		//}			
		}catch(Exception e){
			e.printStackTrace();
		}

		return flag;
	}

	// --------------START------supplier view stock list for them--------------

	/**
	 *
	 * 
	 * @author : MIJNA
	 * @date : 13/11/2019
	 * @version: 1.0
	 * @purpose: Supplier view stock
	 * @param :
	 *            Nothing
	 * 
	 * @return : Nothing
	 * 
	 */

	public static ArrayList<AdminBean> supplierViewStock(AdminBean admBean) throws SQLException {
		boolean f = false;
		ArrayList<AdminBean> ab = new ArrayList<AdminBean>();
		try {

			con = getDbConnection();
			pst = con.prepareStatement(
					"select st_ricea,st_wheata,st_sugara,st_riceb,st_wheatb,st_sugarb,st_total,st_date,st_balance,st_stocktype,st_month from tb_stock where supplierid=? ");
			pst.setInt(1, admBean.getSid());
			rs = pst.executeQuery();
			f = true;
			System.out.println(f);

			while (rs.next()) {

				AdminBean adminBean = new AdminBean();
				adminBean.setStriceA(rs.getFloat("st_ricea"));
				adminBean.setStwheatA(rs.getFloat("st_wheata"));
				adminBean.setStsugarA(rs.getFloat("st_sugara"));
				adminBean.setStriceB(rs.getFloat("st_riceb"));
				adminBean.setStwheatB(rs.getFloat("st_wheatb"));
				adminBean.setStsugarB(rs.getFloat("st_sugarb"));
				adminBean.setSttotal(rs.getFloat("st_total"));

				adminBean.setStDate(rs.getDate("st_date"));
				adminBean.setStbalance(rs.getFloat("st_balance"));
				adminBean.setSttype(rs.getString("st_stocktype"));
				adminBean.setStMonth(rs.getString("st_month"));
				ab.add(adminBean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ab;
	}

	// --------------END------supplier view stock list ------------------------

}
