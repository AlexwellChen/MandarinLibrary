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
 * Admin�࣬����ʵ�ֳ��ܵĸ����
 */
public class Admin extends User {

	public Admin(String acntNum, String password){
		super(acntNum, password, "Admin");
	}
	
	public void registerLibrarian(String acntNum, String password) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();      
        String sql = "INSERT INTO librarian "+"VALUES (?,?)";//SQL���
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, acntNum);		
        pstmt.setString(2, password);			
        pstmt.executeUpdate();
        System.out.println("success");

	}
	//��ѯLibrarian�˺��Լ�����
	public Librarian searchLibrarian(String acntNum) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{		
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "SELECT password FROM librarian where AcntNum = "+acntNum;//SQL���
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
        String password = rs.getString("Password");
        Librarian newLibrarian = new Librarian(acntNum, password);
		return newLibrarian;
	}
	//���ĸ���librarian������
	public void editLibrarianPassword(String acntNum, String newPassword) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "UPDATE librarian SET Password = "+newPassword+" where AcntNum = "+acntNum;//SQL���
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate();
        System.out.println("success");
	}
	//ɾ�������˺ŵ�Librarian�˺�
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
	//���ķ�����
	public void setFineValue(int fineValue){
		LibraryAutomation.getInstance().setBookFineValue(fineValue);
	}
	//���Ĺ黹����
	public void setReturnPeriod(int newPeriod){
		LibraryAutomation.getInstance().setBookReturnPeriod(newPeriod);
	}
	//����Ѻ����
	public void setSecurityDeposit(int newDeposit){
		LibraryAutomation.getInstance().setReaderSecurityDeposit(newDeposit);
	}
	@Override
	public String toString() {
		return "Admin [getAcntNum()=" + getAcntNum() + ", getPassword()=" + getPassword() + ", getType()=" + getType()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	//����������
	public static void main(String[] args){
		
	}
}
