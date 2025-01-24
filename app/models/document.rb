class Document < ActiveRecord::Base
  # attr_accessor :customer_id
  has_attached_file :document
  validates_attachment_presence :document
  validates_attachment_size :document, :less_than => 5.megabytes
  validates_attachment_content_type :document, :content_type => ['application/pdf', 'application/msword', 'text/plain', "image/jpeg", "image/png" ]
end