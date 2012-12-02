class NerdFactsService
  constructor: (@nerd_facts, d3graph) ->

  reset_nerd_facts: ->
    if @nerd_facts.shown
      @nerd_facts.button.click()

  setup_nerd_facts: ->
    @nerd_facts.bind_show_hide(->
        @d3graph.move_graph(200,0)
      , ->
        @d3graph.move_graph(0,0)
    )

window.visualizer.NerdFactsService = NerdFactsService
