class SignupsController < ApplicationController
# rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def create
    signup = Signup.create(signup_params)
    if signup.valid?
      render json: signup.activity, status: :created
    else
      render json: { errors: signup.errors.full_messages }, status: :unprocessable_entity
    end
    
  end

  private

  def signup_params
    params.permit(:time, :activity_id, :camper_id)
  end

  # def render_unprocessable_entity
    
  # end

end
