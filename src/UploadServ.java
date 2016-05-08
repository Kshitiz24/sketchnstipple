import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sun.org.apache.bcel.internal.generic.ARRAYLENGTH;

/**
 * Servlet implementation class UploadServ
 */
@WebServlet("/UploadServ")
@MultipartConfig()
///////////////////////////////////
public class UploadServ extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
	private boolean isMultipart;
	   private String filePath;
	   private int maxFileSize = 900 * 1024; //This means 900Kb is the maxFileSize.
	   private int maxMemSize = 40 * 1024;
	   private File file ;

	   public void init( )
	   {
	      // Get the file location where it would be stored.
	      filePath = 
	             getServletContext().getInitParameter("file-upload"); 
	   }
//////////////////////////////////    
    public UploadServ() 
    {
        super();
        // TODO Auto-generated constructor stub
    }

   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection con = null;
		
		String country ,city ,address ,contactNo, aboutMe, email ;
		PreparedStatement ps;
		//System.out.println(country+" "+city+" "+contactNo);//profilePic's name is below
		////////////////////////////////
		DiskFileItemFactory factory = new DiskFileItemFactory();
	      factory.setSizeThreshold(maxMemSize);
	      factory.setRepository(new File("I:\\temp"));	

	      ServletFileUpload upload = new ServletFileUpload(factory);
	      upload.setSizeMax( maxFileSize );
	      HttpSession session = request.getSession();
	      email=(String) session.getAttribute("email");
	      ///////////////////////////////////////////////////////
	      ArrayList<String> al = new ArrayList<String>();
	      try{ 
	    	  con =getConnection.myConnection();
			   Statement st=con.createStatement();
			   
			  
	          List fileItems = upload.parseRequest(request);
	    	System.out.println("uper while");
	          Iterator i = fileItems.iterator();
	          while ( i.hasNext () ) 
	          {System.out.println("in while");
	             FileItem fi = (FileItem)i.next();
	             if ( !fi.isFormField () )	
	             {
	                String fieldName = fi.getFieldName();
	                String fileName = fi.getName();
			String profilePic = fileName;///////////////////////profilePic Name (dont change its variable name)(save this in the DB as well along wid country city address, etc)
	                String contentType = fi.getContentType();
	                boolean isInMemory = fi.isInMemory();
	                long sizeInBytes = fi.getSize();
	                if( fileName.lastIndexOf("\\") >= 0 ){
	                	System.out.println("in if");
	                   file = new File( filePath + 
	                   fileName.substring( fileName.lastIndexOf("\\"))) ;
	                }else{
	                	System.out.println("in else");
	                   file = new File( filePath + 
	                   fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	                   System.out.println(fileName);
	                }
	                fi.write( file ) ;
	                if(fileName!=null)
		             {
		            	 ps = con.prepareStatement("update Profile set profilepic =? where email='"+email+"'");
		            	 ps.setString(1,fileName);
		            	 ps.executeQuery();
					 }
	               
	             }
	             else
	             {
	            	 	System.out.println("in else of form"+email);
	            	 	 String fieldname = fi.getFieldName();
			             String fieldvalue = fi.getString();
			            
			             al.add(fieldvalue);////////////////////////////
			             if(fieldvalue!=null)
			             {
			            	 System.out.println("in if of update");
			            	 ps = con.prepareStatement("update Profile set "+fieldname+" =? where email='"+email+"'");
			            	 ps.setString(1,fieldvalue);
			            	 ps.executeQuery();
						 }
			             System.out.println(fieldname +  "  "+ fieldvalue);
	             }
	          }
	      
	
	   System.out.println(al);
	   /////////////
	   /////////////
	   //Space for your DB connectivity code//
	   
		
	   response.setContentType("text/html");
	   PrintWriter out = response.getWriter();
	      
	    
	    String to =(String) session.getAttribute("email");
	    String name = (String) session.getAttribute("name");
		
	    
		String sub = "Team Sketch'n'Stipple - Profile Updated!";
		String msg = "Dear " + name + ",\n\nYour profile has been updated.\nKeep Arting!!\n\n"
				+ "Regards,\n"
				+ "Team Sketch'n'Stipple";
		String user = "sketchnstipple@gmail.com";
		String pass = "majorproject";
		//SendMail.send(to, sub, msg, user, pass);
		response.sendRedirect("////profileUpdatedPage/////");
	   }catch(Exception ex) {
		   System.out.println(ex);
	   }
	}
}