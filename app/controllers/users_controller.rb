class UsersController < ApplicationController
  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_ruby,
                                 :first_name_ruby, :date_of_birth)
  end
end
