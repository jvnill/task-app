module TasksHelper
  PRIORITY_MAPPING = {
    'Low' => 'success',
    'Medium' => 'warning',
    'High' => 'danger'
  }

  def due_date_rendering(due_date)
    return if due_date.blank?

    content_tag(:div, class: 'alert alert-secondary text-center py-2') do
      due_date.strftime('%a, %d %b %Y, %-l:%M%P')
    end
  end

  def priority_rendering(priority)
    content_tag(:div, "#{priority} Priority", class: "alert alert-#{PRIORITY_MAPPING[priority]} text-uppercase text-center py-2")
  end

  def validation_text(record, attr)
    content_tag(:div, record.errors[attr].to_sentence, class: 'error')
  end
end
