class Network < ActiveRecord::Base
  attr_accessible :id, :edges

  has_many :edges

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
    return Edge.exists?(['network_id = ? AND ((source_id = ? AND target_id = ?) OR (target_id = ? AND source_id = ?))',
      self.id, source_id, target_id, source_id, target_id]
    )
  end

  def update_network(movies)
    new_node_set = movies.map(&:movie_id) + node_ids
    [].tap do |new_edges|
      movies.each do |source|
        source.related_movies_as_json.select {|m| new_node_set.include?(m['ids']['movieId'])}.each do |target|
          new_edges << add_edge(source.id, target['ids']['movieId']).to_json
        end
      end
    end.reject {|e| e == "null"}
  end
  
end
