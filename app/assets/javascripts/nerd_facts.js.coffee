class NerdFacts
  button: $("#nerd-facts-button")
  modal_box: null

  constructor: ->
    console.log("Hey")
    @create_info_box()
    @button.click( => @modal_box.info_box.modal())

  push_nerd_facts: (network_id) ->
    $.getJSON "/networks/#{network_id}/nerd_facts", (data) ->
      console.log(data)

  create_info_box: ->
    @modal_box = new ModalBox("nerd-facts", "MoviZ Nerd Facts")
    @modal_box.body.append(
      $('<h2>').text('Centrality')
      $('<p>').attr(
        class: 'centrality'
      ).text("Hey")
      $('<h2>').text('Clustering coefficients')
      $('<p>').attr(
        class: 'clustering'
      )
    )
    @modal_box.append_to_canvas()

window.NerdFacts = NerdFacts
