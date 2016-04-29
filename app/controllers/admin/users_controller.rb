class Admin::UsersController < ApplicationController

  def new 
    if current_user.admin
      @users = User.all.page(params[:page]).per(2)
    else
      redirect_to movies_path, notice: "Gtfo you hacker!"
    end
  end

  def destroy
    if @user = User.find(params[:id])
      flash[:notice] = "#{@user.firstname} was obliterated"
      UserMailer.delete_email(@user)
    # @user.destroy
      redirect_to '/admin/users/new'
   end
  end

end
