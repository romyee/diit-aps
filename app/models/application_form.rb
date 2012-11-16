class ApplicationForm < ActiveRecord::Base

  belongs_to :user
  belongs_to :form
  has_many :application_form_fields, :dependent => :destroy
  has_many :application_processes

  attr_accessible :comment, :status, :tracking_id, :user_id, :form_id, :application_form_fields_attributes
  accepts_nested_attributes_for :application_form_fields,  :allow_destroy => true
  
  before_save :set_tracking_id
  after_create :send_notification
  
  private
  def set_tracking_id
    self.tracking_id = Time.now.to_i
  end
  
  def send_notification
    Notifications.application_submitted(self).deliver
    Notifications.application_received(self).deliver
  end
end