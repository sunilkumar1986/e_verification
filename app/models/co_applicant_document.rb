class CoApplicantDocument < ActiveRecord::Base
  attr_accessor :co_applicant_servey_id, :photo, :co_applicant_id
  belongs_to :co_applicant_servey

	has_attached_file :photo, :styles => { :small => "400x400", :thumb => "100x100", :media => "64x64" }#,
	                  #:url  => "/assets/products/:id/:style/:basename.:extension",
	                  #:path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['application/pdf', 'application/msword', 'text/plain']

end
