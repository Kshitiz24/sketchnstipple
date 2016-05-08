<!Doctype html>

<html lang="en">

<head>

  <!-- Basic -->
  <title>Bid</title>

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
</head>
    
<body>
<% // to check user logged in or not.
	String name=null,email=null;
	if(session.getAttribute("user")==null)
		  response.sendRedirect("LoginRe.jsp");
  else
	  {name = (String )session.getAttribute("user");
	  email = (String )session.getAttribute("email");
	  }
 %>
<!-- Start Header ( Logo & Naviagtion ) -->
    <header>
      <div class="navbar navbar-default navbar-top">
        <div class="container">
          <div class="navbar-header">
            <!-- Stat Toggle Nav Link For Mobiles -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <i class="fa fa-bars"></i>
            </button>
            <!-- End Toggle Nav Link For Mobiles -->
            <a class="navbar-brand" href="welcome.jsp">Sketch'n'Stipple</a>
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
                <a class="active" href="">Bid</a>  
              </li>
              <li>
                <a href="artist.jsp">Art</a>  
              </li>
                <li>
                <a    href="shows.jsp">Shows</a>  
              </li>
                <li>
                <a href="contest.jsp">Contest</a>  
              </li>
               <li>
                 <a href="">Welcome, <%=session.getAttribute("user")%></a>
                <ul class="dropdown">
                <li><a href="profileu.jsp"> My Profile</a></li>
                <li><a href="LogoutServlet"> Logout</a></li>
                </ul> 
              </li>
              </ul>
              
            
          </div>
        </div>
     </div>
    </header>
     <!-- Start Page Banner -->
    <div class="page-banner">
      
    </div>
    <!-- End Page Banner -->
    <%@ page import="java.sql.*" %>
        <%
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","oracle");
			
			Statement st2,st = con.createStatement(); st2 = con.createStatement();
			ResultSet rs, rs2;
			String image = request.getParameter("image");
		%>
   <div id="content">
      <div class="container">
        <div class="project-page row">

          <!-- Start Single Project Slider -->
          <div class="project-media col-md-8">
              <div class="item">
                <a class="lightbox" title="Show" href="img/bid/<%=image %>" data-lightbox-gallery="gallery2">
                  <img alt="..." src="img/bid/<%=image %>" style="width:100%;">
                </a>
              </div>
             
            
          </div>
            <%
            	rs = st.executeQuery("select * from bidding where image='"+image+"'");
            	rs.next();
            %>
        <div class="project-content col-md-4">
            <h4><span>Description</span></h4>
            <p><%=rs.getString("description")%>  </p>
            <h4><span>Art Details</span></h4>
            <ul>
              <li><strong>Art Name:</strong> <%=rs.getString("name")%> </li>
              <li><strong>Artist Name:</strong> <%=rs.getString("artist")%></li>
              <li><strong>Starting Bid:</strong> <%=rs.getInt("bid")%></li>   <% int start =rs.getInt("bid");%>
              <li><strong>Bid End Time:</strong> <%=rs.getString("endtime")%></li>    
            </ul>
            <div class="post-share">
              <span>Share This:</span>
              <a class="facebook" href="#"><i class="fa fa-facebook"></i></a>
              <a class="twitter" href="#"><i class="fa fa-twitter"></i></a>
              <a class="gplus" href="#"><i class="fa fa-google-plus"></i></a>
              <a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a>
              <a class="mail" href="#"><i class="fa fa-envelope"></i></a>    
            </div>
          </div>
          </div>
          <div class="row">
          <div class="col-md-6">
              <div class="post-row">
              <%
              int bid, prev;
              System.out.println("email  "+email+"image "+image);
              	rs2=st2.executeQuery("select * from bidvalue where email='"+email+"' and image='"+image+"'");
                if(rs2.next())
                {	
                	prev=rs2.getInt("bid");
                	System.out.println(prev);
                }
                else
                	prev = 00;
                
                rs2 = st2.executeQuery("select max(bid) from bidvalue where image='"+image+"'");
                if(rs2.next() && rs2.getInt(1)>0)
                	bid=rs2.getInt(1);
                else
                	bid=start;
              %>
              <h4 class="classic-title"><span>Current Bid</span></h4>
                <p><i class="fa fa-inr fa-lg" aria-hidden="true"></i><%=bid%></p>  
              </div>
              </div>
          <div class="col-md-6">
              <div class="post-row">
              <h4 class="classic-title"><span>Your Last Bid</span></h4>
                <p><i class="fa fa-inr fa-lg" aria-hidden="true"></i> <%=prev %><br></p>
                 <!-- <button type="button" class="btn btn-sm btn-danger">Cancel My Bid</button> -->  <br><br>
              </div>
              </div>      
          </div>
          <div class="hr1 margin-20"></div>
          <h4 class="classic-title"><span>Your Current Bid</span></h4>
          <form class="form-inline" method="post" action="bidServlet">
              <div class="form-group">
               <label class="sr-only" for="exampleInputAmount">Amount (in Rupees)</label>
               <div class="input-group">
               <div class="input-group-addon"><i class="fa fa-inr fa-lg" aria-hidden="true"></i></div>
               <input type="hidden" name="current" value="<%=bid %>">
               <input type="hidden" name="email" value="<%=email %>">
               <input type="hidden" name="image" value="<%=image %>">
               <input type="text" class="form-control" id="exampleInputAmount" placeholder="Amount" name="amount" required>
               <div class="input-group-addon">.00</div>
               </div>
              </div>
              <button type="submit" class="btn btn-md btn-primary">Submit</button>
              <p style=""> Your bidding is successfully registered. Thanks for bidding.</p>
            </form>  
        </div>
       </div>
           <a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>
        <nav id="footer">
        <div class="container"><br>
            <div class="pull-left fnav">
                <p>ALL RIGHTS RESERVED. COPYRIGHT © 2014. Designed by Abhishek Baj and Coded by </p>
            </div>
            <div class="pull-right fnav">
                <ul class="footer-social">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                </ul>
            </div>
        </div>
    </nav>
      <script type="text/javascript" src="js/script.js"></script>      
       <% con.close(); %>      
    </body>    
