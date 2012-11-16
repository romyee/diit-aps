class ApplicationFormField < ActiveRecord::Base
  belongs_to :application_form
  belongs_to :form_field
  attr_accessible :field_answer, :form_field_id
end
