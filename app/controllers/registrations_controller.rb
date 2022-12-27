class RegistrationsController < ApplicationController
  def new
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nick_name, :family_name, :first_name, :family_name_kana, :first_name_kana,
                                             :nick_name, :birth_day])
  end
end
