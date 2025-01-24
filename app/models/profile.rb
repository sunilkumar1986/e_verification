class Profile < ActiveRecord::Base
  attr_accessor :user_id, :photo, :contact_no_1, :contact_no_2, :blood_group, :address, :date_of_birth, :verification_area, :hobbies
  #validates_uniqueness_of :contact_no_1, :contact_no_2, :message=>"is already assigned !"
  #validates_presence_of :address, :contact_no_1, :contact_no_2
  #validates :contact_no_1, :contact_no_2, :length => {
  #  :minimum   => 10,
  #  :maximum   => 10,
  #  :too_short => "Invalid Contact Number",
  #  :too_long  => "Invalid Contact Number"
  #}
  #attr_accessor :photo_file_name
  belongs_to :user
  #belongs_to :tab

  extend FriendlyId
  friendly_id :user_id, use: :slugged

  has_attached_file :photo,
     :styles => {
       :media => "64x64",
       :thumb=> "100x100",
       :small  => "400x400" }
end
