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
	private String bookFineValue;
	private int bookReturnPeriod;
	private String readerSecurityDeposit;
	private static LibraryAutomation instance = new LibraryAutomation();
	
	private LibraryAutomation(){
		
	}
	
	public String getBookFineValue() {
		return bookFineValue;
	}
	public void setBookFineValue(String bookFineValue) {
		this.bookFineValue = bookFineValue;
	}
	public int getBookReturnPeriod() {
		return bookReturnPeriod;
	}
	public void setBookReturnPeriod(int bookReturnPeriod) {
		this.bookReturnPeriod = bookReturnPeriod;
	}
	public String getReaderSecurityDeposit() {
		return readerSecurityDeposit;
	}
	public void setReaderSecurityDeposit(String readerSecurityDeposit) {
		this.readerSecurityDeposit = readerSecurityDeposit;
	}
	public static LibraryAutomation getInstance() {
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
	
	public void addAnnouncement(String textId, String text){
		
	}
	
	public void editAnnouncement(String targetTextId, String changeText){
		
	}
	
	public void deleteAnnouncement(String targetTextId){
		
	}
	
	public void sendEmail(){
		
	}
	
	public void login(){
		
	}
	
	public void logout(){
		
	}

}
