<!Doctype html>

<%@page import="java.util.ArrayList"%>
<html lang="en">

<head>

  <!-- Basic -->
  <title>Shows</title>

  <!-- Define Charset -->
  <meta charset="utf-8">

  <!-- Responsive Metatag -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

 

  <!-- Bootstrap CSS  -->
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="screen">
    
   <!-- Font Awesome CSS -->
  <link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.min.css" type="text/css" media="screen">
  <link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.css" type="text/css" media="screen">    

  <!-- Slicknav -->
  <link rel="stylesheet" type="text/css" href="css/slicknav.css" media="screen">

  <!-- Main CSS Styles  -->
  <link rel="stylesheet" type="text/css" href="css/portfolio.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/style.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/dashboard.css" media="screen">    
     

  <!-- Responsive CSS Styles  -->
  <link rel="stylesheet" type="text/css" href="css/responsive1.css" media="screen">
    
  
          
      
  <!--  JS  -->
  <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
  <script type="text/javascript" src="js/jquery.migrate.js"></script>
  <script type="text/javascript" src="js/modernizrr.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/jquery.fitvids.js"></script>
  <script type="text/javascript" src="js/owl.carousel.min.js"></script>
  <script type="text/javascript" src="js/nivo-lightbox.min.js"></script>
  <script type="text/javascript" src="js/jquery.isotope.min.js"></script>
  <script type="text/javascript" src="js/jquery.appear.js"></script>
  <script type="text/javascript" src="js/count-to.js"></script>
  <script type="text/javascript" src="js/jquery.textillate.js"></script>
  <script type="text/javascript" src="js/jquery.lettering.js"></script>
  <script type="text/javascript" src="js/jquery.easypiechart.min.js"></script>
  <script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>
  <script type="text/javascript" src="js/jquery.parallax.js"></script>
  <script type="text/javascript" src="js/jquery.slicknav.js"></script>
  <script type="text/javascript" src="js/holder.js"></script>    
</head>
    
<body>
<!-- Start Header ( Logo & Naviagtion ) -->
 <% // to check user logged in or not.
	String name=null,email=null;
	if(session.getAttribute("user")==null)
		  response.sendRedirect("LoginRe.jsp");
  else
	  {name = (String )session.getAttribute("user");
	  email = (String )session.getAttribute("email");
	  }
 %>
         <%@ page import="java.sql.*" %>
        <%
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","oracle");
			
			Statement st2,st = con.createStatement(); st2 = con.createStatement();
			ResultSet rs, rs2;
			ArrayList<String> al = new ArrayList<String>();
			rs = st.executeQuery("select * from Profile where email='"+email+"'");
			rs.next();
			
			for(int i=1;i<9;i++)
			{
				//al.add(rs.getString(i));
				if(rs.getString(i)==null)
				  {if(i!=3)al.add("N/A");
				   if(i==3)al.add("na.jpeg");
				  }
			    else
				al.add(rs.getString(i));
			
			}
			
		%>
    <header>
      <div class="navbar navbar-default navbar-top">
        <div class="container">
          <div class="navbar-header">
            <!-- Stat Toggle Nav Link For Mobiles -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <i class="fa fa-bars"></i>
            </button>
            <!-- End Toggle Nav Link For Mobiles -->
            <a class="navbar-brand" href="index.html">Sketch'n'Stipple</a>
          </div>
          <div class="navbar-collapse collapse">
             
             <ul class="nav navbar-nav navbar-right">
              <li>
                <a  href="welcome.jsp">Home</a>  
              </li>
              <li>
                <a  href="browse.jsp">Browse</a>  
              </li>
              <li>
                <a href="">Bid</a>  
              </li>
              <li>
                <a href="artist.jsp">Art</a>  
              </li>
                <li>
                <a  href="shows.jsp">Shows</a>  
              </li>
                <li>
                <a href="contest.jsp">Contest</a>  
              </li>
                <li>
                <a href="LogoutServlet">Logout (<%=session.getAttribute("user")%>)</a>  
              </li>
              </ul>
          </div>
        </div>
     </div>
    </header>
     <!-- Start Page Banner -->
    <form>    
    <div id="sidebar-wrapper">
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <br><br>
            <img src="img/profile/<%=al.get(2) %>" class="img-responsive">
            <br>
             
                
          </div>
        </div>
        </div>
        </div>    
        
        <div id="tf-contact" class="text-center">
        <div class="container">

            <div class="row">
                
                        
                        <div class="col-md-offset-1 col-md-9"> 
                            <div class="form-group center">
                               
                                <label><h3><strong>Email:</strong></h3></label>
                            <label><%=al.get(0) %></label>
                            </div>
                        </div>
    
                        <div class="col-md-offset-3 col-md-5"> 
                            <div class="form-group">
                                <label><h3><strong><br>Name:</strong></h3></label>
                            <label><%=al.get(1) %></label>
                            </div>
                        </div>
                
                        <div class="col-md-offset-3 col-md-5"> 
                            <div class="form-group">
                                <label><h3><strong><br>Country:</strong></h3></label>
                            <label><%=al.get(3) %></label>
                            </div>
                        </div>
                
                        <div class="col-md-offset-3 col-md-5"> 
                            <div class="form-group">
                                <label><h3><strong><br>City:</strong></h3></label>
                            <label><%=al.get(4) %></label>
                            </div>
                        </div>
                
                        <div class="col-md-offset-3 col-md-5"> 
                            <div class="form-group">
                                <label><h3><strong><br>Address:</strong></h3></label>
                            <label><%=al.get(5) %></label>
                            </div>
                        </div>
                
                        <div class="col-md-offset-3 col-md-5"> 
                            <div class="form-group">
                                <label><h3><strong><br>Contact No:</strong></h3></label>
                            <label><%=al.get(7) %></label>
                            </div>
                        </div>
                        <div class="col-md-offset-3 col-md-5"> 
                            <div class="form-group">
                                <label><h3><strong><br>About Me:</strong></h3></label>
                            <label><%=al.get(6) %></label>
                            </div>
                        </div>
                   <a href="Profile.jsp"> 
                  <button type="button" class="btn tf-btn btn-default">Edit</button>
                  </a>
            </div>
            </div>
        </div>
        </form>
        
        <br><br><br>
        <div class="hr1 margin-100"></div>
        <script src="js/script.js"></script>
    </body>
    </html>