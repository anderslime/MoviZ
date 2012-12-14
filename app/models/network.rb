class Network < ActiveRecord::Base
  attr_accessible :id, :edges

  has_many :edges, :dependent => :destroy

  def node_ids
    (edges.map(&:source_id)+edges.map(&:target_id)).uniq
  end

  def add_edge(source_id, target_id)
    return nil if edge_exists?(source_id, target_id)
    edge = Edge.new(source_id: source_id, target_id: target_id)
    edges << edge
    edge
  end

  def edge_exists?(source_id, target_id)
    edges.exists?(['network_id = ? AND ((source_id = ? AND target_id = ?) OR (target_id = ? AND source_id = ?))',
      self.id, source_id, target_id, source_id, target_id]
    )
  end

  def update_network(movies)
    new_node_set = (movies.map(&:movie_id) + node_ids).uniq
    edge_output = [].tap do |new_edges|
      movies.each do |source|
        source.related.select {|m| new_node_set.include?(m[:movie_id])}.each do |target|
          edge = add_edge(source.id, target[:movie_id])
          new_edges << edge.to_json
        end
      end
    end.reject {|e| e == "null"}
  end

  def networkx_edges
    edges.inject([]) do |nx_edges, edge|
      nx_edges << [edge.source_id, edge.target_id]
    end
  end
end
