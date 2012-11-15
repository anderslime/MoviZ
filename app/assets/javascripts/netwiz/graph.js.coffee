class Graph
  constructor: (@nodes = [], @edges = [], @node_index = {}) ->

  add_node: (node) ->
    if not @node_exists(node)
      @node_index[node.id] = node
      @nodes.push(node)

  add_nodes: (nodes) ->
    for node in nodes
      @add_node(node)

  add_edges: (edges) ->
    for edge in edges
      @edges.push(edge)

  get_node_index: (node) ->
    for n, i in @nodes
      if n.id == node.id
        return i

  all_nodes_has_images: () ->
    for node in @nodes
      return false if node.image is null
    return true

  node_exists: (node) ->
    return @node_with_id_exists(node.id)

  node_with_id_exists: (node_id) ->
    return @node_index[node_id] != undefined

window.netwiz.Graph = Graph
