class Admin::UsersController < ApplicationController

  def new 
    if current_user.admin
      @users = User.all.page(params[:page]).per(2)
    else
      redirect_to movies_path, notice: "Gtfo you hacker!"
    end

  end

end