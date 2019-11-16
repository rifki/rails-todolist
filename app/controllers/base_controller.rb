class BaseController < ApplicationController
  before_action :user_login?

  def user_login?
    if not current_user
      redirect_to("/users/sign_in")
    end
  end
end
