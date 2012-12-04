class PopcornRain
  constructor: ->

  bind_popcorn_button: ->
    $("#add_popcorn").toggle(=>
      @make_it_rain()
    , =>
      @stop()
    )

  make_it_rain: ->
    console.log("MAKE IT RAIN")
    $(document).snow(
      SnowImage: "/assets/popcornflake.png",
      Quantity: 50,
      HideSnowTime: 60
    )

  stop: ->
    console.log("STOP!")
    $(".flake").remove()

window.PopcornRain = PopcornRain
