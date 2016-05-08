<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<html lang="en">
  <head>
    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SketchnStipple</title>
    
    
    
    <!-- Favicons
    ================================================== -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css"  href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"> 
    <!-- Slider
    ================================================== -->
    <link href="css/owl.carousel.css" rel="stylesheet" media="screen">
    <link href="css/owl.theme.css" rel="stylesheet" media="screen">

    <!-- Stylesheet
    ================================================== -->
    <link rel="stylesheet" type="text/css"  href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/responsive.css">

    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,700,300,600,800,400' rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="js/modernizr.custom.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
    <body>
    <!-- Navigation
    ==========================================-->
    <nav id="tf-menu" class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">SketchnStipple</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#tf-home" class="page-scroll">Home</a></li>
            <li><a href="#tf-browse" class="page-scroll">Browse</a></li>
            <li><a href="bidding.jsp">Bid</a></li>
            <li><a href="#tf-art" class="page-scroll">Art</a></li>
            <li><a href="#tf-shows" class="page-scroll">Shows</a></li>
            <li><a href="contest.jsp" class="page-scroll">Contest</a></li>
            <li><a href="#tf-contact" class="page-scroll">Contact</a></li>
            <li><a href="login.jsp" class="page-scroll">LogIn/SignUp</a></li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
<% String name=null;
if(session.getAttribute("user")!=null)
{
	//System.out.println("in if of shows....not logged in");
	  response.sendRedirect("welcome.jsp");
} 
  %>
  
      
    <%@ page import="java.sql.*" %>
        <%
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","oracle");
			
			Statement st = con.createStatement();
			 ResultSet rs,rs2; 
        
         %> 
        
    <div id="tf-home" class="text-center">
      <div class="overlay">
            <div class="content">
                <h1>Welcome on <strong><span class="color">SketchnStipple</span></strong></h1>
                <p class="lead">We are a leader in selling paintings and have <strong>years of experience</strong> and with <strong>extraordinary people</strong></p>
                <a href="#tf-browse" class="fa fa-angle-down page-scroll"></a>
            </div>
        </div>
    </div>  
        
         <!-- Browse Page==========================================-->
          <% rs = st.executeQuery("select name from catdetails");
       	rs.next();
        ArrayList<String> cat = new ArrayList<String>();
        cat.add(rs.getString("name")); rs.next();
        cat.add(rs.getString("name")); rs.next();
        cat.add(rs.getString("name")); rs.next();
        cat.add(rs.getString("name"));
        
        rs= st.executeQuery("select COUNT(*) from "+ cat.get(0));
        rs.next();
        int no =(int)((rs.getInt(1)*Math.random())+1);		System.out.println("num"+no);
   
        rs = st.executeQuery("select * from "+cat.get(0)+ " where sno='"+no+"'");System.out.println("num"+no);
        rs.next();
      %>
    <div id="tf-browse">
         <!-- Page Features -->
        <div class="container">
        <div class="row text-center">

   <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <img src="img/browse/Contemporary/<%=rs.getString("img") %>" alt="">
                    <div class="caption">
                        <h3><a href="browse.jsp?type=<%=cat.get(0) %>"><font color=#999 ><%=cat.get(0) %></font></a></h3>
                        
                        
                    </div>
                </div>
            </div>
			<%  rs= st.executeQuery("select COUNT(*) from "+ cat.get(1));
	            rs.next(); 
			   no =(int)((rs.getInt(1)*Math.random())+1);System.out.println("num"+no);
			   rs.next(); 
			   rs = st.executeQuery("select * from "+cat.get(1)+ " where sno='"+no+"'");
			   rs.next(); %>
            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <img src="img/browse/Street/<%=rs.getString("img") %>" alt="">
                    <div class="caption">
                        <h3><a href="browse.jsp?type=<%=cat.get(1) %>"><font color=#999 ><%=cat.get(1) %></font></a></h3>
                        
                        
                    </div>
                </div>
            </div>
			<%  rs= st.executeQuery("select COUNT(*) from "+ cat.get(2));
	            rs.next();
			   no =(int)((rs.getInt(1)*Math.random())+1);System.out.println("num"+no);
			   rs = st.executeQuery("select * from "+cat.get(2)+ " where sno='"+no+"'");System.out.println("num"+no);
			   rs.next(); %>
            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <img src="img/browse/Religious/<%=rs.getString("img") %>" alt="">
                    <div class="caption">
                        <h3><a href="browse.jsp?type=<%=cat.get(2) %>"><font color=#999 ><%=cat.get(2) %></font></a></h3>
                        
                        
                    </div>
                </div>
            </div>
			<% rs= st.executeQuery("select COUNT(*) from "+ cat.get(3));
	           rs.next();  
			  no =(int)((rs.getInt(1)*Math.random())+1);System.out.println("num"+no);
			   rs = st.executeQuery("select * from "+cat.get(3)+ " where sno='"+no+"'");System.out.println("num"+no);
			   rs.next(); %>
            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail"  >
                    <img src="img/browse/Landscape/<%=rs.getString("img") %>" alt="" width="800" height="500">
                    <div class="caption">
                        <h3><a href="browse.jsp?type=<%=cat.get(3) %>"><font color=#999 ><%=cat.get(3) %></font></a></h3>
                       
                    </div>
                </div>
            </div>
            </div>
            <hr>
        </div>
        <!-- /.row -->        
    </div>
      
          <!-- Featured Art Page
    ==========================================-->
