class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    if resource.is_cafe_owner?
      new_cafe_path
    else
      super
    end
  end
end
