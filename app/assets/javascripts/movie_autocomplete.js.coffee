class MovieAutocomplete
  search: (query, process) ->
    $.getJSON("/movies/autocomplete/#{escape(query)}", (data) ->
      process(data)
    )

window.visualizer.MovieAutocomplete = MovieAutocomplete
