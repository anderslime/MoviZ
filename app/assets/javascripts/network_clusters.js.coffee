class NetworkClusters
  constructor: (@d3graph) ->

  fetch_and_set_clusters: ->
    @remove_clusters()
    $.getJSON "/network/communities", (data) =>
      @hide_load_animation()
      @set_clusters(data)

  show_load_animations: ->
    $("#cluster-container").find("img.load_animation").show()

  hide_load_animation: (list_name) ->
    $("#cluster-container").find("img.load_animation").hide()

  set_clusters: (clusters) ->
    @create_cluster(movie_list, i) for movie_list, i in clusters

  create_cluster: (movie_list, cluster_index) ->
    cluster_box = $("#cluster-container")
      .find(".empty")
      .clone()
      .toggleClass("empty")
      .toggleClass("active")
      .attr(
        id: "cluster-#{cluster_index}"
      )

    cluster_list = cluster_box.find(".cluster-list")

    @add_movie_to_cluster(movie_id, cluster_list) for movie_id in movie_list
    $("#cluster-container").append(cluster_box)

  add_movie_to_cluster: (movie_id, cluster_list) ->
    movie = @d3graph.find_node(movie_id)
    cluster_list.append(
      $("<li>").text(movie.title)
    )

  remove_clusters: ->
    $("#cluster-container .active").remove()

window.NetworkClusters = NetworkClusters
