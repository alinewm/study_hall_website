module ApplicationHelper
  def class_for
    "#{controller_name}-#{action_name}"
  end
end
