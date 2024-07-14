module TasksHelper
  PRIORITY_MAPPING = {
    'Low' => 'success',
    'Medium' => 'warning',
    'High' => 'danger'
  }

  def priority_rendering(priority)
    content_tag(:div, "#{priority} Priority", class: "alert alert-#{PRIORITY_MAPPING[priority]} text-uppercase text-center p-0 py-2 smaller")
  end

  def validation_text(record, attr)
    content_tag(:div, record.errors[attr].to_sentence, class: 'error')
  end
end
