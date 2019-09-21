package instance;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import obj.*;
import tools.*;
/**
 * @author ALEXWELL
 *
 */
public class LibraryAutomation {
	private int bookFineValue = 1;
	private int bookReturnPeriod = 30;
	private int readerSecurityDeposit = 300;
	private static LibraryAutomation instance = new LibraryAutomation();
	
	private LibraryAutomation(){
		
	}
	
	
	public static LibraryAutomation getInstance() {
		if(instance == null){
				instance = new LibraryAutomation();
		}
		return instance;
	}
	
	
	public int getBookFineValue() {
		return bookFineValue;
	}


	public void setBookFineValue(int bookFineValue) {
		this.bookFineValue = bookFineValue;
	}


	public int getBookReturnPeriod() {
		return bookReturnPeriod;
	}


	public void setBookReturnPeriod(int bookReturnPeriod) {
		this.bookReturnPeriod = bookReturnPeriod;
	}


	public int getReaderSecurityDeposit() {
		return readerSecurityDeposit;
	}


	public void setReaderSecurityDeposit(int readerSecurityDeposit) {
		this.readerSecurityDeposit = readerSecurityDeposit;
	}



	
	public Connection dbInterface() throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		connDB myconn = connDB.getInstance();
		return myconn.getConnection();
	}
	

	
	public Book searchBook(String bookId){
		Book newBook = null;
		return newBook;
	}
	
	public void sendEmail(){
		
	}
	
	public boolean login(String acntNum, String password) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "SELECT count(*) num FROM librarian where AcntNum="+acntNum;//SQL语句
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			if(rs.getInt("num")==1) {
				sql = "SELECT password FROM librarian where AcntNum = "+acntNum;//SQL语句
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
	
	public void logout(){
		
	}

}
