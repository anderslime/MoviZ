class Node
  clicks: 0
  modal_box: null
  hover_box: null

  constructor: (@id, @title, @small_image, @large_image) ->

  on_single_double_click: ->
    @clicks++
    if (@clicks == 1)
      setTimeout(=>
        if @clicks == 1
          @on_single_click()
        else
          @on_double_click()
        @clicks = 0
      , 300)

  on_single_click: ->
    @modal_box.modal()

  on_double_click: ->
    service.add_connected_movies(@id)

  on_mouse_over: ->
    @hover_box.show()

  on_mouse_out: ->
    @hover_box.hide()

window.Node = Node
