class CustomerDocument < ActiveRecord::Base
  belongs_to :servey
  belongs_to :customer
  
  attr_accessible :photo, :photo_name, :servey_id, :customer_id
 #  #validates_presence_of :customer_id, :photo, :photo_name

 #  mount_uploader :photo, PhotoUploader
 # IMAGE_SIZES = {
 #    :thumb =>[400, 400],
 #    :small => [800, 600],
 #    :medium => [1024, 768],
 #    :large => [1600, 1200],
 #    :max => [2272, 1704]
 #  }


  has_attached_file :photo#, :styles => { :small => "400x400", :thumb => "100x100", :media => "64x64" }#,
                    #:url  => "/assets/products/:id/:style/:basename.:extension",
                    #:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['application/pdf', 'application/msword', 'text/plain']

end
