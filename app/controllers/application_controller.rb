class ApplicationController < ActionController::Base
  #deviseコントローラーにストロングパラメータを追加
  before_action :configure_permitted_parameters , if: :devise_controller?

  protected 
  #クラスの外からは呼び出せない。同じインスタンス内で呼び出せる。他のインスタンスでも同じクラスやサブクラスであれば呼び出せる。
    
  def configure_permitted_parameters
  #サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  #アカウント編集時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile])
  end
end
