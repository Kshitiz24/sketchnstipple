

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		try {
			con =getConnection.myConnection();
			
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session; 
		String name;
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		System.out.println("login servlet "+email + "   "+ pass);
		PreparedStatement ps = con.prepareStatement("select * from loginS where email=? and pass=?");
		ps.setString(1, email);
		ps.setString(2, pass);
		System.out.println("in db");
		ResultSet rs = ps.executeQuery();
		/**----
		  
		 * ---
		 */
		if(rs.next())
		{
			System.out.println("in rs");
			name = rs.getString("name");
			session = request.getSession(true);
			session.setAttribute("user", name);
			session.setAttribute("email", email);
			response.sendRedirect("welcome.jsp");
			
		}
		else
		{
			System.out.println("in else");
			response.sendRedirect("Error.jsp");
			
			
		}
			
		
		}catch(Exception e){e.printStackTrace();}
		/*finally
		{
			try {
				con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/
		
	}

}
