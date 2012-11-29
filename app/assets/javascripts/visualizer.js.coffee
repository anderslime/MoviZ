//= require_self
//= require_tree ./visualizer

window.visualizer ||= {}

jQuery ->
  theater = new visualizer.Theater();
  nerd_facts = new NerdFacts()
  visual_service = new visualizer.Service(service, theater, nerd_facts);
  visual_service.bind_movie_form();


