

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


public class getConnection {
static String url,driver,user,paswd;
static Properties p = new Properties();
	static{
		try {
			/*ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
			InputStream input = classLoader.getResourceAsStream("/WEB-INF/lib/prop.properties");*/
			// ...
			//Properties p = new Properties();
			p.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("prop.properties"));
			
			
			/*p.load(new FileInputStream("d:\\prop.properties"));   // prop.txt also works*/
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		driver = p.getProperty("driver");
		url = p.getProperty("url");
		user = p.getProperty("user");
		paswd = p.getProperty("paswd");
	}
		public static Connection myConnection() throws ClassNotFoundException, SQLException
		{
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,user,paswd);
			return con;
		}
	
	/*public static void main(String[] args) {
		System.out.println(driver+url+user+paswd);
		

	}*/

}
