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

  move_graph: (x, y) ->
    @transform_nodes((x - @biax_x)/7,(y - @biax_y/7))
    @biax_x = x
    @biax_y = y
    @set_tick_event(x,y)
    @restart()

  transform_nodes: (x,y) ->
    for node in @nodes
      node.x = node.x - x
      node.y = node.y - y
    @restart()

  restart: () ->
    link = @canvas.selectAll("line.link")
      .data(@links, (d) -> "#{d.source.id}-#{d.target.id}")

    link.enter().insert("svg:line", "g.node").attr("class", "link")
    link.exit().remove()

    node = @canvas.selectAll("g.node").data(@nodes, (d) -> d.id)

    nodeEnter = node.enter().append("svg:g")
      .attr("class", "node")
      .on("click", (d) -> d.on_single_double_click())
      .on("mouseover", (d) -> d.on_mouse_over())
      .on("mouseout", (d) -> d.on_mouse_out())
      .call(@force.drag)

    nodeEnter.append("svg:image")
      .attr("class", "circle")
      .attr("xlink:href", (d) -> d.small_image.url)
      .attr("x", (d) -> -30/2)
      .attr("y",  (d) -> -30/2)
      .attr("width", (d) -> 30)
      .attr("height", (d) -> 30)

    node.exit().remove()

    @force.start()

  setup: () ->
    @biax_x = 0
    @biax_y = 0
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

    @set_tick_event()

  set_tick_event: (x_bias = 0, y_bias = 0) ->
    @force.on("tick", =>
      @canvas.selectAll("g.node")
        .attr("transform", (d) -> "translate(#{d.x - x_bias},#{d.y - y_bias})")

      @canvas.selectAll("line.link")
        .attr("x1", (d) -> d.source.x - x_bias )
        .attr("y1", (d) -> d.source.y - y_bias )
        .attr("x2", (d) -> d.target.x - x_bias )
        .attr("y2", (d) -> d.target.y - y_bias ))

window.d3graph.D3Graph = D3Graph
