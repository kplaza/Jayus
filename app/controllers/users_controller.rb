class UsersController < ApplicationController
before_action :authenticate_user!
  def show 
    puts params
    @id = params[:id]
    @user = User.find(@id)
    @message = "hello user "
  end 
end
