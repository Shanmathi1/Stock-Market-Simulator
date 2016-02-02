<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "com.stock.Jdbcdao.*" %>
<%@ page import = "java.sql.*" %>


<html>

<head>
    <title>Welcome</title>
    <link href="css/ticker.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/ticker.js">
    </script>
    <script type="text/javascript" src="js/fav.js">
    </script>
    <script type="text/javascript" src="js/stocks.js">
    </script>
    <script src="http://yui.yahooapis.com/3.18.1/build/yui/yui-min.js">
  </script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <script type="text/javascript">
    
    
            
    
    $(window).load(function() {
            StockPriceTicker();
            getLatestvalues();
            setInterval(function() {
                StockPriceTicker();
            }, 60000);
            document.getElementById('service').style.visibility = 'hidden';
            document.getElementById('rssfeed').style.visibility = 'hidden';
            /*main();   */
        });
        // run


    </script>

    <link href="css/styleSearch.css" type="text/css" rel="stylesheet">
    

    <link href="css/styleTable.css" type="text/css" rel="stylesheet">
    <link href="css/Normalize.css" type="text/css" rel="stylesheet">
</head>

<body style="background-color:#333333">


    <div class="navbar navbar-fixed-top navbar-inverse">
        <div class="container">

            <a class="navbar-brand" href="index.jsp">Stock Market Simulator</a>
            <ul class="nav navbar-nav navbar-right">
                
                <li><a href="#" data-target="#learnMore" data-toggle="modal"><span class="glyphicon glyphicon-list-alt"></span> Learn More</a>
                </li>
                <li><a href="index.jsp"><span class="glyphicon glyphicon-log-out"></span> LogOut</a>
                </li>
            </ul>


        </div>
        <!-- /.container -->
    </div>
    <!-- /.navbar -->
    <br>
    <br>
    <br>

    <div id="StockTickerContainer" style="height: 32px; line-height: 32px; overflow: hidden;">
        <div id='dvStockTicker' class='stockTicker'>
        </div>
    </div>
    <br>
    <br>
    <ul class="nav nav-tabs">
        <li class="active">
            <a data-toggle="tab" href="#portfolio">
                <icon class="glyphicon glyphicon-home"></icon> My Portfolio</a>
        </li>
        <li>
      <a data-toggle="tab" href="#market"><icon class="glyphicon glyphicon-stats"></icon> Market</a>
    </li>
        
        <li>
            <a data-toggle="tab" href="#search">
                <icon class="glyphicon glyphicon-search"></icon> Search</a>
        </li>
    </ul>
    
    <!-- Modal Learn More -->

      <div id="learnMore" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Learn More</h4>
      </div>
      <div class="modal-body">
        <p align="justify">

            Stock Market Trading Simulator allows you to experience all of the excitement of investing without the risk of losing your money!
            <br><br>
            With up to date stock information on all publicly traded companies, the investments you make in Stock Market Trading Simulator mirror what would happen if you were to invest in the real world. 
            <br><br>
            You'll have company information at your fingertips such as each company's name, symbol, and industry, share information such as opening and closing prices and high and low points after each day's end, and the volume of available shares. 
            <br><br>
            Plus, all of this information is available stretching back years, meaning you'll have all the information you need to make an informed decision on whether or not to invest.
            <br><br>
            Learn the ins-and-outs of investing with Stock Market Trading Simulator and become the next mogul of Wall Street!
            <br><br>
            Sign up now and receive $1000 in virtual currency to begin investing!
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    <div class="tab-content">
        <div id="portfolio" class="tab-pane fade in active">

            <br>
            <p class="title-name">
            <%String s = (String)session.getAttribute("username"); 
            Viewvirtualmoney money = new Viewvirtualmoney();
            try{
            ResultSet rst = money.displayVirtualMoney(s);
            
            if(rst.next()){
               %>
            
            
            Welcome <%=s %></p>
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        
                        <div class="col-md-6">
                            <p class="money"> Amount of Virtual Money: </p>
                        </div>
                        <div class="col-md-6">
                            <p class="money">$<span id="virtualMoney">
                            
                            <%= rst.getString(4) %>
                            <%}} catch(SQLException e) {
                            	
                            	e.printStackTrace();
                            }%>
                            
                            
                            
                            
                            
                            
                           </span></p>
                        </div>

                        
                    </div>
                    <br>
                    <div class="row">

                        <div class="col-md-3">
                            <label for="money" class="money" style="text-align:left">Buy More:</label>
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control custom" id="money" placeholder="Amount">
                            <script>
                            $("#money").keyup(function(){
                            	
                            	if($("#money").val()== "")
                            		
                            		$("#buyvirutalmoneybutton").prop('disabled',true);
                            		
                            		
                            	else
                            	
                            		$("#buyvirutalmoneybutton").prop('disabled',false);
                            		
                            	
                            	
                            	
                            })
                            
                            </script>
                            
                            
                        </div>

                        <div class="col-md-6">
                        <button type="submit" id = "buyvirutalmoneybutton" class="btn btn-default" data-toggle="modal" data-target="#myModalMain" onclick="myFunctionPayment()" disabled>Buy<span class="glyphicon glyphicon-shopping-cart"></span>
                            </button> 
                        </div>

                    </div>
                </div>
                
                <div class="col-md-6">

                                    <div class="row">

                        <div class="col-md-3">
                            <label for="quantity" class="money" style="text-align:left">Quantity:</label>
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control custom" id="quantity" placeholder="#Shares">
                            <script>
                            $("#quantity").keyup(function(){
                            	
                            	if($("#quantity").val()== "")
                            		
                            		$("#sellsharesbutton").prop('disabled',true);
                            		
                            		
                            	else
                            	
                            		$("#sellsharesbutton").prop('disabled',false);
                            		
                            	
                            	
                            	
                            })
                            
                            </script>
                            
                            
                        </div>

                        <div class="col-md-6">
                        <button id = "sellsharesbutton"type="submit" class="btn btn-default" data-toggle="modal" data-target="#myModalSell" onclick="myFunctionSell()" disabled>Sell
                            </button> 
                            <script>
                                            function myFunctionSell() {

                                            	
                                            	var a = $("#quantity").val();
                                            	var b = $(".selectedshare:checked").closest("tr").find("td").eq(3).text();
                                            	var c = parseInt(a);
                                            	var d = parseInt(b);
                                            	var e = parseFloat($(".selectedshare:checked").closest("tr").find("td").eq(5).text());
                                            	$("#companyname").html($(".selectedshare:checked").closest("tr").find("td").eq(2).text());
                                            	$("#companysymbol").html($(".selectedshare:checked").closest("tr").find("td").eq(1).text());
                                            	$("#pricepershare").html(e.toFixed(2));
                                            	$("#noofshares").html($(".selectedshare:checked").closest("tr").find("td").eq(3).text());
                                            	$("#requestedshares").html(c);
                                            	if (c > d)
                                            		
                                            	{	
                                            	document.getElementById("sharesellmessage").innerHTML = "You Do Not Have Enough Shares To Sell !!"
                                                document.getElementById("sharesellmessage").className = "redText";
                                                document.getElementById('sellsubmit').style.visibility = 'hidden';	
                                                document.getElementById("selltotal").innerHTML = ""	;
                                            	}
                                            	else {
                                            		document.getElementById("sharesellmessage").innerHTML = "You Have Enough Shares To Sell"
                                                    document.getElementById("sharesellmessage").className = "greenText";
                                                    document.getElementById('sellsubmit').style.visibility = 'visible';	
                                                    document.getElementById("selltotal").innerHTML = "$" + (c*e).toFixed(2);
                                                    document.forms.namedItem("sellshareform").sellsymbol.value = $(".selectedshare:checked").closest("tr").find("td").eq(1).text();
                                                    document.forms.namedItem("sellshareform").sellquantity.value = c;
                                                    document.forms.namedItem("sellshareform").selltotalcost.value = (c*e).toFixed(2);
                                                    
                                            	}
                                            }
                                            	
                                            	                                                                                            
                                        </script>
                            
                            
                            
                            
                        </div>

                    </div>
                    
                    <table id="userShareTable" class="rwd-table" style="border: 1px solid black;" width="400">
                                        <tbody>
                                            <tr style="font-size: 14px; font-family: Arial,Helvetica,sans-serif; font-weight: bold; color:#DDDD55;">
                                                <td>Sell</td>
                                                <td>Symbol</td>
                                                <td>Company</td>
                                                <td>No.of Shares</td>
                                                <td>RatePurchased</td>
                                                <td>RateToday</td>

                                            </tr>
                                            
 <%
 Viewownstock view = new Viewownstock();
 try{
 ResultSet rs = view.Displayownstock(s);
 while (rs.next()) 
 {
 %>
 
 
 
 
                                            <tr style="font-family: Arial,Helvetica,sans-serif; font-size: 14px; padding: 0px 2px;">
                                            <td><input type = "radio" name = "selectedshare" class = "selectedshare"></td>
                                                <td ><%= rs.getString(1)%></td>
                                                <td ><%= rs.getString(2)%></td>
                                                <td ><%= rs.getInt(3) %></td>
                                                <td ><%= rs.getDouble(4) %></td>
                                                <td ></td>
                                                                                            </tr>
                                            
                                                
<% } %>

<% } catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} %>
                        
 

                                        </tbody>
                                    </table>

                </div>
            </div>
            <script>
                function myFunctionPayment() {
                    var y;
                    if (document.getElementById("money").value == "") {
                        y = parseInt(0);
                    } else {
                        y = parseFloat(document.getElementById("money").value);
                    }
                    document.getElementById("total").innerHTML = "$" + (y/100).toFixed(2);
                    var z = parseFloat(document.getElementById("money").value);
                    document.getElementById("virtualmoney").innerHTML = "$" + z.toFixed(2);
                }
            </script>
            
            <!-- Modal -->
            <div class="modal fade" id="myModalMain" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Payment</h4>
                        </div>
            <div class="modal-body">
                <span id="title" hidden style="color:red; align-content:center">Please enter all necessary information</span>

                <div class="control-group">
                    <label label-default="" class="control-label">Card Holder's Name</label>
                    <div class="controls inner-addon left-addon">
                        <i class="glyphicon glyphicon-user"></i>
                        <input type="text" class="form-control" pattern="\w \w" name="payerName" id="payerName" title="First and last name" placeholder="First and Last Name" required pattern="\w \w">
                    </div>
                    <span id="cardholdername" hidden style="color:red">Please enter first and last names from the card</span>
                </div>
                <div class="control-group">
                    <label label-default="" class="control-label">Card Number</label>
                    <div class="controls inner-addon left-addon">
                        <i class="glyphicon glyphicon-credit-card"></i>
                        <input type="text" class="form-control" autocomplete="off" maxlength="16" pattern="\d{16}" name="digits" id="digits" placeholder="Card Number" required="">
                    </div>
                    <span id="ccnumber" hidden style="color:red">16-digit credit card number must be entered without dashes</span>
                </div>
                <div class="control-group">
                    <label label-default="" class="control-label">Card Expiry Date</label>
                    <div class="controls">
                        <div class="row">
                            <div class="col-md-9">
                                <select class="form-control" name="cc_exp_mo">
                                    <option value="01">January</option>
                                    <option value="02">February</option>
                                    <option value="03">March</option>
                                    <option value="04">April</option>
                                    <option value="05">May</option>
                                    <option value="06">June</option>
                                    <option value="07">July</option>
                                    <option value="08">August</option>
                                    <option value="09">September</option>
                                    <option value="10">October</option>
                                    <option value="11">November</option>
                                    <option value="12">December</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <select class="form-control" name="cc_exp_yr">
                                    <option>2015</option>
                                    <option>2016</option>
                                    <option>2017</option>
                                    <option>2018</option>
                                    <option>2019</option>
                                    <option>2020</option>
                                    <option>2021</option>
                                    <option>2022</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="control-group">
                    <label label-default="" class="control-label">Card CVV</label>
                    <div class="controls">
                        <div class="row">
                            <div class="col-md-3">
                                <input type="text" class="form-control" autocomplete="off" maxlength="3" name="cvv" id="cvv" pattern="\d{3}" title="Three digits at back of your card" placeholder="CVV" required="">
                            </div>
                            <div class="col-md-8"></div>

                        </div>
                    </div>
                    <span id="cvvnumber" hidden style="color:red">Please provide the 3-digit CVV number from the back of your card</span>
                </div>
                <br>
                <div class="control-group">
                    <label label-default="" class="control-label">Rate:</label>
                    <p><label label-default="" class="control-label">$100 in virtual currency = $1.00 in actual money</label></p>
                </div>
                <hr>
                <div class="control-group">
                    <b> Order Total: </b>
                    <p id="total"> </p>
                </div>
            </div>


                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" onClick="clearPaymentModal()">Cancel</button>
                            <button type="button" class="btn btn-primary" onclick = "return AddVirtualMoney()">Submit</button>
                        
                        <script>
                        function AddVirtualMoney(){
                        	if (document.getElementById("payerName").value == "" &&
                        	        document.getElementById("digits").value == "" &&
                        	        document.getElementById("cvv").value == "") {

                        	        $("#title").prop("hidden", false);
                        	        return false;
                        	    }
                        	    else $("#title").prop("hidden", true);

                        	    var regexp1 = new RegExp(document.getElementById("payerName").pattern);
                        	    var regexp2 = new RegExp(document.getElementById("digits").pattern);
                        	    var regexp3 = new RegExp(document.getElementById("cvv").pattern);

                        	    if (!regexp1.test(document.getElementById("payerName").value)){
                        	        $("#cardholdername").prop("hidden",false);
                        	     return false;   
                        	    }
                        	    else
                        	        $("#cardholdername").prop("hidden",true);

                        	    if (!regexp2.test(document.getElementById("digits").value)){
                        	        $("#ccnumber").prop("hidden",false);
                        	        return false;
                        	    }
                        	    else
                        	        $("#ccnumber").prop("hidden",true);

                        	    if (!regexp3.test(document.getElementById("cvv").value)){
                        	        $("#cvvnumber").prop("hidden",false);
                        	        return false;
                        	    }
                        	    else
                        	        $("#cvvnumber").prop("hidden",true); 

                        	var a = parseFloat(document.getElementById("money").value).toFixed(2);
                        	document.forms.namedItem("formvirtualmoney").additionalvirtualmoney.value = a;	
                        	document.forms.namedItem("formvirtualmoney").submit();
                        	return true;
                        	
                        
                        }
                        
                        function clearPaymentModal() {
                            $("#payerName").val('');
                            $("#digits").val('');
                            $("#cvv").val('');

                            $("#cvvnumber").prop("hidden",true);
                            $("#ccnumber").prop("hidden",true);
                            $("#cardholdername").prop("hidden",true);
                        }
                        
                        $(document).ready(function() {
                            $('#myModalMain').on('hidden.bs.modal', function () {
                            	clearPaymentModal();
                            })
                        })
                        
                        
                        
                        </script>
                        
                        
                        </div>
                    </div>
                </div>
            </div>
