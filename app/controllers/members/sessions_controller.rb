class Members::SessionsController < Devise::SessionsController
  # before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in

  # def new
  #   super
  # end

  # POST /resource/sign_in
 # def create
  #   super
  #   member_id = current_user.id
  #   count = Member.find(member_id).login_count
  #   count = count + 1
  #   if user_signed_in?
  #     member = Member.find(member_id)
  #     member.update(:is_active => "true", :login_count => count)
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   member_id = current_user.id
  #   count = Member.find(member_id).login_count
  #   count = count - 1
  #   if count <= 0 
  #     if user_signed_in? == true
  #       member = Member.find(member_id)
  #       member.update(:is_active => "false", :login_count=> 0)
  #     end
  #   else
  #     if user_signed_in?
  #       member = Member.find(member_id)
  #       member.update(:is_active => "true", :login_count=> count)
  #     end
  #   end 
  #   super
  # end

  
  # protected
  
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
