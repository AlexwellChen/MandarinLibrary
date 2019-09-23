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
	private int bookFineValue = 1;//Defaut
	private int bookReturnPeriod = 30;//Defaut
	private int readerSecurityDeposit = 300;//Defaut
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
	
	public void logout(){
		//use session and close Database connection
	}

}
