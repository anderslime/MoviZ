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

  # Initialize nerd fact visualization
  nerd_facts = new NerdFacts('nerd_facts_box', d3graph)
  window.clustering = new NetworkClusters(d3graph)
  window.centrality = new NetworkCentrality(d3graph)
  window.nerd_facts_service = new visualizer.NerdFactsService(
    nerd_facts,
    centrality,
    clustering,
    d3graph
  )
  nerd_facts_service.setup_nerd_facts()

  # Initalize tutorial
  tutorial = new Tutorial()

  # Initialize network visualization
  theater = new visualizer.Theater()
  network_visual_service = new visualizer.NetworkVisualizeService(service, theater, tutorial, nerd_facts)

  # Initialize movie form
  autocomplete = new visualizer.MovieAutocomplete()
  movie_form = new visualizer.MovieForm('movie-form')
  movie_form.bind_movie_form(network_visual_service)
  movie_form.activate_autocomplete(autocomplete)

  # POPCORN RAIN
  popcorn_rain = new PopcornRain()
  popcorn_rain.bind_popcorn_button()

