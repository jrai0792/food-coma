module ApplicationHelper
  def display_propper_flash
    if flash[:notice]
      content_tag(:div, flash[:notice], class: 'flash notice', align: 'center')
    elsif flash[:success]
      content_tag(:div, flash[:success], class: 'flash success', align: 'center')
    elsif flash[:danger]
      content_tag(:div, flash[:danger], class: 'flash danger', align: 'center')
    end
  end

  def errors_message(object)
    return unless object.errors.any?

    content_tag(:div, nil, class: 'errors') do
      content_tag(:p) do
        "You have the following #{pluralize(object.errors.count, 'error')}"
      end +
        content_tag(:ul) do
          object.errors.full_messages.each do |msg|
            concat content_tag(:li, "- #{msg}")
          end
        end
    end
  end
end
