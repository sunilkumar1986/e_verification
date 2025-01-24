class Tab < ActiveRecord::Base
  attr_accessor :name, :tab_code, :pin_code, :pincode_id

  has_one :profile
  has_one :user
  belongs_to :pincode
  has_many :customers
  has_many :customer_verifications, :dependent => :destroy  
  has_many :co_applicants
  has_many :serveys, :dependent => :destroy
  #validation
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }


  def tab_pending(tab)
    CustomerVerification.joins(:customer, :tab).where('customers.status' => 'submitted', 'tabs.id' => 1)
  end

end
