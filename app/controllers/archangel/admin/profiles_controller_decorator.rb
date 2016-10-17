Archangel::Admin::ProfilesController.class_eval do
  before_action :set_retoken_profile, only: [:retoken]

  def retoken
    @profile.regenerate_api_token

    respond_with @profile, location: -> { admin_profile_path }
  end

  protected

  def set_retoken_profile
    @profile = current_user
  end
end
