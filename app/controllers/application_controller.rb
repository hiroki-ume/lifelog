class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index, :top, :about]
  before_action :search
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    def search
      @search = Post.ransack(params[:q])
      @result = @search.result(distinct: true).page(params[:page]).reverse_order
    end
end
