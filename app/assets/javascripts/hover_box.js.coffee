class HoverBox
  info_box: null

  constructor: (@id, @image_url, @title, @release_year, @rating, @genres) ->
    @info_box = $("#hover-container").
      find(".empty").
      clone().
      toggleClass('empty').
      attr(
        id: "movie-#{@id}"
      )

    @set_image_url(@image_url)
    @set_title(@title)
    @set_release_year(@year)
    @set_rating(@rating)
    @set_genres(@genres)
    @append_to_canvas()

  show: () ->
    @info_box.show()

  hide: () ->
    @info_box.hide()

  set_image_url: (url) ->
    @info_box.find("img.hover-image").attr("src", url)

  set_title: (title) ->
    @info_box.find("h4.title").text(title)

  set_release_year: (year) ->
    @info_box.find("span.released").text(year)

  set_rating: (rating) ->
    @info_box.find("span.rating").text(rating)

  set_genres: (genres) ->
    @info_box.find("span.genres").text(genres)

  append_to_canvas: ->
    $("#hover-container").append(@info_box)

window.HoverBox = HoverBox
