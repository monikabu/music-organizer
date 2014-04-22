class WelcomeController < ApplicationController
  def index
    if current_user
     @user = current_user.id
   else
     redirect_to new_user_session_path, notice: 'You are not logged in.'
   end
  end
end
