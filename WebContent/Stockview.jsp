<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stock View</title>
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
<p>Welcome ${user} you have $${money} in your wallet!!</p>
<a href="index.jsp" class= "url">Exit</a>

<form action = "Retrievecompanystock.action" method ="post">

<label>Enter Company Symbol:</label>

<input type = "text" name = "SymbolName"></input>
<button type = "submit" >Search</button>
<button type = "reset">Reset</button>



</form>

   
				


</body>
</html>