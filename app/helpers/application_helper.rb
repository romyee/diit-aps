module ApplicationHelper
  
  def link_to_nested_model(name, form_object, association)
    new_object = form_object.object.send(association).klass.new
    object_id  = new_object.object_id

    fields = form_object.fields_for(association, new_object, child_index: object_id) do |builder|
      render association.to_s.singularize + "_fields", f: builder
    end
    link_to name, "#", class: "add_fields btn", data: { id: object_id, fields: fields.gsub("\n", "")}
  end
  
  def show_default_value(org_value, default_value = "N/A")
    if org_value
      org_value
    else
      default_value
    end
  end

  def show_nested_models_fields(form_object, association, field)
    new_object = form_object.object.send(association).klass.new
    object_id = new_object.object_id
    fields = form_object.fields_for(association, new_object, child_index: object_id) do |builder|
      render association.to_s, f:builder, field:field
    end
  end
  
  def not_found_message
    "No Data Found"
  end
  
  def get_status_name(status_code)
    if status_code == 5
      "Processing"
    elsif status_code == 111
      "Canceled"
    elsif status_code == 10
      "Accepted"
    else
      "Pending"
    end
  end
  
  def get_application_status_name(status_code)
    if status_code == 1 || status_code == 5
      "forwarded"
    elsif status_code == 10
      "accepted"
    elsif status_code == 111
      "rejected"
    end
  end
  
  def get_user_level_name(role)
    if role == 1
      "Student"
    elsif role == 5
      "Staff"
    elsif role == 10
      "Admin"
    end
  end
end
