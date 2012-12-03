class NerdFacts

  constructor: (@box_id, @d3graph)->
    @nerd_box = $("##{@box_id}")
    @button   = @nerd_box.find("a#nerd_facts_show_hide")
    @shown    = false

  bind_show_hide: (show_callback, hide_callback) ->
    @button.toggle(=>
      show_callback()
      @show()
    , =>
      hide_callback()
      @hide()
    )

  initialize: ->
    @nerd_box.show()
    @button.animate({left: '-110px'}, { duration: 'slow'})

  show: ->
    @shown = true
    @right_pixels ||= @nerd_box.css("right")
    @set_hide_button()
    @nerd_box.animate(
      { right: '0'},
      { duration: 'slow' }
    )

  hide: ->
    @shown = false
    @set_show_button()
    @nerd_box.animate(
      { right: @right_pixels},
      { duration: 'slow' }
    )

  set_show_button: ->
    @button.html("Nerd Facts").toggleClass("btn-primary btn-danger").css("left","-110px")

  set_hide_button: ->
    @button.html("&times").toggleClass("btn-primary btn-danger").css("left", "-38px")

window.NerdFacts = NerdFacts
