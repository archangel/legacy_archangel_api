Archangel::Admin::UsersController.class_eval do
  before_action :set_retoken_user, only: [:retoken]

  def retoken
    @user.regenerate_api_token

    respond_with @user, location: -> { admin_users_path }
  end

  protected

  def set_retoken_user
    @user = Archangel::User.find_by!(username: params[:id])

    authorize @user
  end
end
