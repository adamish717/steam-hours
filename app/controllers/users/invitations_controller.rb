class Users::InvitationsController < Devise::InvitationsController
  # Allow unauthenticated users to accept invitations, and set their password
  skip_before_filter :auth_user, only: [:edit, :update]

  def after_invite_path_for(resource)
    admin_path
  end
end
