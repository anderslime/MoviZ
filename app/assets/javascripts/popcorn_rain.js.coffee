class PopcornRain
  constructor: ->

  bind_popcorn_button: ->
    $("#add_popcorn").toggle(=>
      @make_it_rain()
    , =>
      @stop()
    )

  make_it_rain: ->
    $(document).snow(
      SnowImage: "/assets/popcornflake.png",
      Quantity: 40,
      HideSnowTime: 60
    )

  stop: ->
    $(".flake").remove()

window.PopcornRain = PopcornRain
