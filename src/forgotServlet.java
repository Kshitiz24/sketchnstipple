

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class forgotServlet
 */
@WebServlet("/forgotServlet")
public class forgotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public forgotServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String password;
		Connection con = null;
		try {
			 con =getConnection.myConnection();
			
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email");
		String sub = "Password recovery Sketch'n'Stipple";
		
				
		
		PreparedStatement ps = con.prepareStatement("select * from loginS where email=?");
		ps.setString(1, email);
		
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			password = rs.getString("pass");
			String msg = "Dear user, \n"
					+ "Your password is: " + password +" \n"
							+ "Kindly keep your password safe."
							+ "\n\n"
							+ "Warm Regards,\n"
							+ "Team Sketch'n'Stipple"
							+ "\nKeep Sketching!!";
			System.out.println(password);
			String user = "sketchnstipple@gmail.com";
			String pass = "majorproject";
			SendMail.send(email, sub, msg, user, pass);
			response.sendRedirect("forgotSuccess.jsp");

			
		}
		else
		{
			response.sendRedirect("forgotError.jsp");

		}
		}catch(Exception e)
			{e.printStackTrace();}
		finally{
		   try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  }
	}

}
