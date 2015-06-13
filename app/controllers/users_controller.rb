class UsersController < ApplicationController

  def index
    # send all users to index view
    @users = User.all
    # not required, but helps manage view, especially for partials
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    redirect_to show_user_path(@user.id)
  end

  def show
  	@user = User.find(params[:id])
  	render :show
  end

  def edit
  	@user = User.find(params[:id])
  	render :edit
  end

  def update
  	@user = User.find(params[:id])
  	@user.update_attributes(user_params)
  	redirect_to show_user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
