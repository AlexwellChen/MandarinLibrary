package instance;

import obj.User;

/**
 * @author ALEXWELL
 *
 */
public class Reader extends User {
	/**
	 * 
	 */
	private String email;
	private int bookNumber = 0;
	public Reader(String acntNum, String password, String email) {
		// TODO Auto-generated constructor stub
		super(acntNum, password, "Reader");
		setEmail(email);
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getBookNumber() {
		return bookNumber;
	}
	public void setBookNumber(int bookNumber) {
		this.bookNumber = bookNumber;
	}

}
