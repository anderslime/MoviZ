class ModalCanvas
  info_box: null
  header: null
  body: null

  constructor: (id, title = "Modal title") ->
    @info_box = $("#info-container").
      find(".empty").
      clone().
      toggleClass('empty').
      attr(
        id: "movie-#{id}"
      )

    @header = @info_box.find('.modal-header')
    @body   = @info_box.find('.modal-body')
    @set_title(title)

  set_title: (title) ->
    @header.append(
      $("<h3>").text(title)
    )

window.ModalCanvas = ModalCanvas
