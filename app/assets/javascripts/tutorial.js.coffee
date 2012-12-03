class Tutorial
  enabled: false
  step: 1

  toggle_tutorial: () ->
    if @enabled
      @disable_tutorial()
    else
      @enable_tutorial()

    
  enable_tutorial: () ->
    @enabled = true
    $('#start-tutorial').show()
    $('#start-tutorial').click (e) =>
      e.preventDefault()
      @run_tutorial()
      
    $('#start-tutorial').hover(
      () ->
        $(this).clearQueue()
        $(this).fadeTo(100, 1)
      () ->
        $(this).fadeTo(100, 0.05)
    )
    $('#start-tutorial').delay(10000).fadeTo('normal', 0.05);

  disable_tutorial: () ->
    @enabled = false
    $('#start-tutorial').hide()
  
  
  run_tutorial: () ->
    switch @step
      when 1
        @next_step()
        $('#start-tutorial').remove()
        $('#graph').find("g").click () =>
          @run_tutorial()
      when 2
        @next_step()
        $('#graph').find("g").unbind('click')
        $('#graph').find("g").dblclick () =>
          @run_tutorial()
      when 3
        @next_step()
        $('#graph').find("g").unbind('dblclick')
        $('#nerd_facts_show_hide').click () =>
          @run_tutorial()
      when 4
        @next_step()
        $('#nerd_facts_show_hide').find("g").unbind('click')
        $('#end-tutorial').click () =>
          @run_tutorial()
      when 5
        @next_step()
        $('#end-tutorial').unbind('click')
        
    
  
  next_step: () ->
    @hide_step(@step - 1)
    @show_step(@step)
    @step = @step + 1
    
    console.log(@step)
    
  show_step: (step) ->
    $("#step-#{step}").show()
    
  hide_step: (step) ->
    $("#step-#{step}").hide()
    
window.Tutorial = Tutorial