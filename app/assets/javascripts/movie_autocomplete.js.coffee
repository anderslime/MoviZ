class MovieAutocomplete
  constructor: (input_id) ->
    $("##{input_id}").typeahead(
      source: @autocomplete_search
    )

  autocomplete_search: (query, process) ->
    $.getJSON("/movies/autocomplete/#{escape(query)}", (data) ->
      process(data)
    )

window.MovieAutocomplete = MovieAutocomplete
