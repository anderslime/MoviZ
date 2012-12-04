class NetworkClusters
  max_list_items: 3
  
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
    $('.cluster').hover(
      () ->
        height = $(this).find(".cluster-list").first().outerHeight()
        $(this).find(".more").hide()
        $(this).animate({
          height: height
        },
          'fast',
          'linear'
        )
        for id in $(this).data('ids') 
          $(".node-#{id}").find('.border').css("stroke", "red")
      () ->
        $(this).animate({
          height: '80px'
        },
          'fast',
          'linear'
          () ->
            $(this).find(".more").show()
        )
        for id in $(this).data('ids') 
          $(".node-#{id}").find('.border').css("stroke", "")
    )

  create_cluster: (movie_list, cluster_index) ->
    cluster_box = $("#cluster-container")
      .find(".empty")
      .clone()
      .toggleClass("empty")
      .toggleClass("active")
      .attr(
        id: "cluster-#{cluster_index}"
      ).data("ids", movie_list)

    cluster_list = cluster_box.find(".cluster-list")

    @add_movie_to_cluster(movie_id, cluster_list) for movie_id in movie_list
    $("#cluster-container").append(cluster_box)

  add_movie_to_cluster: (movie_id, cluster_list) ->
    if cluster_list.find('li').length == @max_list_items
      cluster_list.append(
        $("<div>").text("...").attr('class', 'more')
      )
    
    movie = @d3graph.find_node(movie_id)
    cluster_list.append(
      $("<li>").text(movie.title)
    )
  
    $('.popover-link').popover(
      placement: 'left',
      trigger: 'hover'
    )

  remove_clusters: ->
    $("#cluster-container .active").remove()

window.NetworkClusters = NetworkClusters
