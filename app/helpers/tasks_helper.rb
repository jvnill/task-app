module TasksHelper
  def validation_text(record, attr)
    content_tag(:div, record.errors[attr].to_sentence, class: 'invalid-feedback')
  end
end
