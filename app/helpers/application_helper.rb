module ApplicationHelper
  def manifest_attr
    return '' unless Rails.env.production?
    %{manifest="#{manifest_path}"}.html_safe
  end
end