<form name = "formvirtualmoney" id  = "formvirtualmoney" action = "BuyMoney.action">
<input type = "hidden" id = "additionalvirtualmoney" name = "money">


</form>



<!-- myModalSell -->
            <div class="modal fade" id="myModalSell" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                            </button>
                            <h4 class="modal-title" id="myModalLabel">Sell Shares</h4>
                        </div>
                        <div class="modal-body">
                            <div class="control-group">
                                <b>Company Name:</b>
                              <span id="companyname"></span>  
                            </div>
                            <br>
                            
                            <div class="control-group">
                                <b>Company Symbol:</b>
                              <span id="companysymbol"></span>  
                            </div>
                            <br>
                            
                            <div class="control-group">
                                <b>Latest Price Per Share:</b>
                                <span id="pricepershare"></span> 
                            </div>
                            <br>
                            <div class="control-group">
                                <b>Shares Available:</b>
                                <span id="noofshares"></span>
                                                            </div>
                                                            <br>
                                                            <div class="control-group">
                                <b>Shares Requested To Sell:</b>
                                <span id="requestedshares"></span>
                                                            </div>
                                                            <br>
                            <div class="control-group">
                                
                                <span id="sharesellmessage"></span>
                                                            </div>
                            <hr>
                            <div class="control-group">
                                <b> Total: </b>
                                <p id="selltotal"> </p>
                            </div>
                        </div>


                        <div class="modal-footer">
                            <button type="button" id = "sellcancel" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="button" id = "sellsubmit" class="btn btn-primary" onclick = "SellShares()">Submit</button>
                        <script>
                        function SellShares(){
                        	                            
                        	document.forms.namedItem("sellshareform").submit();       
                        	
                        	
                        }
                        </script>
                        
                        </div>
                    </div>
                </div>
            </div>

        
        </div>
        
        <form name = "sellshareform", id = "sellshareform", action = "SellStock.action">
        
        <input type = "hidden" id = "sellsymbol" name = "symbol">
        <input type = "hidden" id = "sellquantity" name = "quantity">
        <input type = "hidden" id = "selltotalcost" name = "totalcost">
        
        
        </form>
        
                    
        
        
        
            <div class="tab-pane fade" id="market">
      <br><br>
