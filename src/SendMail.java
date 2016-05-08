	import java.util.*;
	import javax.mail.*;
	import javax.mail.internet.*;

	public class SendMail 
	{ 
	    public static void send(String to, String sub, 
	                         String msg, final String user,final String pass)
	    { 
	        
	     Properties props = new Properties();
	     
	     
	     props.put("mail.smtp.host", "smtp.gmail.com");
	     
	     props.put("mail.smtp.port", "587");		
	     props.put("mail.smtp.auth", "true");
	     props.put("mail.smtp.starttls.enable", "true");
	     
	   

	    Session session = Session.getInstance(props,new javax.mail.Authenticator()
	    {
	  	  protected PasswordAuthentication getPasswordAuthentication() 
	  	  {
	  	 	 return new PasswordAuthentication(user,pass);
	  	  }
	   });
	    
	   try
	   {
	 
	 	
	 
	    MimeMessage message = new MimeMessage(session);
	       message.setFrom(new InternetAddress(user));
	       System.out.println("inside try 1");
	       System.out.println(Message.RecipientType.TO);
	       System.out.println(new InternetAddress(to));
	       message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
	       System.out.println("inside try 2");
	       message.setSubject(sub);
	       message.setText(msg);

	       
	       
	       Transport.send(message);
	 
	 
	    }
	    catch(Exception e)
	    {
	    	System.out.println("Inside catch block."); 
	    	e.printStackTrace();
	    }
	  }  
	}


