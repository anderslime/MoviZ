initializeGraph = function(movie) {
  var width = 960,
      height = 500;

  var color = d3.scale.category20();

  var force = d3.layout.force()
      .charge(-120)
      .linkDistance(30)
      .size([width, height]);

  var svg = d3.select("#chart").append("svg")
      .attr("width", width)
      .attr("height", height);

  d3.json("http://moviz.dev/dashboard/"+movie+".json", function(json) {
    force.nodes(json.nodes)
         .links(json.links)
         .start();

    var link = svg.selectAll("line.link")
        .data(json.links)
        .enter()
        .append("line")
        .attr("class", "link")
        .style("stroke-width", function(d) { return Math.sqrt(d.value); });

    var node = svg.selectAll("circle.node")
        .data(json.nodes)
        .enter()
        .append("circle")
        .attr("class", "node")
        .attr("r", 5)
        .style("fill", function(d) { return color(d.group); })
        .call(force.drag);

    window.nodes = node;
    window.links = link;

    node.append("title")
        .text(function(d) { return d.title; });

    force.on("tick", function() {
      link.attr("x1", function(d, i) { return d.source.x; })
          .attr("y1", function(d, i) { return d.source.y; })
          .attr("x2", function(d, i) { return d.target.x; })
          .attr("y2", function(d, i) { return d.target.y; });

      node.attr("cx", function(d, i) { return d.x; })
          .attr("cy", function(d, i) { return d.y; });
    });
  });
}
