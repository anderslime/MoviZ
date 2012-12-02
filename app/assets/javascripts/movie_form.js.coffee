class MovieForm
  form_object: null
  input_object: null

  constructor: (@form_id) ->
    @form_object = $("form##{@form_id}")
    @input_object = @form_object.find("input#title-input")

  bind_movie_form: (service) ->
    @form_object.submit(=>
      $("ul.typeahead").remove()
      title = @input_object.val()
      service.show_network(title)
      return false
    )
    @input_object.focus()

  activate_autocomplete: (autocomplete) ->
    @input_object.typeahead(
      source: autocomplete.search
    )

window.visualizer.MovieForm = MovieForm
