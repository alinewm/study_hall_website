module ApplicationHelper
  def body_tag(&block)
    content_tag :body, yield, class: "#{controller_name}-#{action_name}"
  end
end
