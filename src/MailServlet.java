

import java.io.IOException;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

/**
 * Servlet implementation class MailServlet
 */
@WebServlet("/MailServlet")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String to = request.getParameter("email");
		String name= request.getParameter("name");
		String subject = request.getParameter("subject");
		String sub = "Team Sketch'n'Stipple";
		System.out.println("to"+to);
		
		String message = request.getParameter("message");
		String msg = "Dear " + name + ",\n\nThanks for writing to us. We will get back to you shortly.\n\n\n"
				+ "Regards,\n"
				+ "Team Sketch'n'Stipple";
				
				
		System.out.println(msg);
		String user = "sketchnstipple@gmail.com";
		String pass = "majorproject";
		
		SendMail.send(to, sub, msg, user, pass);
		SendMail.send(user, subject, message, user, pass);
		if (request.getParameter("page").equals("index"))
		  response.sendRedirect("index.jsp");
		else response.sendRedirect("welcome.jsp");
	}

}
