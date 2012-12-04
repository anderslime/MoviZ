class Tutorial
  enabled: false
  step: 1

  toggle_tutorial: () ->
    if @enabled
      @disable_tutorial()
    else
      @enable_tutorial()

  show_button: ->
    $('#start-tutorial').fadeIn()

  enable_tutorial: () ->
    @enabled = true
    $('#start-tutorial').click (e) =>
      e.preventDefault()
      @run_tutorial()

    $('#next-step').click (e) =>
      e.preventDefault()
      @run_tutorial()

    $('#start-tutorial').hover(
      () ->
        $(this).clearQueue()
        $(this).fadeTo(100, 1)
      () ->
        $(this).delay(2000).fadeTo('normal', 0.10);
    )
    $('#start-tutorial').delay(7000).fadeTo('normal', 0.10);

  disable_tutorial: () ->
    @enabled = false
    $('#start-tutorial').hide()

  run_tutorial: () ->
    switch @step
      when 1
        @next_step()
        $('.actions').show()
        $('#start-tutorial').remove()
        $('#graph').find("g").on('click.tutorial', => @run_tutorial())
      when 2
        @next_step()
        $('#graph').find("g").off('.tutorial')
        $('#graph').find("g").on('dblclick.tutorial', => @run_tutorial())
      when 3
        @next_step()
        $('#graph').find("g").off('.tutorial')
        $('#nerd_facts_show_hide').on('click.tutorial', => @run_tutorial())
      when 4
        @next_step()
        $('.actions').hide()
        $('#nerd_facts_show_hide').off('.tutorial')
        $('#end-tutorial').on('click.tutorial', => @run_tutorial())
      when 5
        @next_step()
        $('#end-tutorial').off('.tutorial')   

  next_step: () ->
    @hide_step(@step - 1)
    @show_step(@step)
    @step = @step + 1

  show_step: (step) ->
    $("#step-#{step}").show()

  hide_step: (step) ->
    $("#step-#{step}").hide()

window.Tutorial = Tutorial
