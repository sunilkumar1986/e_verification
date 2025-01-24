class Attendence < ActiveRecord::Base
  # attr_accessor :login_date, :login_time, :logout_time, :user_id
  belongs_to :user
end
