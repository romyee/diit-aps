class FormField < ActiveRecord::Base
  attr_accessible :answer_opitons, :answer_type, :description, :label, :mandetory, :form_id
  belongs_to :form
  validates_presence_of :label, :answer_type
end
