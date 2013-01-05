class Score < ActiveRecord::Base
  attr_accessible :value
  belongs_to :bathroom
end
