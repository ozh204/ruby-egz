class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "Konto utworzone !"
      redirect_to @user
    else
      flash[:danger] = "Konto nie mogło zostać utworzone !"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.destroy(params[:id])

    redirect_to users_path
  end

  def destroy_multiple

    count = 0
    if params[:users]
      count = params[:users].count
      User.destroy(params[:users])
    end

    if count == 0
      flash[:danger] = "Nie wybrałeś żadnych kont !"
    elsif count == 1
      flash[:success] = count.to_s + " konto zostało usunięte !"
    else
      flash[:success] = count.to_s + " kont zostało usuniętych !"
    end

    redirect_to users_path

  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
