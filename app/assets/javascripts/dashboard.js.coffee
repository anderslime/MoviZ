# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  window.d3graph = new d3graph.D3Graph();
  d3graph.setup();
  window.canvas = new Canvas(d3graph);

  window.service = new AjaxService(canvas);
