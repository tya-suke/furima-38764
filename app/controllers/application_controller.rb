class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  end

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit :sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :nick_name, :birth_day]
  end

end