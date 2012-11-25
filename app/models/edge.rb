class Edge < ActiveRecord::Base
  attr_accessible :network_id, :source_id, :target_id
end
