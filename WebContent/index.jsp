<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Stock Market Simulator</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/
bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <style type="text/css">
#map-canvas  {
  margin: 0;
  padding: 0;
  height: 100%;
}

#map-canvas {
  width:420px;
  height:300px;
}
   </style>
  
  
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">
	</head>
	<body style="background-color:#333333">

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
  
<!-- HEADER 
=================================-->

<div class="jumbotron text-center">
    <div class="container">
      <div class="row">     
          <h1>Stock Market Simulator</h1>
          <p>A Stepping Stone to the Real Markets</p>
      </div>
    </div> 
</div>
<!-- /header container-->

<!-- CONTENT
=================================-->
<div class="container">
  <div class = "row">

       <div class="col-md-3 ">
          <div class="row">
          <button type="submit" class="btn btn-default btn-all btn-block btn-login span3 classWithPad"  onclick="window.location.href='login.jsp'">Login   </button>
        <div class="span3 classWithPad"><img src="images/bull.jpg" class="img-responsive" width="500px" height="500px"></div>
      </div>
      </div>


        <div class="col-md-3">
          <div class="row">
            <div class="span3 classWithPad"><img src="images/stock.jpg" class="img-responsive" width="500px" height="500px"></div>
            <button type="submit" class="btn btn-default btn-all btn-block btn-register span3 classWithPad" onclick="window.location.href='register.jsp'">Register</button>
      	
              </div>
      </div>

     <div class="col-md-3 ">
          <div class="row">
          <button type="submit" data-target="#learnMore" data-toggle="modal" class="btn btn-default btn-all btn-block btn-about span3 classWithPad">Learn More</button>
        <div class="span3 classWithPad"><img src="images/stock3.jpg" class="img-responsive" width="500px" height="500px"></div>
      </div>
      </div>

<div class="col-md-3 ">
          <div class="row">
            <div class="span3 classWithPad"><img src="images/stock1.png" class="img-responsive" width="260px" height="100px"></div>
          <button type="submit" data-target="#contactUs" data-toggle="modal" data-center="{&quot;lat&quot;:41.87,&quot;lng&quot;:-87.65}"  class="btn btn-default btn-all btn-block btn-contact span3 classWithPad">Contact</button>
        
      </div>
      </div>
      <div id="contactUs" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
                <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 id="myModalLabel">We'd Love to Hear From You!</h3>
        </div>
        <div class="modal-body">
          <div class = "row">
          <div class="col-md-6">
            <form>
          <div class="form-group"><label>Name</label><input class="form-control required" placeholder="Your name" data-placement="top" data-trigger="manual" data-content="Must be at least 3 characters long, and must only contain letters." type="text"></div>
          <div class="form-group"><label>Message</label><textarea class="form-control" placeholder="Your message here.." data-placement="top" data-trigger="manual"></textarea></div>
          <div class="form-group"><label>E-Mail</label><input class="form-control email" placeholder="email@you.com" data-placement="top" data-trigger="manual" data-content="Must be a valid e-mail address (user@gmail.com)" type="text"></div>
          <div class="form-group"><label>Phone</label><input class="form-control phone" placeholder="999-999-9999" data-placement="top" data-trigger="manual" data-content="Must be a valid phone number (999-999-9999)" type="text"></div>        
        </form>
      </div>
        <div class="col-md-6">
          <div id="map-canvas" class=""></div>
        </div>
      </div>
        </div>
        <div class="modal-footer">
        <div ><button type="submit" data-dismiss="modal" class="btn btn-success pull-right">Send!</button> <p class="help-block pull-left text-danger hide" id="form-error">&nbsp; The form is not valid. </p></div>
        </div>
      </div>
        </div>
      </div>
      
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
</div>
</div>
<script type='text/javascript' src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDOPOKOhX0cq1UYvmrKqhPyQzduG6M1puI&extension=.js&output=embed"></script>

        <script type='text/javascript'>
        var map;        
            var myCenter=new google.maps.LatLng(41.8749605, -87.6581129);

function initialize() {
  var mapProp = {
      center:myCenter,
      zoom: 12,
      draggable: false,
      scrollwheel: false,
      mapTypeId:google.maps.MapTypeId.ROADMAP
  };

  var contentString = "<b>University of Illinois at Chicago</b>"

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  var marker=new google.maps.Marker({
    position:myCenter,
    visible: true,
    infoWindow: infowindow
});


  marker.addListener('click', function(){
    infowindow.open(map,marker);
  });
  
  map=new google.maps.Map(document.getElementById("map-canvas"),mapProp);

   marker.setMap(map); 
    
  google.maps.event.addListener(marker, 'click', function() {
      
    infowindow.setContent(contentString);
    infowindow.open(map, marker);
    
  }); 
};
google.maps.event.addDomListener(window, 'load', initialize);

google.maps.event.addDomListener(window, "resize", resizeMap());

$('#contactUs').on('shown.bs.modal', function(e){
    resizeMap($(e.relatedTarget).data('center'));
});

function resizeMap(center) {
   if(typeof map =="undefined") return;
   google.maps.event.trigger(map, "resize");
   map.setCenter(center); 
};
</script>
<hr>
<!-- /CONTENT ============-->

	<!-- script references -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	</body>
</html>