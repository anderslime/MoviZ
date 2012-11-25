class Movie < ActiveRecord::Base
  attr_accessible :image_url, :rating, :rovi_id, :title
end