<div class="row">

   <div class="col-md-6">
<iframe frameborder="0" scrolling="yes" height="500" width="580" allowtransparency="true" marginwidth="0" marginheight="0" src="http://eqrates.investing.com/index.php?pairs_ids=277;347;6369;6408;474;243;282;346;396;238;284;247;240;260;241;271;352;6974;7888;26490;8193;308;280;251;8082;8177;267;287;272;252;334;409;402;305;651;295;469;667;7997;7992;&header-text-color=%230058b0&header-bg=%23ffffff&curr-name-color=%230058b0&inner-text-color=%23000000&green-text-color=%232A8215&green-background=%23B7F4C2&red-text-color=%23DC0001&red-background=%23FFE2E2&inner-border-color=%23CBCBCB&border-color=%23cbcbcb&bg1=%23F6F6F6&bg2=%23ffffff&last_update=show"></iframe>
</div>

<div class="col-md-1">
</div>

  <div class="col-md-2">
    
  <iframe frameborder="0" scrolling="no" height="500" width="500" allowtransparency="true" marginwidth="0" marginheight="0" src="http://tools.investing.com/market_quotes.php?tabs=1,2,3,4&tab_1=1,2,3,5,7,9,11,13,18,39&tab_2=27,166,167,168,170,172,174,175,176,40830&tab_3=8830,8831,8833,8836,8849,8862,8883,8910,8917,8988&tab_4=8880,8907,8900,8899,8886,8895,8905,8906,8986,13917&select_color=000000&default_color=0059b0"></iframe><br />
 
   </div>

