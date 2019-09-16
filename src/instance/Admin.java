package instance;

import obj.User;

/**
 * @author ALEXWELL
 *
 */
public class Admin extends User {

	/**
	 * 
	 */
	public Admin(String acntNum, String password){
		super(acntNum, password, "Admin");
	}
	
	public Librarian registerLibrarian(String acntNum, String password){
		Librarian newLibrarian = new Librarian(acntNum, password);
		return newLibrarian;
	}

}
