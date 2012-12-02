# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  # Intialize graph and canvas
  window.d3graph = new d3graph.D3Graph()
  d3graph.setup()
  canvas = new Canvas(d3graph)

  # Initialize network service
  window.service = new MovieNetworkService(canvas)

  # Initialize network visualization
  theater = new visualizer.Theater()
  nerd_facts = new NerdFacts('nerd_facts_box', d3graph)
  network_visual_service = new visualizer.NetworkVisualizeService(service, theater, nerd_facts)
  window.nerd_facts_service = new visualizer.NerdFactsService(nerd_facts, d3graph)
  nerd_facts_service.setup_nerd_facts()

  # Initialize movie form
  autocomplete = new visualizer.MovieAutocomplete()
  movie_form = new visualizer.MovieForm('movie-form')
  movie_form.bind_movie_form(network_visual_service)
  movie_form.activate_autocomplete(autocomplete)
