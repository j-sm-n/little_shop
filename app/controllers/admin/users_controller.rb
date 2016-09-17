module Admin
  class UsersController < Admin::BaseController
    def show
    end

    def edit
      @user = current_user
    end

    def update
      user = current_user
    end

    private

    


  end
end
