window.initializeGraph = function(nodes, edges) {
  var width = 960,
    height = 500

  var force = d3.layout.force()
      .charge(-150)
      .linkDistance(60)
      .size([width, height]);

  var svg = d3.select(".theater-container svg")
      .call(d3.behavior.zoom().on("zoom", window.redraw))
      .attr("pointer-events", "all")
      .attr("width", width)
      .attr("height", height);

  force
      .nodes(nodes)
      .links(edges)
      .start();

  var link = svg.selectAll(".link")
      .data(edges)
    .enter().append("line")
      .attr("class", "link");

  var node = svg.selectAll(".node")
      .data(nodes)
      .enter().append("g")
      .attr("class", "node")
      .call(force.drag);

  node.append("image")
      .attr("xlink:href", function(d) { return d.image.url; })
      .attr("x", function(d) { return -d.image.width/2; })
      .attr("y", function(d) { return -d.image.height/2; })
      .attr("width", function(d) { return d.image.width; })
      .attr("height", function(d) { return d.image.height; });

  // node.append("text")
  //     .attr("dx", 12)
  //     .attr("dy", ".35em")
  //     .text(function(d) { return d.title });

  force.on("tick", function() {
    link.attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
  });
  // var width = 960,
  //     height = 600;

  // var color = d3.scale.category20();

  // var force = d3.layout.force()
  //     .charge(-120)
  //     .linkDistance(100)
  //     .size([width, height]);

  // var svg = d3.select("#chart").append("svg")
  //     .attr("width", width)
  //     .attr("height", height);

  // force.nodes(nodes)
  //      .links(edges)
  //      .start();

  // var link = svg.selectAll("line.link")
  //     .data(edges)
  //     .enter()
  //     .append("line")
  //     .attr("class", "link")
  //     .style("stroke-width", function(d) { return Math.sqrt(d.value); });

  // var node = svg.selectAll("svg:image")
  //     .data(nodes)
  //     .enter()
  //     .append("svg:image")
  //     .attr("x", "-8px")
  //     .attr("y", "-8px")
  //     .attr("width", "16px")
  //     .attr("height", "16px");
  //     .attr("xlink:href", "http://ecx.images-amazon.com/images/I/51%2BltIuV23L._SL75_SS50_.jpg")
  //     .call(force.drag);

  // node.append("title")
  //     .text(function(d) { return d.title; });

  // force.on("tick", function() {
  //   link.attr("x1", function(d, i) { return d.source.x; })
  //       .attr("y1", function(d, i) { return d.source.y; })
  //       .attr("x2", function(d, i) { return d.target.x; })
  //       .attr("y2", function(d, i) { return d.target.y; });

  //   node.attr("cx", function(d, i) { return d.x; })
  //       .attr("cy", function(d, i) { return d.y; });
  // });
}
