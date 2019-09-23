package instance;

import obj.User;
import java.util.Date;
import java.util.Vector;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
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
	public void addBook(String bookId,String bookName,String press,String price,String position,String ISBN,String lentStatus,String reserveStatus,String category) 
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		 	String sql = "INSERT INTO book VALUES ("+"'"+bookId+"'"+","+"'"+bookName+"'"+","+"'"+press+"'"+","+"'"+price+"'"+","+"'"+position+"'"+","+"'"+ISBN+"'"+","+"'"+lentStatus+"'"+","+"'"+reserveStatus+"'"+","+"'"+category+"'"+")";//SQL语句
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, bookId);		
	        pstmt.setString(2, bookName);
	        pstmt.setString(3, press);
	        pstmt.setString(4, price);
	        pstmt.setString(5, position);
	        pstmt.setString(6, ISBN);
	        pstmt.setString(7, lentStatus);
	        pstmt.setString(8, reserveStatus);
	        pstmt.setString(9, category);
	        pstmt.executeUpdate();
	        System.out.println("success");
	}
	public void editBook(String bookId,String position)throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException {
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		 String sql = "update book set position="+position+"where bookId="+bookId;//SQL语句
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.executeUpdate();
	        System.out.println("success");
	}
	public void deleteBook(String bookId)throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException {
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		 String sql = "delete from book where bookId="+bookId;//SQL语句
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.executeUpdate();
	        System.out.println("success");
	        }
	public void  registerReader(String acntNum,String password,String email)  throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		 String sql = "INSERT INTO reader VALUES ("+"'"+acntNum+"'"+","+"'"+password+"'"+","+"'"+email+")";//SQL语句
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, acntNum);		
	        pstmt.setString(2, password);
	        pstmt.setString(3, email);
	        pstmt.executeUpdate();
	        System.out.println("success");
	}
	public void editReader(String acntNum,String password) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException {
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		 String sql = "update reader set password="+password+"where acntNum="+acntNum;//SQL语句
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.executeUpdate();
	        System.out.println("success");
	}
	public void deleteReader(String acntNum)throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException {
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		 String sql = "delete from reader where acntNum="+acntNum;//SQL语句
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.executeUpdate();
	        System.out.println("success");
	}
	public String viewBorrowRecords(String recordId) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException {
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		String sql = "select bookId bookName AcntNum from Book reader record where record.AcntNum=reader.AcntNum and "
				+ "record.BookName =Book.BookName and record.recordId="+recordId ;//SQL语句
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
        System.out.println("success");
        
		String borrowRecords= rs.getString("bookId");
		 borrowRecords+=rs.getString("bookName");
		 borrowRecords+=rs.getString("acntNum");
		return borrowRecords; 
	}
	public String viewFineRecords(String recordId) {
		String FineRecords= new String();
		
		return FineRecords;
	}
	public boolean lendBook(String acntNum,String bookId) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException {
		String str ="select status,reserve from book  where bookid = "+bookId;
		Connection conn = LibraryAutomation.getInstance().dbInterface();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(str);
		Boolean bo1=rs.getBoolean("status");
		Boolean bo2=rs.getBoolean("reserve");
		if(bo1==false&&bo2==false) 
		{
		   String sql = "UPDATE book SET status = "+1+" where bookid = "+bookId;//SQL语句
		   PreparedStatement pstmt = conn.prepareStatement(sql);
		   pstmt.executeUpdate();
           return true;
		}
		return false;
		
	}
	
	public void returnBook(String acntNum,String bookId) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException{
		   Connection conn = LibraryAutomation.getInstance().dbInterface();
		   String sql = "UPDATE book SET status ="+0+",reserve= "+0+" where bookid = "+bookId;//SQL语句
		   PreparedStatement pstmt = conn.prepareStatement(sql);
		   pstmt.executeUpdate();
           System.out.println("success");
	}
	
	public Vector<String> viewTotalDeposit(Date beginDate,Date endData) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException {
		//分条记录这段时间之内的所有信息
		Vector<String> totalDepositInf=new Vector<String>();
		String inf = new String();
		//记录这段时间之内的总金额
		int totalDeposit=0;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//显示2017-10-27格式
		Connection conn = LibraryAutomation.getInstance().dbInterface(); 
		//获得这两段时间之内的保证金记录
		String sql = "SELECT Deposit,registerDate,AcntNum FROM reader where date(registerDate) between"+beginDate+"and"+endData;//SQL语句
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) 
		{
			inf=sdf.format(rs.getDate("registerDate"))+'\r'+rs.getString("AcntNum")+'\r'+rs.getInt("Deposit");
			totalDepositInf.addElement(inf);
			totalDeposit+=rs.getInt("Deposit");
		}
		totalDepositInf.addElement("totalDeposit: "+totalDeposit);
		return totalDepositInf; 
	}
	public Vector<String> viewTotalFine(Date beginDate,Date endData) throws InstantiationException, IllegalAccessException, ClassNotFoundException, IOException, SQLException {
		Vector<String> totalFineInf= new Vector<String>();
		String inf = new String();
		//记录这段时间之内的总金额
		int totalFine=0;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//显示2017-10-27格式
		Connection conn = LibraryAutomation.getInstance().dbInterface(); 
		//获得这两段时间之内的保证金记录
		String sql = "SELECT fineDate,fineRecord,acntNum FROM record where date(fineDate) between"+beginDate+"and"+endData;//SQL语句
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			inf=sdf.format(rs.getDate("fineDate"))+'\r'+rs.getString("AcntNum")+'\r'+rs.getInt("fineRecord");
			totalFineInf.addElement(inf);
			totalFine+=rs.getInt("fineRecord");
		}
		totalFineInf.addElement("totalDeposit: "+totalFine);
		return totalFineInf;
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
