class Form < ActiveRecord::Base
  attr_accessible :description, :last_date, :note, :requirements, :sub_title, :title, :form_fields_attributes
  has_many :form_fields, :dependent => :destroy
  has_many :applicationforms, :class_name => "ApplicaitonForm"
  accepts_nested_attributes_for :form_fields,  :allow_destroy => true
  
  validates_presence_of :title, :last_date
end
