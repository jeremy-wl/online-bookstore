module StoreHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # handle with different redirection based on different roles
  def after_sign_in_path_for(resource_or_scope)
    return '/admin' if current_user.try(:admin?)
    store_url
  end

end
