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
    # TODO: Should be removed, does nothing

  show: ->
    @shown = true
    @right_pixels ||= @nerd_box.css("right")
    @nerd_box.animate({ 
      right: '0'
    },
      'slow',
      => @button.addClass('active')
    )

  hide: ->
    @shown = false
    @nerd_box.animate({ 
      right: @right_pixels
    },
      'slow',
      => @button.removeClass('active')
    )

window.NerdFacts = NerdFacts
