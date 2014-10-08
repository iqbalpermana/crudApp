class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      # login admin
      sign_in admin
      redirect_to root_url
    else
      if admin
        message = "Password salah"
      else
        message = "Email tidak terdaftar"
      end
      flash.now[:error] = message
      render 'new'
    end

  end


  def destroy
    sign_out
    redirect_to root_url
  end
end
