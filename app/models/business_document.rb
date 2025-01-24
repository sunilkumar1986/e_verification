class BusinessDocument < ActiveRecord::Base
  attr_accessor :business_id, :work_servey_id , :photo
  belongs_to :business
  belongs_to :work_servey

  has_attached_file :photo, :styles => { :small => "400x400", :thumb => "100x100", :media => "64x64" }#,
                    #:url  => "/assets/products/:id/:style/:basename.:extension",
                    #:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
