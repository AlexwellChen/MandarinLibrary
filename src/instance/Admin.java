package instance;

import obj.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author ALEXWELL
 * Admin类，用来实现超管的各项功能
 */
public class Admin extends User {

	public Admin(String acntNum, String password){
		super(acntNum, password, "Admin");
	}
	//注册Librarian账号
	public static void registerLibrarian(String acntNum, String password) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();      
        String sql = "INSERT INTO librarian (AcntNum,Password)"+"VALUES (?,?)";//SQL语句
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, acntNum);		
        pstmt.setString(2, password);			
        pstmt.executeUpdate();
        System.out.println("success");

	}
	//查询Librarian账号以及密码
	public Librarian searchLibrarian(String acntNum) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{		
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "SELECT password FROM librarian where AcntNum = '"+acntNum+"'";//SQL语句
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
        String password = rs.getString("Password");
        Librarian newLibrarian = new Librarian(acntNum, password);
		return newLibrarian;
	}
	//更改给定librarian的密码
	public static void editLibrarianPassword(String acntNum, String newPassword) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "UPDATE librarian SET Password = '"+newPassword+"'"+" where AcntNum = '"+acntNum+"'";//SQL语句
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
        System.out.println("success");
	}
	//删除给定账号的Librarian账号
	public static void deleteLibrarian(String acntNum) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "DELETE from librarian where AcntNum = '"+acntNum+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		pstmt.executeUpdate();
        System.out.println("success");		
	}
	
	public void recoveryLibrarian(String acntNum){
		//don't understand this function XD
				
	}
	//更改罚款金额
	public void setFineValue(int fineValue){
		LibraryAutomation.getInstance().setBookFineValue(fineValue);
	}
	//更改归还日期
	public void setReturnPeriod(int newPeriod){
		LibraryAutomation.getInstance().setBookReturnPeriod(newPeriod);
	}
	//更改押金金额
	public void setSecurityDeposit(int newDeposit){
		LibraryAutomation.getInstance().setReaderSecurityDeposit(newDeposit);
	}
	@Override
	public String toString() {
		return "Admin [getAcntNum()=" + getAcntNum() + ", getPassword()=" + getPassword() + ", getType()=" + getType()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	//登录
	public static boolean login(String acntNum, String password) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "SELECT count(*) num FROM admin where AcntNum = '"+acntNum+"'";//SQL语句
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			if(rs.getInt("num")==1) {
				sql = "SELECT password FROM admin where AcntNum = '"+acntNum+"'";//SQL语句
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					if(rs.getString("Password").equals(password)) {
						return true;
					}
				}
			}
		}
		return false;
	}
	
	//驱动测试类
	public static void main(String[] args) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		//测试数据 账号admin 密码cfz990221
	/*	if(login("admin","cfz990221"))
		{
			System.out.println("Success");
		}
		else
			System.out.println("Fail");
		登录测试通过
	*/
		//Librarian测试 账号librarianTest 密码test
		
		//registerLibrarian测试 (通过)
		//Admin.registerLibrarian("librarianTest", "test");
		
		//editLibrarianPassword测试 (通过)
		//Admin.editLibrarianPassword("librarianTest", "newTest");
		
		//deleteLibrarian测试 (通过)
		//Admin.deleteLibrarian("librarianTest");
		
	}
}