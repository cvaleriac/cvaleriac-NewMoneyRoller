class SessionsController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user & @user.authenticate(params[:user][:password])
            session[:user_id] = @user.user_id
            redirect_to rollovers_path
        else
            render :new
        end
    end
    

end
