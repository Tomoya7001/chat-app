class Public::UsersController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about]

  def show
    @user = User.find(params[:id])
    if @user == current_customer
      redirect_to public_my_page_path
    else
      @users = User.all
    end
  end

  def edit
  end
end
