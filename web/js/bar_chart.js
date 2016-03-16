/* This object creates bar charts with D3.js
   It requires d3.js to be imported in your page

   Call example:

    var barChart = new BarChart ('#variables', 300, 120, 5, '#333', '#3e3');
    barChart.renderBars(variables);

 */


function BarChart (rootNode, barsWidth, barsHeight, barsMargin, baseColor, rangeColor) {

    /*
     var barsWidth = 300,
     barsHeight = 120,
     barsMargin = 5;
     */
    this.rootNode = rootNode;
    this.barsWidth = barsWidth;
    this.barsHeight = barsHeight;
    this.barsMargin = barsMargin;
    this.baseColor = baseColor;
    this.rangeColor = rangeColor;
    var that = this;

    this.svgContainer = d3.select(rootNode).append("svg")
        .attr("width", barsWidth)
        .attr("height", barsHeight);

    this.renderBars = function (data) {
        var yScale = d3.scale.linear().domain([0,data.length]).range([that.barsMargin,that.barsHeight-that.barsMargin]).clamp(true);
        var wScale = d3.scale.linear().domain([0,100]).range([0,that.barsWidth]).clamp(true);
        var cScale = d3.scale.linear().domain([50,100]).range([that.rangeColor, that.baseColor]).clamp(true);

        var myBars 		= that.svgContainer.selectAll("rect").data(data, function (d) { return d.id; } );
        var myTexts 	= that.svgContainer.selectAll("text.variable").data(data, function (d) { return d.id; } );
        var myValues 	= that.svgContainer.selectAll("text.valor").data(data, function (d) { return d.id; } );

        var barHeight = ((that.barsHeight-2*that.barsMargin)/data.length)/1.2;


        myBars.enter().append("rect")
            .attr("y", barsHeight)
            .attr("x", 0)
            .attr("height", barHeight)
            .attr("width", function(d,i) {return wScale(d.value); })
            .style('fill', function(d,i) {return cScale(d.value);})
            .transition()
            .duration(600)
            .attr("y", function(d,i){return yScale(d.ranking);});

        myTexts.enter().append("text")
            .text(function (d) { return d.name; })
            .attr("y", that.barsHeight + 5)
            .attr("x", 0)
            .attr("transform", "translate(2 " + barHeight / 2 + ")")
            .attr('class', 'variable')
            .style('stroke', '#fff')
            .style('fill', '#fff')
            .transition()
            .duration(600)
            .attr("y", function(d,i){return yScale(d.ranking);});

        myValues.enter().append("text")
            .text(function (d) { return d.valor + " h"; })
            .attr("y", barsHeight)
            .attr("x", function (d,i) { return wScale (d.value);})
            .attr("transform", "translate(2 " + barHeight / 2 + ")")
            .attr('class', 'valor')
            /*.style('stroke', that.baseColor)*/
            .style('fill', that.baseColor)
            .transition()
            .duration(600)
            .attr("y", function (d,i) { return yScale (d.ranking); });


        myBars.transition().duration(600)
            .style('fill', function(d,i) {return cScale(d.value);})
            .attr("width",function(d,i){return wScale(d.value);})
            .attr("height", barHeight)
            .attr('y', function(d,i) {return yScale(d.ranking);});

        myTexts.transition().duration(600)
            .attr('y', function(d,i) {return yScale(d.ranking) + 5;});

        myValues.transition().duration(600)
            .text(function (d) { return d.value + " %"; })
            .attr('y', function(d,i) {return yScale(d.ranking);})
            .attr('x', function (d,i) { return wScale (d.value);});


        myBars.exit().transition().duration(600)
            .attr("y", barsHeight + 10);

        myTexts.exit().transition().duration(600)
            .attr("y", barsHeight + 10)
            .remove();

        myValues.exit().transition().duration(600)
            .attr("y", barsHeight + 10);
    }

}
