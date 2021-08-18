class SessionsController < ApplicationController

    skip_before_action :require_login, except: [:destroy]
    skip_before_action :require_login, only: [:new, :create]

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
        session.clear
        redirect_to "/sessions/new"
    end
end
