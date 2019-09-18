/*
 * �������ݿ�ʹ�õ���ģʽȷ�����Ӱ�ȫ
 * @function getConnection���Է���һ�������ݿ����ӵ�Connection
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
	//����ģʽ��ʵ��
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
        String jdbcDriver = null;//���ݿ�����  
        String jdbcUrl=null;//���ݿ�����
        String jdbcName=null;//���ݿ���
        String USERNAME=null;//���ݿ��û���
        String PASSWORD=null;//���ݿ�����
        Properties properties=new Properties();
        properties.load(in);
        //����sql.properties�ļ��ж�ȡ��Ϣ
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
