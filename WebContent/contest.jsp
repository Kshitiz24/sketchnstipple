<!doctype html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><html lang="en" class="no-js"> <![endif]-->
<html lang="en">

<head>

  <!-- Basic -->
  <title>Contest</title>

  <!-- Define Charset -->
  <meta charset="utf-8">

  <!-- Responsive Metatag -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

  
  <!-- Bootstrap CSS  -->
  <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="screen">
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="screen">     

  <!-- Font Awesome CSS -->
  <link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.min.css" type="text/css" media="screen">
  <link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.css" type="text/css" media="screen">    

  <!-- Slicknav -->
  <link rel="stylesheet" type="text/css" href="css/slicknav.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/contest.css" />
  <link rel="stylesheet" type="text/css" href="css/portfolio.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/demo.css" media="screen">
  <link rel="stylesheet" type="text/css" href="css/style.css" media="screen">    
  
  <!-- Responsive CSS Styles  -->
  <link rel="stylesheet" type="text/css" href="css/responsive1.css" media="screen">

  <!-- Css3 Transitions Styles  -->
  <link rel="stylesheet" type="text/css" href="css/animate.css" media="screen">

  <!-- Color CSS Styles  -->
  <link rel="stylesheet" type="text/css" href="css/colors/red.css" title="red" media="screen" />
  
  
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
  <script type="text/javascript" src="js/modernizr.custom.53451.js"></script>

  <!--[if IE 8]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
  <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

</head>

<body>
<% // to check user logged in or not.
	String name=null;
	if(session.getAttribute("user")==null)
		  response.sendRedirect("LoginRe.jsp");
  else
	  name = (String )session.getAttribute("user");  
 %>
    
  <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
      
  <header>
  <%@ page import="java.sql.*" %>
        <%
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","oracle");
			
			Statement st = con.createStatement();
			ResultSet rs;
		%>
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
                <a href="shows.jsp">Shows</a>  
              </li>
                <li>
                <a class="active" href="">Contest</a>  
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
      <!-- End Header Logo & Naviagtion -->
    <!-- Start Page Banner -->
    <div class="page-banner">
      
    </div>
    <div id="dg-container" class="dg-container">
			<div class="dg-wrapper">
				<% rs = st.executeQuery("select * from contest");
				 rs.next(); %> 
				<a href="https://www.facebook.com/sketchnstipple/photos/pb.563713230501402.-2207520000.1461058499./569681083237950/?type=3&theater" target="_blank"><img src="img/contest/contest/<%=rs.getString("img") %>" alt="image01"><div><%=rs.getString("title") %></div></a><% rs.next(); %>
				<a href="https://www.facebook.com/sketchnstipple/photos/pb.563713230501402.-2207520000.1461058499./569681079904617/?type=3&theater" target="_blank"><img src="img/contest/contest/<%=rs.getString("img") %>" alt="image02"><div><%=rs.getString("title") %></div></a><% rs.next(); %>
				<a href="https://www.facebook.com/sketchnstipple/photos/pb.563713230501402.-2207520000.1461058499./569681093237949/?type=3&theater" target="_blank"><img src="img/contest/contest/<%=rs.getString("img") %>" alt="image03"><div><%=rs.getString("title") %></div></a><% rs.next(); %>
				<a href="https://www.facebook.com/sketchnstipple/photos/pb.563713230501402.-2207520000.1461058499./569681123237946/?type=3&theater" target="_blank"><img src="img/contest/contest/<%=rs.getString("img") %>" alt="image04"><div><%=rs.getString("title") %></div></a><% rs.next(); %>
				<a href="https://www.facebook.com/sketchnstipple/photos/pb.563713230501402.-2207520000.1461058499./569681133237945/?type=3&theater" target="_blank"><img src="img/contest/contest/<%=rs.getString("img") %>" alt="image05"><div><%=rs.getString("title") %></div></a>
				
			</div>
			<nav>	
				<span class="dg-prev">&lt;</span>
				<span class="dg-next">&gt;</span>
			</nav>
	</div>
      
         <%
         	rs = st.executeQuery("select * from winners ");
         	rs.next();
         	
         %>
        <div class="container">        
            
        <div class="recent-projects">
          <h4 class="title"><span>Past Winners</span></h4>
    
          <div class="projects-carousel touch-carousel">

             <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title=" <%=rs.getString("title") %>" href="img/contest/winners/<%=rs.getString("img") %>">
                    <img alt="" src="img/contest/winners/<%=rs.getString("img") %>" max-width="265px" max-height="184px"/>
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="">
                    <h4><%=rs.getString("title") %></h4>
                  <%--   <span><%=rs.getString("venue") %></span> --%>
                    <!-- <span>Drawing</span> -->
                  </a>
                </div>
              </div>
            </div>
       <%rs.next();%>
           <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title=" <%=rs.getString("title") %>" href="img/contest/winners/<%=rs.getString("img") %>">
                    <img alt="" src="img/contest/winners/<%=rs.getString("img") %>" max-width="265px" max-height="184px"/>
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="">
                    <h4><%=rs.getString("title") %></h4>
                  <%--   <span><%=rs.getString("venue") %></span> --%>
                    <!-- <span>Drawing</span> -->
                  </a>
                </div>
              </div>
            </div>
  		 <%rs.next();%>
            <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title=" <%=rs.getString("title") %>" href="img/contest/winners/<%=rs.getString("img") %>">
                    <img alt="" src="img/contest/winners/<%=rs.getString("img") %>" max-width="265px" max-height="184px"/>
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="">
                    <h4><%=rs.getString("title") %></h4>
                  <%--   <span><%=rs.getString("venue") %></span> --%>
                    <!-- <span>Drawing</span> -->
                  </a>
                </div>
              </div>
            </div>
		 <%rs.next();%>
            <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title=" <%=rs.getString("title") %>" href="img/contest/winners/<%=rs.getString("img") %>">
                    <img alt="" src="img/contest/winners/<%=rs.getString("img") %>" max-width="265px" max-height="184px"/>
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="">
                    <h4><%=rs.getString("title") %></h4>
                  <%--   <span><%=rs.getString("venue") %></span> --%>
                    <!-- <span>Drawing</span> -->
                  </a>
                </div>
              </div>
            </div>
		 <%rs.next();%>
            <div class="portfolio-item item">
              <div class="portfolio-border">
                <div class="portfolio-thumb">
                  <a class="lightbox" title=" <%=rs.getString("title") %>" href="img/contest/winners/<%=rs.getString("img") %>">
                    <img alt="" src="img/contest/winners/<%=rs.getString("img") %>" max-width="265px" max-height="184px"/>
                  </a>
                </div>
                <div class="portfolio-details">
                  <a href="">
                    <h4><%=rs.getString("title") %></h4>
                  <%--   <span><%=rs.getString("venue") %></span> --%>
                    <!-- <span>Drawing</span> -->
                  </a>
                </div>
              </div>
            </div>
               

            </div>
      </div>
      </div>
       <a href="#" class="back-to-top"><i class="fa fa-angle-up"></i></a>

       <script type="text/javascript" src="js/script.js"></script>
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
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.gallery.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#dg-container').gallery();
			});
		</script>
      <script type="text/javascript" src="js/script.js"></script>      
    </body>    
    <% con.close(); %>
    </html>