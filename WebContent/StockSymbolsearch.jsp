<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock Symbol Search Result</title>
<style type="text/css">
body{
background-color: #7ca0ba;

}
a{
    position: absolute;
    top: 0px;
    right: 0px;
    
}
</style>
</head>

<body>
    <!-- JavaScript
        ================================================== -->
    <script type="text/javascript"  src="d3.js" charset="utf-8"></script>
    <script  type="text/javascript" src="app.js" charset="utf-8"></script>

    <!-- Application lib: Main.js  -->
    <script type="text/javascript">

        var chart;

        d3.selectAll("button.vischart").on("click", function() {
 			console.log("Work fucker")
        	d3.selectAll("div.menu.main").style("display", "none")
            d3.select("svg").remove();
            chart = Start();

            var stockDataFileName = "test.csv"
            chart.plot(stockDataFileName);
            d3.select("#StockChart").style("display", "block");
        })


    </script>


<a href="index.jsp" class= "url">Exit</a>
<div>
<button class="vischart">Stock Chart</button>
<table border="1" style="width:60%">
<tr><td>Stock Symbol</td><td>${CompanySymbol}</td></tr>
<tr><td>Company Name</td><td>${Companyname}</td></tr>
<tr><td>Price</td><td>${price}</td></tr>
<tr><td>Volume</td><td>${volume}</td></tr>
<tr><td>PE</td><td>${Pe}</td></tr>
<tr><td>EPS</td><td>${Eps}</td></tr>
<tr><td>Week 52 Low</td><td>${Week52low}</td></tr>
<tr><td>Week 52 High</td><td>${Week52high}</td></tr>
<tr><td>Day Low</td><td>${Daylow}</td></tr>
<tr><td>Day High</td><td>${Dayhigh}</td></tr>
<tr><td>Moving Avg. 50 Day</td><td>${Movingav50day}</td></tr>
<tr><td>Marketcap</td><td>${Marketcap}</td></tr>
</table>
</div>
</body>
</html>