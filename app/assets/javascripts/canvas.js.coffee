class Canvas
  
  constructor: (@d3) ->
  
  add_node: (node) ->
    @d3.add_node(node)
    
    info_box = $("#info-container").find(".empty").clone().toggleClass('empty')
    
    info_box.attr(
      id: "movie-#{node.id}"
    )
    
    info_box.find(".modal-header").append(
      $("<h3>").text(node.title)
    )
    
    info_box.find(".modal-body").append(
      $("<p>").text(node.title)
      $("<img>").attr(
        src: node.image,
        class: "img-polaroid"
      )
    )
    
    $('#info-container').append(info_box)
    
  add_edge: (source, target) ->
    @d3.add_edge(source, target)
    
  repaint: ->
    @d3.restart()
    

window.Canvas = Canvas
