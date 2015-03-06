class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Users::OmniauthCallbacksHelper


  skip_before_filter :auth_user

  def google_oauth2
    @user = User.find_for_google_oauth2(request.env['omniauth.auth'])
    email = request.env['omniauth.auth']['info']['email']

    if accepting_invatation
      if @user == User.find_by_invitation_token(state_params['invitation_token'], only_valid: true)
        @user.accept_invitation!
        sign_in_success
      else
        flash[:error] = "Invitaion not found for #{email}"
        redirect_to accept_user_invitation_path(invitation_token: state_params['invitation_token'])
      end
    else
      if @user
        sign_in_success
      else
        flash[:error] = "No know user #{email}"
        redirect_to new_user_session_path
      end
    end
  end

  private

  def sign_in_success
    flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', :kind => 'Google'
    sign_in_and_redirect @user, event: :authentication
  end
end
