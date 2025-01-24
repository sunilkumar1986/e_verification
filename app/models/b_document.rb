class BDocument < ActiveRecord::Base
  validates_uniqueness_of :name
  attr_accessor :name
  has_and_belongs_to_many :businesses
end
