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
	
	public void registerLibrarian(String acntNum, String password) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();      
        String sql = "INSERT INTO librarian "+"VALUES (?,?)";//SQL语句
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, acntNum);		
        pstmt.setString(2, password);			
        pstmt.executeUpdate();
        System.out.println("success");

	}
	//查询Librarian账号以及密码
	public Librarian searchLibrarian(String acntNum) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{		
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "SELECT password FROM librarian where AcntNum = "+acntNum;//SQL语句
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
        String password = rs.getString("Password");
        Librarian newLibrarian = new Librarian(acntNum, password);
		return newLibrarian;
	}
	//更改给定librarian的密码
	public void editLibrarianPassword(String acntNum, String newPassword) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "UPDATE librarian SET Password = "+newPassword+" where AcntNum = "+acntNum;//SQL语句
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
        System.out.println("success");
	}
	//删除给定账号的Librarian账号
	public void deleteLibrarian(String acntNum) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "DELETE from librarian where acntNum = "+acntNum;
		PreparedStatement pstmt = conn.prepareStatement(sql);
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
	//驱动测试类
	public static void main(String[] args){
		
	}
}
