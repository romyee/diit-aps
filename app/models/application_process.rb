class ApplicationProcess < ActiveRecord::Base
  attr_accessible :application_form, :message, :purpose, :reffer_to_id, :refferer_id, :status, :application_form_id, :last_process_id
  belongs_to :reffer_to, :class_name => "User"
  belongs_to :application_form
  attr_accessor :last_process_id
  
  after_create :update_application_status
  
  private
  def update_application_status
    application = self.application_form
    if status == 1
         application.update_attributes(:status => 5)
         Notifications.application_forwarded(self).deliver
    elsif status == 10
      application.update_attributes(:status => 10)
      Notifications.approved(self).deliver
    elsif status == 111
      application.update_attributes(:status => 111)
      Notifications.rejected(self).deliver
    end
  end
end
