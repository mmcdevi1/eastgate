module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true, :no_intra_emphasis => true, :strikethrough => true,
      :underline => true, :quote => true, :headers => true)
    markdown.render(text).html_safe
  end

end
