class Bathroom < ActiveRecord::Base
  attr_accessible :is_public, :name, :btype, :vid
  has_many :scores
end
