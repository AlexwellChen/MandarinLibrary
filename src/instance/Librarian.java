package instance;

import obj.User;

/**
 * @author ALEXWELL
 *
 */
public class Librarian extends User {

	/**
	 * 
	 */
	public Librarian(String acntNum, String password) {
		// TODO Auto-generated constructor stub
		super(acntNum, password, "Librarian");
	}
	public void addBook(String bookId) {
		//add Book
	}
	public void editBook(String bookId,String title,String content) {
		//edit Book's information
	}
	public void deleteBook(String bookId) {
		//delete Book
	}
	public void registerReader(String acntNum,String title,String content) {
		
	}
	public void editReader(String acntNum) {
		
	}
	public void deleteReader(String acntNum) {
		
	}
	public String viewBorrowRecords(String recordId) {
		String borrowRecords= new String();
		
		return borrowRecords; 
	}
	public String viewFineRecords(String recordId) {
		String FineRecords= new String();
		
		return FineRecords;
	}
	public void lendBook(String acntNum,String bookId) {
		
	}
	public void returBook(String acntNum,String bookId) {
		
	}
	public String viewTotalDeposit(String beginDate,String endData) {
		String totalDeposit= new String();
		
		return totalDeposit; 
	}
	public String viewTotalFine(String recordId) {
		String totalFine= new String();
		
		return totalFine;
	}
	public void editRecord(String recordId,String title,String content) {
		
	}
	
	public void addAnnouncement(String textId, String text){
		
	}
	
	public void editAnnouncement(String targetTextId, String changeText){
		
	}
	
	public void deleteAnnouncement(String targetTextId){
		
	}
	@Override
	public String toString() {
		return "Librarian [toString()=" + super.toString() + "]";
	}

}
