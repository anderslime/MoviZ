class NetworkNerdFactsService < Struct.new(:network)

  def facts_to_json
    {
      :eigenvector_centrality => eigenvector_centrality,
      :degree_centrality      => degree_centrality,
      :closeness_centrality   => closeness_centrality,
      :betweenness_centrality => betweenness_centrality,
      :clustering_coefficient => clustering_coefficient
    }
  end

  private

  def eigenvector_centrality
    NetworkCentralityHighscore.to_best_movie_scores(
      networkx_graph.eigenvector_centrality
    )
  end

  def degree_centrality
    NetworkCentralityHighscore.to_best_movie_scores(
      networkx_graph.degree_centrality
    )
  end

  def closeness_centrality
    NetworkCentralityHighscore.to_best_movie_scores(
      networkx_graph.closeness_centrality
    )
  end

  def betweenness_centrality
    NetworkCentralityHighscore.to_best_movie_scores(
      networkx_graph.betweenness_centrality
    )
  end

  def clustering_coefficient
    NetworkCentralityHighscore.to_best_movie_scores(
      networkx_graph.clustering_coefficient
    )
  end

  def networkx_graph
    @networkx_graph ||= NetworkxGraph.by_network(network)
  end
end
