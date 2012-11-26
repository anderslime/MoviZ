class Edge < ActiveRecord::Base
  attr_accessible :network_id, :source_id, :target_id

  belongs_to :source, :class_name => "Movie", :foreign_key => "source_id"
end
