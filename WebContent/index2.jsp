<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Stock Market Simulator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<script type="text/javascript">
        function validate() {
            var x, y, z;
    
            x = document.getElementById("username").value.toString();
            y = document.getElementById("email").value.toString();
            z = document.getElementById("password").value.toString();

            // make sure the username is at least 6 characters in length
            if (x.length<6) {
                alert("Invalid username. Username must be at least 6 characters in length.");
                return false;
            }
            // simple check for '@' in email
            else if (y.indexOf('@') < 0) {
                alert("Invalid email.");
                return false;
            }
            // check that the pasword is at least 8 characters long (for now)
            else if (z.length<8) {
                alert("Invalid Password. User password must be at least 8 characters in length.");
              return false;  
            }
            else 
            	return true;
            
            
        }
    </script> 

    <div id="tooltip" class="hidden">
            <p><strong>Stock Info</strong></p>
            <p><span id="value">100</span></p>
    </div>

    <div class="menu main">
    <p>${message}</p>
        <h1>Stock Market Simulator</h1>
        <button class="signup">Sign Up</button>
        <button class="login">Login</button>
        <button class="learnmore">Learn More</button>
        <button class="vischart">Stock Chart</button>
    </div>

    <div class="menu signup">
        <h1>Sign Up:</h1>
 <!--This used to be in the form below: action="RegistrationForm.action"  -->

        <form name = "signupform" id="signupform" action="RegistrationForm.action"  method = "post">
            <label>Username:</label>
            <input type="text" name="username" id="username">

            <label>Email:</label>
            <input type="text" name="email" id="email">

            <label>Choose Password:</label>
            <input type="password" name="password" id="password">
        </form>

        <button class="signup" type = "Submit" form ="signupform" onclick="return validate()">Sign Up</button>
        <button class="exit">Exit</button>
    </div>

    <div class="menu login">
        <h1>Log In:</h1>

        <form action = "Login.action" method = "Post" id="loginform">
            <label>User Name:</label>
            <input type="text" name="username">

            <label>Password:</label>
            <input type="password" name="password">
        </form>

        <button class="login" form="loginform" type="submit">Log In</button>
        <button class="exit">Exit</button>

    </div>

    <div class="menu learnmore">
        <h1>Learn More</h1>

        <p>
            Stock Market Trading Simulator allows you to experience all of the excitement of investing without the risk of losing your money!
        </p>

        <p>
            With up to date stock information on all publicly traded companies, the investments you make in Stock Market Trading Simulator mirror what would happen if you were to invest in the real world. You'll have company information at your fingertips such as each company's name, symbol, and industry, share information such as opening and closing prices and high and low points after each day's end, and the volume of available shares. Plus, all of this information is available stretching back years, meaning you'll have all the information you need to make an informed decision on whether or not to invest.
        </p>

        <p>
            Learn the ins-and-outs of investing with Stock Market Trading Simulator and become the next mogul of Wall Street!
        </p>

        <p>
            Sign up now and receive $100 in virtual currency to begin investing!
        </p>



        <button class="exit">Exit</button>

    </div>

    <div id="StockChart" style="display:none;">
    	<button class="exit">Exit</button>
        <h1 class="chart">
            High, Low, and Closing Share Price
        </h1>
    </div>

    <!-- JavaScript
        ================================================== -->
    <script type="text/javascript"  src="d3.js" charset="utf-8"></script>
    <script  type="text/javascript" src="app.js" charset="utf-8"></script>

    <!-- Application lib: Main.js  -->
    <script type="text/javascript">

        var chart;

        function selection(element) {
            return function() {
                d3.selectAll("div.menu").style("display", "none")
                d3.select(element).style("display", "block")
            }
        }

        d3.selectAll("button.signup").on("click", selection("div.signup"))
        d3.selectAll("button.exit").on("click", selection("div.main"))
        d3.selectAll("button.login").on("click", selection("div.login"))
        d3.selectAll("button.learnmore").on("click", selection("div.learnmore"))

        d3.selectAll("button.vischart").on("click", function() {
            d3.selectAll("div.menu.main").style("display", "none")
            d3.select("svg").remove();
            chart = Start();

            var stockDataFileName = "test.csv"
            
            chart.plot(stockDataFileName);
            d3.select("#StockChart").style("display", "block");
        })


    </script>

</body>

</html>