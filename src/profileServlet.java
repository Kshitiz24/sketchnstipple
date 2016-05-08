

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class profileServlet
 */
@WebServlet("/profileServlet")
public class profileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 private boolean isMultipart;
	   private String filePath;
	   private int maxFileSize = 200 * 1024;
	   private int maxMemSize = 4 * 1024;
	   private File file ;
	   String mem1,mem2,mem3,mem4;
	   String phn1,phn2,phn3,phn4;
	   String vol;
	   public void init( ){
		      // Get the file location where it would be stored.
		      filePath = getServletContext().getInitParameter("image-upload"); 
		   }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con =getConnection.myConnection();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			//fetching from web page
			
			//System.out.println(article +"  "+ name );
			 
			// Check that we have a file upload request
		    isMultipart = ServletFileUpload.isMultipartContent(request);
		    
		    DiskFileItemFactory factory = new DiskFileItemFactory();
		      // maximum size that will be stored in memory
		      factory.setSizeThreshold(maxMemSize);
		      // Location to save data that is larger than maxMemSize.
		      factory.setRepository(new File("i:\\temp"));

		      // Create a new file upload handler
		      ServletFileUpload upload = new ServletFileUpload(factory);
		      // maximum file size to be uploaded.
		      upload.setSizeMax( maxFileSize );

		      
		      // Parse the request to get file items.
		      List fileItems = upload.parseRequest(request);
			
		      // Process the uploaded file items
		      Iterator i = fileItems.iterator();
		      while ( i.hasNext() ) 
		      {
		         FileItem fi = (FileItem)i.next();
		         if ( !fi.isFormField () )	
		         {
		            // Get the uploaded file parameters
		            String fieldName = fi.getFieldName();
		            String fileName = fi.getName();
		            String contentType = fi.getContentType();
		            boolean isInMemory = fi.isInMemory();
		            long sizeInBytes = fi.getSize();
		            // Write the file
		            if( fileName.lastIndexOf("\\") >= 0 ){
		               file = new File( filePath + 
		               fileName.substring( fileName.lastIndexOf("\\"))) ;
		            }else{
		               file = new File( filePath + 
		               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
		            }
		            fi.write( file ) ;
		            //out.println("Uploaded Filename: " + fileName + "<br>");
		         }
		         else
		         {
		        	 String fieldname = fi.getFieldName();
		             String fieldvalue = fi.getString();
		             
		             	if(fieldname.equals("vol"))
		             		vol=fieldvalue;
		             	
		             	if(fieldname.equals("Member1"))
		             		mem1 = fieldvalue;
		             	if(fieldname.equals("ContactNo1"))
		             		phn1 = fieldvalue;
		             	
		             	if(fieldname.equals("Member2"))
		             		mem2 = fieldvalue;
		             	if(fieldname.equals("ContactNo2"))
		             		phn2 = fieldvalue;
		             	
		             	if(fieldname.equals("Member3"))
		             		mem3 = fieldvalue;
		             	if(fieldname.equals("ContactNo3"))
		             		phn3 = fieldvalue;
		             	
		             	if(fieldname.equals("Member4"))
		             		mem4 = fieldvalue;
		             	if(fieldname.equals("ContactNo4"))
		             		phn4 = fieldvalue;
		             		
		         }
		      }
	}catch(Exception e){e.printStackTrace();}
	}
}
