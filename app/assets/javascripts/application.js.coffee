//= require jquery
//= require jquery_ujs
//= require_self
//= require bootstrap
//= require node
//= require modal_box
//= require movie_autocomplete
//= require nerd_facts
//= require d3.v2
//= require d3graph
//= require canvas
//= require dashboard
//= require visualizer
//= require ajax_service

window.visualizer ||= {}
window.d3graph ||= {}

jQuery ->
  $('#navbar').scrollspy()
