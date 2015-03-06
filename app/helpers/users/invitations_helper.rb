module Users
  module InvitationsHelper

    def invitaion_token
      request.params[:invitation_token]
    end
  end
end