<div class="container" >
        <div class="section-title">
                <a href="artist.jsp" ><h2>Featured <strong>Artists</strong></h2></a>
                <div class="line">
                    <hr>
                </div>
                <div class="clearfix"></div>
    </div> 
  </div>    
<div id="tf-art">
    
    <div class="space"></div>
     <div id="slider" class="carousel slide" data-intervel="5000"data-ride="carousel">
     <ol class="carousel-indicators">
         <li data-target = "#slider" data-slide-to = "0" class="active"></li>
         <li data-target = "#slider" data-slide-to = "1"></li>
         <li data-target = "#slider" data-slide-to = "2"></li>
     </ol>
     <div class="carousel-inner">
         <div class="item active">
             
             <img src="img/slider1.jpeg" alt="..." class="img-responsive">
         </div>
         <div class="item">
             <img src="img/slider2.jpeg" alt="..." class="img-responsive">
         </div>
        <div class="item">
            <img src="img/slider3.jpeg" alt="..." class="img-responsive">
        </div>
     </div>
    <a class="carousel-control left" href="#slider" data-slide = "prev">
        <span class="icon-prev"></span>
    </a>
    <a class="carousel-control right" href="#slider" data-slide = "next">
        <span class="icon-next"></span>
    </a>
</div>
  <script src="js/jquery-1.12.0.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script> $('slider').carousel({intervel: 3000}); </script>        
  <br><br>
    <div class="container"><hr></div>
</div>

         <!-- Featured Show Page
    ==========================================-->

<div id="tf-shows">
<div class="container">
        <div class="section-title">
            <br>
                <h2><a href="shows.jsp">Featured <strong>Shows</strong></a></h2>
                <div class="line">
                    <hr>
                </div>
                <div class="clearfix"></div>
    </div>
    <div class="space"></div>
    <br>
    <%  
         rs=st.executeQuery("select name,img1 from shows ");         
	     rs.next();
        
     %>
     <div id="lightbox" class="row">

                <div class="col-sm-6 col-md-3 col-lg-3 branding">
                    <div class="portfolio-item">
                        
                                
                                    <h4><a href="shows.jsp?show=New show"></h4>
                                    
                                    <div class="clearfix"></div>
                                    
                                
                                <img src="img/shows/New show/1.jpeg" class="img-responsive " alt="...">
                                <div class="caption">
                                <h3>New Show</h3></a>
                                </div> 
                           
                        </div>
                  
                </div>
        <div class="col-sm-6 col-md-3 col-lg-3 branding">
                    <div class="portfolio-item">
                        
                                
                                    <h4><a href="shows.jsp?show=Art Fair"></h4>
                                    
                                    <div class="clearfix"></div>
                                    
                                
                                <img src="img/shows/Art Fair/1.jpeg" class="img-responsive" alt="...">
                                <div class="caption">
                                <h3>Art Fair</h3></a>
                                </div> 
                           
                    </div>
                </div>


    </div>
    </div>    
    </div>
    <div class="container"><hr></div><br><br>
        <!-- Contact Section
    ==========================================-->
    <div id="tf-contact" class="text-center">
        <div class="container">

            <div class="row">
                <div class="col-md-8 col-md-offset-2">

                    <div class="section-title center">
                        <h2>Feel free to <strong>contact us</strong></h2>
                        
                       <div class="clearfix"></div>
                        <br><br>
                    </div>

                    <form method="post" action="mailServlet">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputEmail1"></label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" name="email" placeholder="Enter email">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="exampleInputText1"></label>
                                    <input type="text" class="form-control" name="name" id="exampleInputText1" placeholder="Name">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                        	 <label for="exampleInputEmail1"></label>
                            <textarea class="form-control" name="subject" rows="1" placeholder="Subject"></textarea>                        
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1"></label>
                            <textarea class="form-control" name="message" rows="3" placeholder="Your Message"></textarea>
                        </div>
  						<input type="hidden" name="page" value="index">	                      
                        <button type="submit" class="btn tf-btn btn-default">Submit</button>
                    </form>
                
                </div>
            </div>
             <br><br>
        </div>
    </div>
        
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
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.1.11.1.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/SmoothScroll.js"></script>
    <script type="text/javascript" src="js/jquery.isotope.js"></script>

    <script src="js/owl.carousel.js"></script>
	<%con.close(); %>
    <!-- Javascripts
    ================================================== -->
    <script type="text/javascript" src="js/main.js"></script>        
