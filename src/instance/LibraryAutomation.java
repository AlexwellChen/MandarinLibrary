package instance;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

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


	public static LibraryAutomation getInstance() {
		if(instance == null){
				instance = new LibraryAutomation();
		}
		return instance;
	}
	
	public Connection dbInterface() throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		connDB myconn = connDB.getInstance();
		return myconn.getConnection();
	}
	
	public void addBook(){
		
	}
	
	public Book searchBook(String bookId){
		Book newBook = null;
		return newBook;
	}
	
	public void sendEmail(){
		
	}
	
	public void login(){
		
	}
	
	public void logout(){
		
	}

}
