class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessor :email, :password, :password_confirmation, :remember_me, :role, :tab_id, :name, :profile_attributes
  #validates_uniqueness_of :tab_id, :allow_nil => true
  has_one :profile
  belongs_to :tab
  has_many :attendences
  accepts_nested_attributes_for :profile
  ROLES = %w[super_user tab_user temp_super_user]

  def admin?
    self.role == 'super_user'
  end

  def role_name?
    return !!self.role
  end

  def super_user?
    self.role == 'super_user'
  end

  def tab_user?
    self.role == 'tab_user'
  end

  def temp_admin?
    self.role == 'temp_super_user'
  end
  

end

