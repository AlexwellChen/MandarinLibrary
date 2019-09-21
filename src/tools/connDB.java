/*
 * 连接数据库使用单例模式确保连接安全
 * @function getConnection可以返回一个与数据库连接的Connection
 */
package tools;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.PropertyResourceBundle;
 
import com.mysql.jdbc.*;

public class connDB {
	private static connDB instance = new connDB();
	//单例模式的实现
	private connDB(){
		
	}
	
	public static connDB getInstance(){
		if(instance == null){
			synchronized (connDB.class){
				if(instance == null){
					instance = new connDB();
				}
			}
		}
		return instance;
	}
	
	public static Connection connection;
	public static PreparedStatement pstmt;
	public static ResultSet resultSet;
	public Statement stmt;
	public Connection getConnection() throws IOException, InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		
        InputStream in=getClass().getClassLoader().getResourceAsStream("tools/sql.properties");
        String jdbcDriver = null;//数据库驱动  
        String jdbcUrl=null;//数据库连接
        String jdbcName=null;//数据库名
        String USERNAME=null;//数据库用户名
        String PASSWORD=null;//数据库密码
        Properties properties=new Properties();
        properties.load(in);
        //↓从sql.properties文件中读取信息
        jdbcDriver=properties.getProperty("DRIVER");
        jdbcUrl=properties.getProperty("URL");
        jdbcName=properties.getProperty("DBNAME");
        USERNAME=properties.getProperty("USERNAME");
        PASSWORD=properties.getProperty("PASSWORD");
        
        Class.forName(jdbcDriver);
        
        connection  = DriverManager.getConnection(jdbcUrl+jdbcName, USERNAME, PASSWORD);
        return connection;
	}	
}