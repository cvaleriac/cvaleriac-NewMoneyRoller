class SessionsController < ApplicationController
    
    def new
        @user = User.new
        render :new
    end

    def create
      @user = User.find_by(email: params[:user][:email], username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to rollovers_path
    else
        flash[:error] = 'Log in failed. Please try again.'
        redirect_to '/login'
      end
    end

    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.username = auth['info']['email']
        u.password = 'password'   
      end
          @user.save
          session[:user_id] = @user.id

    redirect_to rollovers_path

    end

    def destroy
        session.delete :user_id
        @current_user = nil
        flash[:notice] = 'You have been successfully logged out.'
        redirect_to '/'
      end
    
    
    private 

    def auth
    request.env['omniauth.auth']
    end

end




