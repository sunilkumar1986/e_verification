class WorkServeyVerification < ActiveRecord::Base
  attr_accessor :tab_id, :user_id, :work_servey_id
  belongs_to :work_servey
  belongs_to :tab
end
