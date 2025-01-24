class CustomerDocument < ActiveRecord::Base
  belongs_to :servey
  belongs_to :customer
  
  attr_accessor :photo, :photo_name, :servey_id, :customer_id, :file_name


  has_attached_file :photo
  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 50.megabytes
  validates_attachment_content_type :photo, :content_type => ['application/pdf', 'application/msword', 'text/plain', "image/jpeg", "image/png"]

  before_create :randomize_file_name

private

  def randomize_file_name
    extension = File.extname(photo_file_name).downcase
    #self.photo.instance_write(:file_name, 'test')
  end

end
