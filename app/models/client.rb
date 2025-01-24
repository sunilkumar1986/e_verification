class Client < ActiveRecord::Base
  attr_accessor :name
  has_many :customers
  validates_uniqueness_of :name
end
