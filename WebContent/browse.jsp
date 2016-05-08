<!Doctype html>

<%@page import="java.util.ArrayList"%>
<html lang="en">

<head>

  <!-- Basic -->
  <title>Art Section</title>

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
                <a class="active" href="">Browse</a>  
              </li>
               <li>
                <a  href="bidding.jsp">Bid</a>  
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
    <div class="container">
        <div class="section-title">
            <br><br>
                <h2> <strong>Art Section</strong></h2>
                <br>
                <div class="clearfix"></div>
    </div> 
    </div> 
     <%@ page import="java.lang.Math" %> 
     <%@ page import="java.sql.*" %>
        <%
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","System","oracle");
			
			Statement st2,st = con.createStatement(); st2 = con.createStatement();
			ResultSet rs, rs2;
		%>
		
    <% rs = st.executeQuery("select name from catdetails");
       	rs.next();
        ArrayList<String> cat = new ArrayList<String>();
        cat.add(rs.getString("name")); rs.next();
        cat.add(rs.getString("name")); rs.next();
        cat.add(rs.getString("name")); rs.next();
        cat.add(rs.getString("name"));
        
        rs= st.executeQuery("select COUNT(*) from "+ cat.get(0));
        rs.next();
        int no =(int)((rs.getInt(1)*Math.random())+1);		
   
        rs = st.executeQuery("select * from "+cat.get(0)+ " where sno='"+no+"'");
        rs.next();
      %>  
    <div class="container">
        <div class="row text-center">

            <div class="col-md-3 col-sm-6 hero-feature">
                <div class="thumbnail">
                    <img src="img/browse/Contemporary/<%=rs.getString("img") %>" data-src="" alt="">
                    <div class="caption">
                        <h3><a href="browse.jsp?type=<%=cat.get(0) %>"><font color=#999 ><%=cat.get(0) %></font></a></h3>
                        
                        
                    </div>
                </div>
            </div>
			<%  rs= st.executeQuery("select COUNT(*) from "+ cat.get(1));
	            rs.next(); 
			   no =(int)((rs.getInt(1)*Math.random())+1);
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
			   no =(int)((rs.getInt(1)*Math.random())+1);
			   rs = st.executeQuery("select * from "+cat.get(2)+ " where sno='"+no+"'");
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
			  no =(int)((rs.getInt(1)*Math.random())+1);
			   rs = st.executeQuery("select * from "+cat.get(3)+ " where sno='"+no+"'");
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
      
      <!-- Start Browse Section -->
    <div class="section full-width-portfolio" style="border-top:0; border-bottom:0; background:#fff;">

	<% String type=null;
	//System.out.println(request.getParameter("type"));
		if(request.getParameter("type")==null)
			type="Contemporary";
		else
			type = request.getParameter("type");
		
		rs = st.executeQuery("select * from "+type);
		rs.next();
		
		rs2 = st2.executeQuery("select detail from catdetails where name='"+type+"'");
		rs2.next();
		%>
      <!-- Start Big Heading -->
      <div class="big-title text-center" data-animation="fadeInDown" data-animation-delay="01">
        <h1><strong><%=type %> Art</strong></h1>
      </div>
      <!-- End Big Heading -->

      <p class="text-center"><%=rs2.getString("detail") %></p>

	<%-- <% rs.next();rs.next(); %> --%>
      <!-- Start Recent Projects Carousel -->
      <ul id="portfolio-list" data-animated="fadeIn">
       <li>
	       <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
	       <div class="thumbnail">
	           <img src="img/browse/<%=type %>/<%=rs.getString("img") %>" alt="" />
	       </div>
	       </a>
          <div class="portfolio-item-content">
          <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
            <span class="header">Mainichi April 2014</span>
            <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
            </a>
          </div>
        </li>
        <%rs.next(); %>
        <li>
	       <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
	       <div class="thumbnail">
	           <img src="img/browse/<%=type %>/<%=rs.getString("img") %>" alt="" />
	       </div>
	       </a>
          <div class="portfolio-item-content">
          <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
            <span class="header">Mainichi April 2014</span>
            <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
            </a>
          </div>
        </li>
       <%rs.next(); %>
        <li>
	       <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
	       <div class="thumbnail">
	           <img src="img/browse/<%=type %>/<%=rs.getString("img") %>" alt="" />
	       </div>
	       </a>
          <div class="portfolio-item-content">
          <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
            <span class="header">Mainichi April 2014</span>
            <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
            </a>
          </div>
        </li>
        <%rs.next(); %>
        <li>
	       <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
	       <div class="thumbnail">
	           <img src="img/browse/<%=type %>/<%=rs.getString("img") %>" alt="" />
	       </div>
	       </a>
          <div class="portfolio-item-content">
          <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
            <span class="header">Mainichi April 2014</span>
            <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
            </a>
          </div>
        </li>
        <%rs.next(); %>
        <li>
	       <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
	       <div class="thumbnail">
	           <img src="img/browse/<%=type %>/<%=rs.getString("img") %>" alt="" />
	       </div>
	       </a>
          <div class="portfolio-item-content">
          <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
            <span class="header">Mainichi April 2014</span>
            <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
            </a>
          </div>
        </li>
        <%rs.next(); %>
        <li>
	       <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
	       <div class="thumbnail">
	           <img src="img/browse/<%=type %>/<%=rs.getString("img") %>" alt="" />
	       </div>
	       </a>
          <div class="portfolio-item-content">
          <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
            <span class="header">Mainichi April 2014</span>
            <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
            </a>
          </div>
        </li>
        <%rs.next(); %>
        <li>
	       <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
	       <div class="thumbnail">
	           <img src="img/browse/<%=type %>/<%=rs.getString("img") %>" alt="" />
	       </div>
	       </a>
          <div class="portfolio-item-content">
          <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
            <span class="header">Mainichi April 2014</span>
            <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
            </a>
          </div>
        </li>
        <%rs.next(); %>
         <li>
	       <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
	       <div class="thumbnail">
	           <img src="img/browse/<%=type %>/<%=rs.getString("img") %>" alt="" />
	       </div>
	       </a>
          <div class="portfolio-item-content">
          <a class="lightbox" title="<%=rs.getString("title") %>" href="img/browse/<%=type %>/<%=rs.getString("img") %>">
            <span class="header">Mainichi April 2014</span>
            <p class="body">web develpment, design<br><br><br><br><br><br><br><br><br><br><br></p>
            </a>
          </div>
        </li>
        
        </ul>
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
