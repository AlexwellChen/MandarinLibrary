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
	
	public Librarian searchLibrarian(String acntNum){
		Librarian newLibrarian = null;
		//here to realize the function
		return newLibrarian;
	}
	
	public Librarian editLibrarianPassword(String acntNum, String newPassword){
		Librarian newLibrarian = null;
		newLibrarian = searchLibrarian(acntNum);
		newLibrarian.setPassword(newPassword);
		return newLibrarian;
	}
	
	public void deleteLibrarian(String acntNum){
		
	}
	
	public void recoveryLibrarian(String acntNum){
		
	}

	@Override
	public String toString() {
		return "Admin [getAcntNum()=" + getAcntNum() + ", getPassword()=" + getPassword() + ", getType()=" + getType()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
