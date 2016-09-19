module Admin
  class UsersController < Admin::BaseController
    def show
      @user = current_user
      @orders = Order.all
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user
      if @user.update(user_params)
        redirect_to dashboard_path
      else
        flash.now[:warning] = "Please make sure fields are updated correctly"
        render :edit
      end
    end
  end
end
