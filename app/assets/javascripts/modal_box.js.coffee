class ModalBox
  info_box: null
  header: null
  body: null

  constructor: (input_id, title = "Modal title", body = "Modal body") ->
    @info_box = $("#info-container").
      find(".empty").
      clone().
      toggleClass('empty').
      attr(
        id: input_id
      )
    
    @header = @info_box.find('.modal-header')
    @body   = @info_box.find('.modal-body')
    @set_title(title)
    @set_body(body)

    @append_to_canvas()

  set_title: (title) ->
    @header.append(
      $("<h3>").text(title)
    )
    
  set_body: (body) ->
    @body.append(
      body
    )

  append_to_canvas: ->
    $("#info-container").append(@info_box)

  modal: ->
    @info_box.modal()

window.ModalBox = ModalBox
