def login
    user = User.find_by(name: params[:user][:name])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signin_path
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    session[:user_id] = User.last.id
    redirect_to user_path(current_user)
  end



  def user_params
    params.require(:user).permit(:username, :password)
  end

end