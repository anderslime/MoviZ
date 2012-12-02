class ModalBox
  info_box: null
  header: null
  body: null

  constructor: (input_id, title = "Modal title") ->
    @info_box = $("#info-container").
      find(".empty").
      clone().
      toggleClass('empty').
      attr(
        id: input_id
      )

    @set_title(title)
    @header = @info_box.find('.modal-header')
    @body   = @info_box.find('.modal-body')
    @append_to_canvas()

  set_title: (title) ->
    @info_box.find(".modal-header").append(
      $("<h3>").text(title)
    )

  append_to_canvas: ->
    $("#info-container").append(@info_box)

  modal: ->
    @info_box.modal()

window.ModalBox = ModalBox
