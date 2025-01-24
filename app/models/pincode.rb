class Pincode < ActiveRecord::Base
  attr_accessor :name, :pin_number, :city, :city_id
  has_many :tabs
  has_many :customers
  has_many :co_applicants
  has_many :co_applicant_business
  has_many :co_applicant_work_details
  has_many :work_serveys
  belongs_to :city
  validates_presence_of :city_id
  validates :name, uniqueness: { case_sensitive: false }
end
