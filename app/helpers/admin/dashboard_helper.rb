module Admin::DashboardHelper
  def time_since_invite user
    "Invited #{time_ago_in_words(user.invitation_created_at)}"
  end
end
