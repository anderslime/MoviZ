//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_self

//= require tutorial
//= require node
//= require modal_box
//= require hover_box
//= require d3.v2
//= require d3graph
//= require canvas
//= require movie_form
//= require movie_autocomplete
//= require network_clusters
//= require network_centrality
//= require nerd_facts
//= require nerd_facts_service
//= require network_visualize_service
//= require theater
//= require movie_network_service
//= require dashboard
//= require popcorn
//= require popcorn_rain

window.visualizer ||= {}
window.d3graph ||= {}

jQuery ->
  $('#navbar').scrollspy()
  
  $('.popover-link').popover(
    placement: 'left',
    trigger: 'hover'
  )
    
  
