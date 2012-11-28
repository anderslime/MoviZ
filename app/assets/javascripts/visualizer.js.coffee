//= require_self
//= require_tree ./visualizer

window.visualizer ||= {}

jQuery ->
  theater = new visualizer.Theater();
  window.visual_service = new visualizer.Service(service, theater);
  visual_service.bind_movie_form();


