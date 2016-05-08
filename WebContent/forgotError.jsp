<!DOCTYPE HTML>
<html>
<head>
<title>Forgot Password</title>
<!-- Custom Theme files -->
<link href="css/login.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Static Login Form Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!--script-->
<script src="js/jquery.min.js"></script>
<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
				
</script>	
<!--script-->
<!---Google Analytics Designmaz.net-->
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-35751449-15', 'auto');ga('send', 'pageview');</script>
</head>
<body>
	<div class="head">
		<div class="logo">
			<div class="logo-top">
				<h1>SKETCHnSTIPPLE</h1>
			</div>
			
		</div>		
		<div class="login">
			<div class="sap_tabs">
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Forgot Password</span></li>
						<div class="clearfix"></div>
					</ul>				  	 
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							<div class="login-top">
								<form method="post" action="loginServlet">
									<input type="text" class="email" name="email" placeholder="Email" required=""/>		
                                    <br><br><div class="login-top"><p><font color="red"> The following email is not registered with us.Please try again.</font></p></div>
								<div class="login-bottom">
									<div class="submit">
										<input type="submit" value="SUBMIT"/>
									</div>
									
									</form>
									
									<div class="clear"></div>
								</div>	
							</div>
						</div>
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
						<div class="login-top">
								<form method="post" action="registerServlet">
									<input type="text" class="name active" name="name" placeholder="Your Name" required=""/>
									<input type="text" class="email" name="email" placeholder="Email" required=""/>
									<input type="password" class="password" name="pass"placeholder="Password" required=""/>		
								<div class="login-bottom">
									<div class="submit">
										<input type="submit" value="SIGN UP"/>
									</div>
									</form>
									
									<div class="clear"></div>
								</div>	
							</div>
							
						</div>							
					</div>	
				</div>
			</div>	
		</div>	
		<div class="clear"></div>
	</div>	
	<div class="account">
			<ul>
				<li><p>Back to <a href="index.jsp">Home</a></p></li><span>/</span>
				<li><p><a href="login.jsp">LogIn</a> again</p></li>
				<div class="clear"></div>
			</ul>
		</div>
	<div style="text-align:center; margin-top:10px;">
				<ins class="adsbygoogle"
style="display:block"
data-ad-client="ca-pub-8011246932591811"
data-ad-slot="9844648019"
data-ad-format="auto"></ins> <script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
				</div>
	
</body>
</html>