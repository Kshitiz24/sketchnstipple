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
</head>
    
<body>
<% // to check user logged in or not.
	String name=null;
	if(session.getAttribute("user")==null)
		  response.sendRedirect("LoginRe.jsp");
  else
	  name = (String )session.getAttribute("user");  
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
                <a  href="artist.jsp">Art</a>  
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
    
    <div class="container">
        <div class="section-title">
            <br><br>
                <h2> <strong>Art Work Available For Bidding</strong></h2>
                
                <div class="clearfix"></div>
    </div> 
    </div> 
        
    <div id="content">
      <div class="container">
        <div class="portfolio-page portfolio-2column">

          <ul id="portfolio-list" data-animated="fadeIn">
            <li>
              <img src="img/bid/1.jpeg" alt="" />
              <div class="portfolio-item-content">
                <a href="bid.jsp?image=1.jpeg">
                <span class="header">Mainichi April 2014</span>
                <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
                </a>
              </div>
              <div>
                  <h1>Burning House</h1>  
              </div>    
              <br><br>

            </li>
            <li>
              <img src="img/bid/2.jpeg" alt="" />
              <div class="portfolio-item-content">
                <a href="bid.jsp?image=2.jpeg">
                <span class="header">Mainichi April 2014</span>
                <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
                </a>
              </div>
             <div>
                  <h1>The Gandhi</h1>  
              </div>    
              <br><br>

            </li>
            <li>
              <img src="img/bid/3.jpeg" alt="" />
              <div class="portfolio-item-content" >
              <a href="bid.jsp?image=3.jpeg">
                <span class="header">Mainichi April 2014</span>
                <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
                </a>
              </div>
              <div>
                  <h1>Water Lane</h1>  
              </div>
              </li>
            </ul>
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
      
    </body>    
