initializeGraph = function(nodes, edges) {
  var width = 960,
      height = 600;

  var color = d3.scale.category20();

  var force = d3.layout.force()
      .charge(-120)
      .linkDistance(30)
      .size([width, height]);

  window.force = force;

  var svg = d3.select("#chart").append("svg")
      .attr("width", width)
      .attr("height", height);

  window.svg = svg

  console.log("Svg added!")
  console.log(nodes)
  console.log(edges)

  force.nodes(nodes)
       .links(edges)
       .start();

  console.log("Nodes forced")

  var link = svg.selectAll("line.link")
      .data(edges)
      .enter()
      .append("line")
      .attr("class", "link")
      .style("stroke-width", function(d) { return Math.sqrt(d.value); });

  console.log("Links something")

  var node = svg.selectAll("circle.node")
      .data(nodes)
      .enter()
      .append("circle")
      .attr("class", "node")
      .attr("r", 5)
      .style("fill", function(d) { return color(d.group); })
      .call(force.drag);

  console.log("something about nodes")

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
}

nodeByData = function(data) {
  window.movie = data.movie
  console.log("id: "+data.movie.ids.movieId);
  console.log("title: "+data.movie.title);
  console.log("related: "+data.movie.related.isRelatedTo)
}
