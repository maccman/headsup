module ApplicationHelper
  def manifest_attr
    return '' unless Rails.env.production?
    %{manifest="manifest.yml"}.html_safe
  end
end
