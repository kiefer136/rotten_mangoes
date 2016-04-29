class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome aboard. my homie #{@user.firstname}!"
    else
      render :new
    end
  end

   def destroy
    puts "In users_controller > destroy"
    @user = User.find(params[:id])
    
    # @user.destroy
    # if @user.destroy 
    #   UserMailer.delete_email(@user).deliver_later
    #   format.html { redirect_to(@user, notice: 'User was successfully created.') }
    #   format.json { render json: @user, status: :created, location: @user }
    # else
    #   render :new
    #   format.html { render action: 'new' }
    #   format.json { render json: @user.errors, status: :unprocessable_entity }
    # end
  end
    # redirect_to movies_path

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end
end
