var chart;


function Start() {
    console.log("Let the games begin!");
    return StockMarketLineChart();

}


function StockMarketLineChart() {
    var margin = { top: 30, right: 20, bottom: 30, left: 50 },
            width = 1200 - margin.left - margin.right,
            height = 540 - margin.top - margin.bottom;

    // Parse the date
    var parseDate = d3.time.format("%m/%e/%y").parse;

    // Set the ranges
    var x = d3.time.scale()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height, 0]);

    // Define the axes
    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom")
        .ticks(10);

    var yAxis = d3.svg.axis()
        .scale(y)
        .orient("left")
        .ticks(10);


    // Define the line for <key> price
    var valueLine = function(key) {
        return d3.svg.line()
            .x(function(d) { return x(d.date); })
            .y(function(d) { return y( d[key]) });
    }

    // Adds the svg canvas for the Closing Price graph
    var svg = d3.select("#StockChart")
            .append("svg")
            .attr('class', 'stockChart')
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    // get data
    var myChart = function() { }

    myChart.plot = function( filename ) {
        d3.csv( filename, function(error, data) {
            data.forEach(function(d) {
                d.date = parseDate(d["Date"]);
                d.Open = +d["Open"];
                //console.log(d.Open);
                d.High = +d["High"];
                d.Low = +d["Low"];
                d.Close = +d["Close"];
                d.Volume = +d["Volume"];
            });
            // scale the range of the data
            //   ------ easy to add a variable to select range of dates? ------
            x.domain(d3.extent(data, function(d) { return d.date; }));
            y.domain(d3.extent(data, function(d) { return +d.Close; }));
            //y.domain([0, d3.max(data, function(d) { return d.Close; })]);


            var drawLineAndCircles = function (key, data) {
                var _color = "grey";

                switch ( key ) {
                    case "High":
                        _color = "red"
                        break;
                    case "Low":
                        _color = "blue"
                        break;
                    case "Close":
                        _color = "green"
                        break;
                }
                svg.append("path")
                    .attr("class", "line " + key)
                    .attr("d", valueLine(key)(data))
                    .style("stroke", _color);

                svg.selectAll("circle." + key)
                   .data(data).enter()
                   .append("circle")
                   .attr("r", 2)
                    .style("fill", _color)
                    .style("fill-opacity", "0.5")                // add x axis
                    .attr("transform", function(d) { return "translate(" +  [x(d.date), y(d[key])].toString() + ")" })
                    .on("mouseover", function(d) {
                        d3.select(this)
                            .attr('r', 5)


                        d3.select("#tooltip")
                            .classed("hidden", false)
                            .style("left", ( x( parseDate(d.Date) ) + 70 ).toString() + "px")
                            .style("top", ( y( d[key] ) - 70 ).toString() + "px")
                        .select("#value")
                          .html([
                            "<strong>Stock Market Price Point</strong> <br>" +
                            "<strong>Date:</strong> " + d.Date.toString() + "<br>" +
                            "<strong>Close:</strong> $" + (Math.round(d.Close * 100) / 100).toString() + "<br>" +
                            "<strong>Low:</strong> $" + (Math.round(d.Low * 100) / 100).toString() + "<br>" +
                            "<strong>High:</strong> $" + (Math.round(d.High * 100) / 100).toString() + "<br>"
                          ]);

                    })
                    .on("mouseout", function(d) {
                        d3.select(this)
                            .attr('r', 2)

                        d3.select("#tooltip").classed("hidden", true);
                    })
            }

            drawLineAndCircles("Close", data);
            drawLineAndCircles("High", data);
            drawLineAndCircles("Low", data);

            svg.append("g")
                .attr("class", "x axis")
                .attr("transform", "translate(0," + height + ")")
                .call(xAxis);

            // add y axis
            svg.append("g")
                .attr("class", "y axis")
                .call(yAxis);
        });
    }
    myChart();
    return myChart;
}