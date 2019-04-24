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
    
    def fbcreate
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.username = auth['info']['email']
      u.password = 'password'
      u.password_confirmation = 'password'
    end
    @user.save
    session[:user_id] = @user.id

    redirect_to user_path(@user)
end     
end


