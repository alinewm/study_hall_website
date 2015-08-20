class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email,
                                 :name,
                                 :school,
                                 :birthday,
                                 :grade,
                                 :city,
                                 :state,
                                 :password,
                                 :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email,
                                 :name,
                                 :school,
                                 :birthday,
                                 :grade,
                                 :city,
                                 :state,
                                 :password,
                                 :password_confirmation,
                                 :current_password)
  end

end
