class Bathroom < ActiveRecord::Base
  attr_accessible :is_public, :name, :type, :vid
end
