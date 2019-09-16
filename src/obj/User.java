
package obj;

/**
 * @author ALEXWELL
 *
 */
public class User {
	private String acntNum;
	private String password;
	private String type;
	
	public User(String acntNum, String password, String type){
		setAcntNum(acntNum);
		setPassword(password);
		setType(type);
	}
	
	public String getAcntNum() {
		return acntNum;
	}
	public void setAcntNum(String acntNum) {
		this.acntNum = acntNum;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
