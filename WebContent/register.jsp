

<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link rel="stylesheet" href="css/styleForm.css" type="text/css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script type="text/javascript" >

	function matchPassword() {
	  		var pass1 = document.getElementById("password");
		    var pass2 = document.getElementById("confirmpassword");

		if(pass2.value!= pass1.value) {
			alert("Passwords Mismatch! Please try again.");
		    return false;
		}
		else{
			return true;
			
		}
		}

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
 
 

 <form id="formId" onsubmit="return matchPassword()" action="RegistrationForm.action"  method = "post">
<p style ="color:red">${message}</p>
  <h1>Sign Up Form</h1>
  <h2>Fields marked (*) are required</h2>

  <fieldset>
   <ol>
    <li>
     <label for="username">Username *</label>
     <input type="text" id="username" name="username" required />
    </li>
   <!--   <li>
    <label for="lastname">Last Name *</label>
    <input type="text" id="lastname" name ="lastname" placeholder="Last Name" required />
    </li> -->
    <li>
   <label for="email">Email *</label>
   <input type="text" id="email" name="email" placeholder="e.g. username@example.com" title="Please enter a valid email" required pattern="^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$" />
   <p class="validation01">
    <span class="invalid">Please enter a valid email address e.g. username@example.com</span>
    <span class="valid">Your email address is now valid</span>
   </p>
  </li>
  <li>
     <label for="password">Password *</label>
     <input id="password" name="password" type="password" title="Minimum 8
characters, one number, one uppercase and one lowercase letter" required
pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*" />
     <p class="validation01">
      <span class="invalid">Minimum 8 characters, one number, one uppercase letter and one lowercase letter</span>
      <span class="valid">Your password meets our requirements, thank you.</span>
     </p>
    </li>
    <li>
    <label for = "confirmpassword">Confirm Password *</label>
    <input id="confirmpassword" name="confirmpassword" type="password" title="Re-type password" required/>
    </li>
    
   </ol>
  </fieldset>

  <input type="submit" value="Sign up" style="background:#00C492; color:#fff;" />

    
 </form>


</body>
</html>
