class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = authenticate_session(session_params)

    if sign_in(user)
      flash[:notice] = 'You have successfully signed in.'
      redirect_to root_path
    else
      flash[:notice] = 'Wrong email or password.'
      render :new
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'Successfully signed out.'
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
