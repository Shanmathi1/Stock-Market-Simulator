

<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="css/styleForm.css" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script type="text/javascript" src="http://www.html5andcss3.org/form.js"></script>
<script type="text/javascript">
    H5F.listen(window,"load",function () {
      H5F.setup(document.getElementById("formId"));
    },false);
  </script>
</head>
<body>
  <div class="navbar navbar-fixed-top navbar-inverse">
    <div class="container">
      
      <a class="navbar-brand" href="index.jsp">Stock Market Simulator</a>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
        <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> LogIn</a></li>
      </ul>
      
      
    </div><!-- /.container -->
</div><!-- /.navbar -->
 <br><br><br> 

 <form id="formId" action = "Login.action" method = "Post">
<p style ="color:red">${message}</p>

  <h1>Login</h1>
  <h2>Fields marked (*) are required</h2>

  <fieldset>
   <ol>
    
    <li>
   <label for="username">Username *</label>
   <input type="text" id="username" name="username" title="Please enter your registered username" required />
   <!--  
   <p class="validation01">
    <span class="invalid">Please enter a valid email address e.g. username@example.com</span>
    <span class="valid">Your email address is now valid</span>
   </p>
   -->
  </li>
  <li>
     <label for="password">Password *</label>
     <input id="password" name="password" type="password"  required />
     
    </li>
   </ol>
  </fieldset>

  <input type="submit" value="Login" style="background:#00C492; color:#fff;" />

    
 </form>

</body>
</html>
