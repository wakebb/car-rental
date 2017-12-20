class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @approval = Approval.new
      @approval.User_id = @user.id
      @approval.status = 0
      @approval.comment = ''
      if @approval.save
        redirect_to @user, notice: 'User is created successfully.'
      else
        render action: 'new'
      end
    else
      render action: 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :license,:user_type, :cardinfo, :name, :address)
  end

end
