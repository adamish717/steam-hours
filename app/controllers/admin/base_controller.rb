class Admin::BaseController < ApplicationController
  before_filter :admin_only

  protected

  def admin_only
    redirect_to root_path unless current_user.admin?
  end
end
