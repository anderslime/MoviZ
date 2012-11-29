class NerdFacts
  button: $("#nerd-facts-button")
  modal_box: null

  constructor: ->
    @create_info_box()
    @button.click(=>
      @modal_box.body.html('')
      @fetch_nerd_facts()
      @modal_box.info_box.modal()
    )

  fetch_nerd_facts: ->
    $.getJSON "/network/nerd_facts", (data) =>
      for kind, scores of data
        @modal_box.body.append(@fact_section(kind, scores))

  fact_section: (kind, scores) ->
    $('<div>').attr(class: kind).append(
      $('<h2>').text(kind)
      $('<ul>').append(@score_list_elements(scores))
    )

  score_list_elements: (scores) ->
    @score_element(score) for score in scores

  score_element: (score) ->
    $('<li>').text("#{score.movie.title} - #{score.value}")

  create_info_box: ->
    @modal_box = new ModalBox("nerd-facts", "MoviZ Nerd Facts")
    @modal_box.append_to_canvas()

window.NerdFacts = NerdFacts
