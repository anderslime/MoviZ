class Theater
  open: false

  toggle_theater: () ->
    $('form#movie-form').toggle()
    if open
      show_curtains
    else
      remove_curtains
    open = true

  remove_curtains: () ->
    $('.left-curtain').animate({left: '-=450'},4000)
    $('.right-curtain').animate({right: '-=450'},4000)

  show_curtains: () ->
    $('.left-curtain').animate({right: '-=450'},4000)
    $('.right-curtain').animate({left: '-=450'},4000)

window.visualizer.VisualTheater = VisualTheater
