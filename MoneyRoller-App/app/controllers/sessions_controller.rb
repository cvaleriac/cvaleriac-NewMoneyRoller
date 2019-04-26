class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to rollovers_path
    else
        flash[:notice] = 'Log in failed. Please try again.'
        render :new
      end
    end

    def fbcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['email']
            u.password = 'password'
          end
       
        session[:user_id] = @user.id

    redirect_to rollovers_path

    end

    def destroy
        session.delete :user_id
        @current_user = nil
        flash[:notice] = 'You have been successfully logged out.'
        redirect_to root_path
      end
    
    
    private 

    def auth
    request.env['omniauth.auth']
    end

end




