function myNewsHere() 
                          {
                            var symbolNews = document.getElementById("ac-input").value
                            console.log(symbolNews)
                            document.getElementById('newsFeed').src = 
                            "http://feed.mikle.com/widget/?rssmikle_url=http%3A%2F%2Ffinance.yahoo.com%2Frss%2Fheadline%3Fs%3D"+symbolNews+"&rssmikle_frame_width=400&rssmikle_frame_height=500&frame_height_by_article=0&rssmikle_target=_blank&rssmikle_font=Arial%2C%20Helvetica%2C%20sans-serif&rssmikle_font_size=12&rssmikle_border=off&responsive=off&text_align=left&text_align2=left&corner=off&scrollbar=on&autoscroll=on&scrolldirection=up&scrollstep=3&mcspeed=20&sort=Off&rssmikle_title=on&rssmikle_title_sentence="+symbolNews+" News&rssmikle_title_bgcolor=%230066FF&rssmikle_title_color=%23FFFFFF&rssmikle_item_bgcolor=%23FFFFFF&rssmikle_item_title_length=55&rssmikle_item_title_color=%230066FF&rssmikle_item_border_bottom=on&rssmikle_item_description=on&item_link=off&rssmikle_item_description_length=150&rssmikle_item_description_color=%23666666&rssmikle_item_date=gl1&rssmikle_timezone=Etc%2FGMT&datetime_format=%25b%20%25e%2C%20%25Y%20%25l%3A%25M%20%25p&item_description_style=text%2Btn&item_thumbnail=full&item_thumbnail_selection=auto&article_num=15&rssmikle_item_podcast=off&";

                      };


function start(){
    getData();
    document.getElementById('link1').click();
}


function getData() {
    document.getElementById('service').style.display = "block";
    document.getElementById('rssfeed').style.display = "block";
    var url = "http://query.yahooapis.com/v1/public/yql";
var symbol = $("#ac-input").val();
var data = encodeURIComponent("select * from yahoo.finance.quotes where symbol in ('" + symbol + "')");

$.getJSON(url, 'q=' + data + "&format=json&diagnostics=true&env=http://datatables.org/alltables.env")
    .done(function (data) {

         $("#name").text(data.query.results.quote.Symbol);
         $("#company").text(data.query.results.quote.Name);
         
         $("#time").text(data.query.results.quote.LastTradeTime);
         $("#result").text(data.query.results.quote.LastTradePriceOnly);
         $("#chg").text(data.query.results.quote.PercentChange);
         $("#bid").text(data.query.results.quote.LastTradePriceOnly);
         $("#volume").text(data.query.results.quote.Volume);


         if(data.query.results.quote.PercentChange.indexOf("+") != -1){

            document.getElementById("chg").className = "greenText";
        }
         else{
            //alert(data.query.results.quote.PercentChange);

            document.getElementById("chg").className = "redText";
        }

}).fail(function (jqxhr, textStatus, error) {
    var err = textStatus + ", " + error;
        $("#result").text('Request failed: ' + err);
});
}
function SendRequest()
{

    getData();
    myNewsHere();
    document.getElementById('service').style.visibility = 'visible';
    document.getElementById('rssfeed').style.visibility = "visible";
    document.getElementById('link1').click();
}   

function CheckEnter(e)
{
    if ((e.keyCode && e.keyCode==13) || (e.which && e.which==13)) {
        return SendRequest();
    }
    return true;
}       

function changeChart(select, item, url, symbol)
{   
    url = url.replace('yhoo',$("#ac-input").val());
    symbol = symbol.replace('YHOO',$("#ac-input").val());
    var div1d=document.getElementById("div1d_"+item);
    var div5d=document.getElementById("div5d_"+item);
    var div3m=document.getElementById("div3m_"+item);
    var div6m=document.getElementById("div6m_"+item);
    var div1y=document.getElementById("div1y_"+item);
    var div2y=document.getElementById("div2y_"+item);
    var div5y=document.getElementById("div5y_"+item);
    var divMax=document.getElementById("divMax_"+item);
    var divChart=document.getElementById("imgChart_"+item);
    if(div1d==null || div5d==null || div3m==null || div6m==null || div1y==null || div2y==null || div5y==null || divMax==null || divChart==null)
        return;
    div1d.innerHTML="1d";
    div5d.innerHTML="5d";
    div3m.innerHTML="3m";
    div6m.innerHTML="6m";
    div1y.innerHTML="1y";
    div2y.innerHTML="2y";
    div5y.innerHTML="5y";
    divMax.innerHTML="Max";
    var rand_no = Math.random();
    rand_no = rand_no * 100000000;
    switch(select)
    {
    case 0:
        div1d.innerHTML ="<b>1d</b>";
        divChart.src = "http://ichart.finance.yahoo.com/b?s="+symbol+"&"+rand_no;
        break;
    case 1:
        div5d.innerHTML="<b>5d</b>";
        divChart.src = "http://ichart.finance.yahoo.com/w?s="+symbol+"&"+rand_no;
        break;
    case 2:
        div3m.innerHTML="<b>3m</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/3m/"+url+"?"+rand_no;
        break;
    case 3:
        div6m.innerHTML="<b>6m</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/6m/"+url+"?"+rand_no;
        break;
    case 5:
        div2y.innerHTML="<b>2y</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/2y/"+url+"?"+rand_no;
        break;
    case 6:
        div5y.innerHTML="<b>5y</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/5y/"+url+"?"+rand_no;
        break;
    case 7:
        divMax.innerHTML="<b>msx</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/my/"+url+"?"+rand_no;
        break;
    case 4:
    default:
        div1y.innerHTML="<b>1y</b>";
        divChart.src = "http://chart.finance.yahoo.com/c/1y/"+url+"?"+rand_no;
        break;
    }
}

function getLatestvalues(){
	
	
	
	$("#userShareTable").find("tr").not(":first").each(function()
			{
		
		var url = "http://query.yahooapis.com/v1/public/yql/";
		
		var symbol = $(this).find("td").eq(1).text();
		var column = $(this).find("td").eq(5);
		
		var data = encodeURIComponent("select * from yahoo.finance.quotes where symbol in ('" + symbol + "')");

		$.getJSON(url, 'q=' + data + "&format=json&diagnostics=true&env=http://datatables.org/alltables.env")
		    .done(function (data) {
		    	var RateToday = parseFloat(data.query.results.quote.LastTradePriceOnly).toFixed(2);
		    	column.text(RateToday);
		    	//column.text(data.query.results.quote.LastTradePriceOnly);
		    	console.log(data);
		    }).fail(function (jqxhr, textStatus, error) {
		        var err = textStatus + ", " + error;
		            $("#result").text('Request failed: ' + err);
		    })
		
	})
	
	
	
}
