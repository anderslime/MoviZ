class Network < ActiveRecord::Base
  attr_accessible :id

  has_many :edges

  def add_edges_to_related(source_id, target_ids)
    target_ids.each do |target_id|
      edges << Edge.new(source_id: source_id, target_id: target_id)
    end
  end
end
