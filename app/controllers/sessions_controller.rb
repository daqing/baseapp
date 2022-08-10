class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(session_params[:name])
    if user.nil?
      flash[:error] = "登录失败"
      redirect_to root_path and return
    end

    if user.authenticate_password(session_params[:password])
      login(user)

      flash[:success] = "登录成功"
    else
      flash[:error] = "登录失败"
    end

    redirect_to root_path
  end

  def destroy
    sign_out

    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
