package instance;

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

	
}
