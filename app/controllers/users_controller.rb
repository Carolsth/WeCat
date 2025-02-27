class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Cadastro realizado com sucesso"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :phone, :email, :password)
  end
end
