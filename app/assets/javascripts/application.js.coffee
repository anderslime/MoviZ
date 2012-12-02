//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_self
//= require node
//= require modal_box
//= require hover_box
//= require d3.v2
//= require d3graph
//= require canvas
//= require movie_form
//= require movie_autocomplete
//= require nerd_facts
//= require nerd_facts_service
//= require network_visualize_service
//= require theater
//= require movie_network_service
//= require dashboard

window.visualizer ||= {}
window.d3graph ||= {}

jQuery ->
  $('#navbar').scrollspy()
