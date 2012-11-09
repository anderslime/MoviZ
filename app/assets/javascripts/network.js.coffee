class Network
  constructor: () ->

  append: () ->
    d3.select("body").append("p").text("New paragraph!")

window.network = Network
