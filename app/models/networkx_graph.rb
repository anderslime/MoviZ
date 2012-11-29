class NetworkxGraph
  @@nx = Python.import("ruby_networkx")

  class << self
    def by_network(network)
      new(network.networkx_edges)
    end
  end

  def initialize(edges)
    @nx_graph = @@nx.edges_to_graph(edges)
  end

  def clustering_coefficient
    @@nx.clustering_coefficient(@nx_graph).to_enum
  end

  def degree_centrality
    @@nx.degree_centrality(@nx_graph).to_enum
  end

  def closeness_centrality
    @@nx.closeness_centrality(@nx_graph).to_enum
  end

  def betweenness_centrality
    @@nx.betweenness_centrality(@nx_graph).to_enum
  end

  def eigenvector_centrality
    @@nx.eigenvector_centrality(@nx_graph).to_enum
  end
end
