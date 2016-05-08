<!Doctype html>

<html lang="en">

<head>

  <!-- Basic -->
  <title>Shows</title>

  <!-- Define Charset -->
  <meta charset="utf-8">

  <!-- Responsive Metatag -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  <!-- Page Description and Author -->
  <meta name="description" content="Margo - Responsive HTML5 Template">
  <meta name="author" content="iThemesLab">

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
          
  <!-- Margo JS  -->
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
<% // to check user logged in or not.
	String name=null;
	if(session.getAttribute("user")==null)
		  response.sendRedirect("LoginRe.jsp");
  else
	  name = (String )session.getAttribute("user");  
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
                <a href="browse.jsp">Browse</a>  
              </li>
              <li>
                <a  href="bidding.jsp">Bid</a>  
              </li>
              <li>
                <a href="artist.jsp">Art</a>  
              </li>
                <li>
                <a   class="active" href="">Shows</a>  
              </li>
                <li>
                <a href="contest.jsp">Contest</a>  
              </li>
                <li>
                 <a href="">Welcome, <%=session.getAttribute("user")%></a>
                <ul class="dropdown">
                <li><a href="profileu.jsp">My Profile</a></li>
                <li><a href="LogoutServlet">Logout</a></li>
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
			
			Statement st = con.createStatement();
			ResultSet rs;
		%>
   <div id="content">
      <div class="container">
        <div class="project-page row">

          <!-- Start Single Project Slider -->
        <%   String show= request.getParameter("show");
             if(show==null)
             {	show = "Art Reflect 2016";
             rs=st.executeQuery("select * from shows where name = '"+show+"' ");
             
             }else
             {
            	 //System.out.println("in else of shows.jsp"+ show);
            	 rs=st.executeQuery("select * from shows where name = '"+show+"' ");
             }
	         rs.next();
	     %>  
          <div class="project-media col-md-8">
            <div class="touch-slider project-slider">
              <div class="item">
                <a class="lightbox" title="<%=show %>" href="img/shows/<%=show %>/<%=rs.getString("img1") %>" data-lightbox-gallery="gallery2">
                  <img alt="..." src="img/shows/<%=show %>/<%=rs.getString("img1") %>" data-src="holder.js/275x183" style="width:100%;">
                </a>
              </div>
              <div class="item">
                <a class="lightbox" title="<%=show %>" href="img/shows/<%=show %>/<%=rs.getString("img2") %>" data-lightbox-gallery="gallery2">
                  <img alt="..." src="img/shows/<%=show %>/<%=rs.getString("img2") %>" data-src="holder.js/275x183"style="width:100%;">
                </a>
              </div>
              <div class="item">
                <a class="lightbox" title="<%=show %>" href="img/shows/<%=show %>/<%=rs.getString("img3") %>" data-lightbox-gallery="gallery2">
                  <img alt="..." src="img/shows/<%=show %>/<%=rs.getString("img3") %>" data-src="holder.js/275x183" style="width:100%;">
                </a>
              </div>
            </div>
            
          </div>
            
        <div class="project-content col-md-4">
            <h4><span>Featured Show</span></h4>
            <p><%=rs.getString("details") %> </p>
            <h4><span>Show Details</span></h4>
            <ul>
              <li><strong>Name: &nbsp;</strong><%= rs.getString("name") %>  </li>
              <li><strong>Organiser: &nbsp;</strong><%= rs.getString("organizer") %>  </li>
              <li><strong>Venue: &nbsp;</strong> <%= rs.getString("venue") %></li>
              <li><strong>Date: &nbsp;</strong> <%= rs.getString("dat") %></li>
            </ul>
            <div class="post-share">
              <span> Share This: </span>
              <a class="facebook" href="#"><i class="fa fa-facebook"></i></a>
              <a class="twitter" href="#"><i class="fa fa-twitter"></i></a>
              <a class="gplus" href="#"><i class="fa fa-google-plus"></i></a>
              <a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a>
              <a class="mail" href="#"><i class="fa fa-envelope"></i></a>    
            </div>
          </div>
          </div>
          <div class="" >
          </div>
         <!-- Start Recent Projects Carousel -->
         <%
         	rs = st.executeQuery("select * from shows where name not in (select name from shows where name = '"+show+"')");
         	rs.next();
         	
         %>
         
        <div class="recent-projects">
          <h4 class="title"><span>Past Shows</span></h4>
          <div class="projects-carousel touch-carousel">

            <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title="">
                    <img alt="" src="img/shows/<%=rs.getString("name") %>/<%=rs.getString("img1") %>" max-width="265px" max-height="184px"/>
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="shows.jsp?show=<%=rs.getString("name")%>">
                    <h4><%=rs.getString("name") %></h4>
                    <span><%=rs.getString("venue") %></span>
                    <!-- <span>Drawing</span> -->
                  </a>
                </div>
              </div>
            </div>
      <%--  <% rs.next(); %>
            <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title="This is an image title" href="img/world_of_warcraft_legion-1920x1080.jpg">
                    <img alt="" src="img/shows/<%=rs.getString("name") %>/<%=rs.getString("img1") %>" />
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="#">
                    <h4><%=rs.getString("name") %></h4>
                    <span><%=rs.getString("venue") %></span>
                    <!-- <span>Drawing</span> -->
                  </a>
                </div>
              </div>
            </div>
  	 <% rs.next(); %>
            <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title="This is an image title" href="img/world_of_warcraft_legion-1920x1080.jpg">
                    <img alt="" src="img/shows/<%=rs.getString("name") %>/<%=rs.getString("img1") %>" />
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="#">
                   <h4><%=rs.getString("name") %></h4>
                    <span><%=rs.getString("venue") %></span>
                    <!-- <span>Drawing</span> -->
                  </a>
                </div>
              </div>
            </div> --%>
       <%--  <% rs.next(); %> --%>
      <!--         <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title="This is an image title" href="img/world_of_warcraft_legion-1920x1080.jpg">
                    <img alt="" src="img/1.png" />
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="#">
                    <h4>Drawing</h4>
                    <span>Website</span>
                    <span>Drawing</span>
                  </a>
                </div>
              </div>
            </div>

            
	  <%--  <% rs.next(); %>  --%>
       <!--  <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title="This is an image title" href="img/world_of_warcraft_legion-1920x1080.jpg">
                    <img alt="" src="img/1.png" />
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="#">
                    <h4>Drawing</h4>
                    <span>Website</span>
                    <span>Drawing</span>
                  </a>
                </div>
              </div>
            </div> -->

             <% rs.next(); %>
            <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title="" >
                    <img alt="" src="img/shows/<%=rs.getString("name") %>/<%=rs.getString("img1") %>" />
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="shows.jsp?show=<%=rs.getString("name")%>">
                   <h4><%=rs.getString("name") %></h4>
                    <span><%=rs.getString("venue") %></span>
                    <!-- <span>Drawing</span> -->
                  </a>
                </div>
              </div>
            </div>
  
          </div>
        </div>

      </div>
    </div>  
    <!-- Go To Top Link -->
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
