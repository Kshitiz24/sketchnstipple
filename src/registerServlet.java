import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






import java.io.*;
import java.util.*;
public class registerServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public registerServlet() {
		super();
	}

	 
	   public void init( ){
		      // Get the file location where it would be stored.
		      //filePath = getServletContext().getInitParameter("file-upload"); 
		   }
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Connection con=null;
		try {
		con =getConnection.myConnection();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//fetching from web page
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		String user = "sketchnstipple@gmail.com";
		String password = "majorproject";
		String cName = name.substring(0, 1).toUpperCase()+ name.substring(1);
		String sub = cName + ", Thanks for Joining - Discover the Art World on S'n'S ";
		String msg = "Dear " + cName +",\n\nWelcome to the wonderful world of Art. We're excited to see you here!\n\n"
				+ "Your user ID is: " + email+", and \n"
						+ "Your Password is: " + pass+". \n\n"+"Hope you have a great time exploring the awesome world of Art."
								+ "\nFeel free to contact us in case of any issues on the website."
								+ "\n\nTeam Sketch'n'Stipple\n	Keep Arting!!";
		System.out.println(email);
		PreparedStatement ps = con.prepareStatement("select * from loginS where email=? ");
		ps.setString(1, email);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			System.out.println("in rs");
			out.println("Already regitered user");
			response.sendRedirect("index.jsp");
		}
		else
		{
			System.out.println("in else");
			
			ps = con.prepareStatement("insert into loginS values(?,?,?)");
			ps.setString(1, name);
			ps.setString(2,email);
			ps.setString(3, pass);
			ps.executeQuery();
			
			ps = con.prepareStatement("insert into profile values(?,?,?,?,?,?,?,?)");
			ps.setString(1, email);
			ps.setString(2, name);
			ps.setString(3, null);
			ps.setString(4, null);
			ps.setString(5, null);
			ps.setString(6, null);
			ps.setString(7, null);
			ps.setString(8, null);
			ps.executeQuery();
			
			out.println("Successfully registered!!!");
			SendMail.send(email, sub, msg, user, password);
			response.sendRedirect("welcome.jsp");
			
		}	
		}catch(Exception e){e.printStackTrace();}
		finally
		{
			
		 try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}
}