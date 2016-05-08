

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class bidServlet
 */
@WebServlet("/bidServlet")
public class bidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bidServlet() {
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
			Statement st=con.createStatement();
			
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String image= request.getParameter("image");
		String amount = request.getParameter("amount");
		String cur = request.getParameter("current");
		ResultSet rs ;
		PreparedStatement ps;
		int amt = Integer.parseInt(amount);
		int current =Integer.parseInt(cur);
		System.out.println(email);
		System.out.println(image);
		System.out.println(amount);
		System.out.println(current);
		if(amt>current)
		{
			rs = st.executeQuery("select * from bidvalue where email='"+email+"' and image='"+image+"'");
			if(rs.next())
			{
				ps = con.prepareStatement("update bidvalue set bid =? where email='"+email+"' and image='"+image+"'");
				ps.setInt(1, amt);
				ps.executeQuery();
				response.sendRedirect("bids.jsp?image="+image);
			}
			else
			{
				ps = con.prepareStatement("insert into bidvalue values(?,?,?)");
				ps.setString(1,image);
				ps.setString(2,email);
				ps.setInt(3,amt);
				ps.executeQuery();
				response.sendRedirect("bids.jsp?image="+image);
				
			}
		}
		else
			response.sendRedirect("bide.jsp?image="+image);
		 
		
		}catch(Exception e){e.printStackTrace();}
		finally
		{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
