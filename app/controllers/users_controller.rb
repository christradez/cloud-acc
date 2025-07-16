class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @tenant = Tenant.new(name: params[:user][:company_name], subdomain: params[:user][:subdomain])
    if @tenant.save
      @user = @tenant.users.build(email: params[:user][:email], password: params[:user][:password])
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_url, notice: 'Signed up!'
      else
        @tenant.destroy
        render :new
      end
    else
      @user = User.new(email: params[:user][:email])
      render :new
    end
  end
end