<div class="col-md-3">
</div>

    </div>
    </div>
        
        

        <div id="search" class="tab-pane fade">

            <div class="row">
                <div class="col-md-6">

                <table width="90%" border="0" cellpadding="0" cellspacing="0" align="center">
                    <tbody>
                        <tr valign="top">
                            <td class="normalText" align="left">
                                <div class="row">
                                    <div class="col-md-6 yui3-skin-sam">
                      <style>
                                            #ac-input {
                                            width: 17em;
                                            }
                                            .yui3-aclist {
                                            width: 17em;
                                            }
                      </style><!--
<input name="txtQuote" class="form-control" id="symbol" onkeypress="return CheckEnter(event);" value="YHOO" type="text" />
-->
                      <span><input class="form-control" id="ac-input" name=
                      "txtQuote" onkeypress="return CheckEnter(event);" style=
                      "display: inline;" type="text" value="YHOO"> 
                      <script src="js/auto_complete.js">
                      </script> <button class="btn btn-default" id="btnQuote"
                      onclick="return SendRequest();" type=
                      "submit"><span><span><span class=
                      "glyphicon glyphicon-search"></span></span></span></button></span>
                    </div>
                                    <div class="col-md-3">
                                        <input type="text" class="form-control" id="shares" placeholder="No.of Shares">
                                        
                                        <script>
                            $("#shares").keyup(function(){
                            	
                            	if($("#shares").val()== "")
                            		
                            		$("#buystockbutton").prop('disabled',true);
                            		
                            		
                            	else
                            	
                            		$("#buystockbutton").prop('disabled',false);
                            		
                            	
                            	
                            	
                            })
                            
                            </script>
                                    </div>
                                    <div class="col-md-3">
                                        <button id = "buystockbutton"type="submit" class="btn btn-default" data-toggle="modal" data-target="#myModal" onclick="myFunction()" disabled>Buy<span class="glyphicon glyphicon-shopping-cart"></span>
                                        </button>
                                        <script>
                                            function myFunction() {


                                                var x = parseFloat(document.getElementById("shareTable").rows[1].cells.namedItem("result").innerHTML);
                                                document.getElementById("oneShare").innerHTML = "$" + x.toFixed(2);

                                                var y;
                                                if (document.getElementById("shares").value == "") {
                                                    y = parseInt(0);
                                                } else {
                                                    y = parseInt(document.getElementById("shares").value);
                                                }

                                                document.getElementById("totalAmount").innerHTML = "$" + (x * y).toFixed(2);
                                                var z = parseFloat(document.getElementById("virtualMoney").innerHTML);
                                                document.getElementById("moneyVirtual").innerHTML = "$" + z.toFixed(2);
                                                if (parseFloat(x * y) <= parseFloat(z)) {
                                                    document.getElementById("resultShare").innerHTML = "You have money to buy the shares";
                                                    document.getElementById("resultShare").className = "greenText";
                                                    document.getElementById('buyShare').style.visibility = 'visible';
                                                } else {
                                                    document.getElementById("resultShare").innerHTML = "You do not have money to buy the shares";
                                                    document.getElementById("resultShare").className = "redText";
                                                    document.getElementById('buyShare').style.visibility = 'hidden';
                                                }

                                            }
                                        </script>
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                                                    </button>
                                                    <h4 class="modal-title" id="myModalLabel">Buy Share</h4>
                                                </div>
                                                <div class="modal-body">

                                                    <div class="control-group">
                                                        <b> Value of one share: </b>
                                                        <span id="oneShare"> </span>
                                                    </div>
                                                    <br>
                                                    <div class="control-group">
                                                        <b> Total Amount: </b>
                                                        <span id="totalAmount"> </span>
                                                    </div>
                                                    <br>
                                                    <div class="control-group">
                                                        <b> Amount of virtual money: </b>
                                                        <span id="moneyVirtual"> </span>
                                                    </div>
                                                    <br>
                                                    <div class="control-group">
                                                        <span id="resultShare"> </span>
                                                        <br>
                                                    </div>
                                                </div>


                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                    <button type="button" id="buyShare" onclick ="buystock()"class="btn btn-primary">Buy</button>
                                                    
                                                    <form id=stockbuy method = "Post" action="BuyStock.action">
                                                    <input type = "hidden" name = "symbol">
                                                    <input type = "hidden" name = "companyname">
                                                    <input type = "hidden" name = "quantity">
                                                    <input type = "hidden" name = "totalcost">
                                                    </form>
                                                    
                                                    <script>
                                                    function buystock(){
                                                    	var x = parseFloat(document.getElementById("shareTable").rows[1].cells.namedItem("result").innerHTML);
                                                    	var p = document.getElementById("shareTable").rows[1].cells.namedItem("name").innerHTML;
                                                    	var q = document.getElementById("shareTable").rows[1].cells.namedItem("company").innerHTML;
                                                    	
                                                    	
                                                    	
                                                        document.getElementById("oneShare").innerHTML = "$" + x.toFixed(2);

                                                        var y;
                                                        if (document.getElementById("shares").value == "") {
                                                            y = parseInt(0);
                                                        } else {
                                                            y = parseInt(document.getElementById("shares").value);
                                                        }

                                                        document.getElementById("totalAmount").innerHTML = "$" + (x * y).toFixed(2);
                                                        var z = parseFloat(document.getElementById("virtualMoney").innerHTML);
                                                        document.getElementById("moneyVirtual").innerHTML = "$" + z.toFixed(2);
                                                        if (parseFloat(x * y) <= parseFloat(z)) {
                                                            document.getElementById("resultShare").innerHTML = "You have money to buy the shares";
                                                            document.getElementById("resultShare").className = "greenText";
                                                            document.getElementById('buyShare').style.visibility = 'visible';
                                                            document.forms.namedItem("stockbuy").symbol.value = p;
                                                            document.forms.namedItem("stockbuy").companyname.value = q;
                                                        	document.forms.namedItem("stockbuy").quantity.value = y;
                                                        	document.forms.namedItem("stockbuy").totalcost.value = parseFloat(x*y).toFixed(2);
                                                        	document.forms.namedItem("stockbuy").submit();                                                     	
                                                        	
                                                            
                                                        } else {
                                                            document.getElementById("resultShare").innerHTML = "You do not have money to buy the shares";
                                                            document.getElementById("resultShare").className = "redText";
                                                            document.getElementById('buyShare').style.visibility = 'hidden';
                                                        }

                                                    	
                                                    }
                                                    
                                                    </script>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>

                                </div>

                                <div id="service" style="padding:10px 0;">
                                    <table id="shareTable" class="rwd-table" style="border: 1px solid black;" width="600">
                                        <tbody>
                                            <tr style="font-size: 14px; font-family: Arial,Helvetica,sans-serif; font-weight: bold; color:#DDDD55;">
                                                <td>Symbol</td>
                                                <td>Company</td>
                                                
                                                <td>Time</td>
                                                <td>Trade</td>
                                                <td>% Chg</td>
                                                <td>Bid</td>
                                                <td>Volume</td>

                                            </tr>
                                            <tr style="font-family: Arial,Helvetica,sans-serif; font-size: 14px; padding: 0px 2px;">
                                                <td id="name">YHOO</td>
                                                <td id="company">YAHOO</td>
                                               
                                                <td id="time">5:00pm</td>
                                                <td id="result">$17.42</td>
                                                <td id="chg">+0.36(+2.11%)</td>
                                                <td id="bid">17.30</td>
                                                <td id="volume">19,455,986</td>

                                            </tr>
                                        </tbody>
                                    </table>

                                    <br />
                                    <img id="imgChart_0" src="stock_chart_yahoo_finance/yhoo.png" border="0" />
                                    <br />
                                    <a class="linkText" href='javascript:changeChart(0,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div1d_0">1d</span></a>&nbsp;&nbsp;
                                    <a class="linkText" href='javascript:changeChart(1,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div5d_0">5d</span></a>&nbsp;&nbsp;
                                    <a class="linkText" href='javascript:changeChart(2,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div3m_0">3m</span></a>&nbsp;&nbsp;
                                    <a class="linkText" href='javascript:changeChart(3,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div6m_0">6m</span></a>&nbsp;&nbsp;
                                    <a class="linkText" href='javascript:changeChart(4,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div1y_0">1y</span></a>&nbsp;&nbsp;
                                    <a class="linkText" href='javascript:changeChart(5,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div2y_0">2y</span></a>&nbsp;&nbsp;
                                    <a class="linkText" href='javascript:changeChart(6,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="div5y_0">5y</span></a>&nbsp;&nbsp;
                                    <a id="link1" class="linkText" href='javascript:changeChart(7,0,%20&quot;y/yhoo&quot;,%20&quot;YHOO&quot;);'><span id="divMax_0"><b>msx</b></span></a>
                                    <br />
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

                <div class="col-md-6" id="rssfeed">
          <br>
<iframe id="newsFeed"  height="500"  width="500" scrolling="no" name="rssmikle_frame" marginwidth="0" marginheight="0" vspace="0" hspace="0" frameborder="0"></iframe>
        </div>
            </div>
        </div>
    </div>

</html>