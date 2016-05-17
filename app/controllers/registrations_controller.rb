class RegistrationsController < Devise::RegistrationsController

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end

  private

  def sign_up_params
    params.require(:user).permit(:id_document, :mobile_phone, :home_phone, :address, :id_string, :birthday, :country, :id_card, :first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:id_document, :mobile_phone, :home_phone, :address, :id_string, :birthday, :country, :id_card, :first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
  end
end
