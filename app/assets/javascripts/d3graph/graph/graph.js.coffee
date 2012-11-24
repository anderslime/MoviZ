class D3Graph
  width: 960
  height: 500
  force: null
  svg: null
  nodes: null
  links: null

  setup: () ->
    @force = d3.layout.force()
      .charge(-150)
      .linkDistance(60)
      .size([width, height]);

    @svg = d3.select("#theater-container svg")
      .call(d3.behavior.zoom().on("zoom", window.redraw))
      .attr("pointer-events", "all")
      .attr("width", width)
      .attr("height", height);

    @nodes = @force.nodes()
    @links = @force.links()
