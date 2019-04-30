class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to rollovers_path
      else
        render :new
  end
end

  def destroy
    @user.destroy
    session.delete :user_id
    @current_user = nil
  redirect_to root_path
end

private

def user_params
  params.require(:user).permit(:username, :email, :password)
end

end          
      