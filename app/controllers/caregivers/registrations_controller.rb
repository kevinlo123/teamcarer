# frozen_string_literal: true

class Caregivers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  include Accessible
  skip_before_action :check_user, except: [:new, :create]
  before_action :configure_sign_up_params, only: [:create]
 # before_action :configure_account_update_params, only: [:update]

 # GET /resource/sign_up
   def new
      super
   end

   def city
      @cities = CS.get(:us,params[:state]) 
      respond_to do |format|
         format.js { render '/caregivers/registrations/new.js.erb' }         
         format.html { redirect_to care_giver_steps_path } 
      end
   end

   # POST /resource
   def create
      if verify_recaptcha
         super
      else
         build_resource(sign_up_params)
         clean_up_passwords(resource)
         flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
         flash.delete :recaptcha_error
         render :new
      end
   end

   def search

   end

   # GET /resource/edit
   def edit
      @state = current_care_giver.state
      super
   end

   # PUT /resource
   def update
      super
   end

   # DELETE /resource
   def destroy
      super
   end

   # GET /resource/cancel
   # Forces the session data which is usually expired after sign
   # in to be expired now. This is useful if the user wants to
   # cancel oauth signing in/up in the middle of the process,
   # removing all OAuth session data.
   # def cancel
   #   super
   # end

   protected

   # If you have extra params to permit, append them to the sanitizer.
      def configure_sign_up_params
         devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :middlename, :lastname, :phone, :city, :state, :street, :zip, :search, :emergency_contact, :emergency_number, :who_pays, :heard_from])
      end

   # If you have extra params to permit, append them to the sanitizer.
      def configure_account_update_params
         devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :middlename, :lastname, :phone, :city, :state, :street, :zip, :search, :emergency_contact, :emergency_number])
      end

      def after_update_path_for(resource)
         "/care_givers/edit"
      end

   # The path used after sign up.
      def after_sign_up_path_for(resource)
         care_giver_steps_path
      end

   # The path used after sign up for inactive accounts.
   # def after_inactive_sign_up_path_for(resource)
   #   super(resource)
   # end
end
