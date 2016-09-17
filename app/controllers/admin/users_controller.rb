module Admin
  class UsersController < Admin::BaseController
    def index
    end

    def edit
      @user = current_user
    end

    def update
      user = current_user
      if user.update(user_params)
        redirect_to
      end
    end
  end
end
