class SessionsController < ApplicationController
    
    def new
        # render login page
    end

    def create
        @user= User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to "/users/#{@user.id}"
        else
            flash[:errors]= ["Invalid user and or password"]
            redirect_to "/sessions/new"
        end
    end

    def destroy
        reset_session
        redirect_to "/sessions/new"
    end
end
