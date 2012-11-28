class D3Graph
  width: 960
  height: 500
  force: null
  canvas: null
  nodes: []
  links: []

  add_node: (node) ->
    if @find_node(node.id) is null
      @nodes.push(node)

  add_edge: (source, target) ->
    source = @find_node(source)
    target = @find_node(target)
    return if source is null or target is null
    @links.push({source: source, target: target})

  # TODO: Must be changed to binary serach algorithm
  find_node: (node_input_id) ->
    for node in @nodes
      return node if node.id == node_input_id
    null

  add_edges: (edges) ->
    @add_edge(edge) for edge in edges
    
  add_nodes: (nodes) ->
    @add_node(node) for node in nodes

  restart: () ->
    link = @canvas.selectAll("line.link")
      .data(@links, (d) -> "#{d.source.id}-#{d.target.id}")

    link.enter().insert("svg:line", "g.node").attr("class", "link")
    link.exit().remove()

    node = @canvas.selectAll("g.node").data(@nodes, (d) -> d.id)

    nodeEnter = node.enter().append("svg:g")
      .attr("class", "node")
      .on("click", (d) ->
        service.add_connected_movies(d.id)
      ).on('dblclick', (d) ->
        $("#movie-#{d.id}").modal()
        
      ).call(@force.drag)

    nodeEnter.append("svg:image")
      .attr("class", "circle")
      .attr("xlink:href", (d) -> d.image)
      .attr("x", (d) -> -20/2)
      .attr("y",  (d) -> -20/2)
      .attr("width", (d) -> 20)
      .attr("height", (d) -> 20)

    node.exit().remove()

    @force.start()

  setup: () ->
    @force = d3.layout.force()
      .charge(-150)
      .linkDistance(60)
      .size([@width, @height])

    @nodes = @force.nodes()
    @links = @force.links()

    @canvas = d3.select("#theater-container .graph")
      .append('svg')
      .attr("pointer-events", "all")
      .attr("width", @width)
      .attr("height", @height)

    canvas = @canvas
    @force.on("tick", ->
      canvas.selectAll("g.node")
        .attr("transform", (d) -> "translate(#{d.x},#{d.y})")

      canvas.selectAll("line.link")
        .attr("x1", (d) -> d.source.x )
        .attr("y1", (d) -> d.source.y )
        .attr("x2", (d) -> d.target.x )
        .attr("y2", (d) -> d.target.y ))

window.d3graph.D3Graph = D3Graph
