class ActivitiesController < ApplicationController

  def index
    activities = Activity.all
    render json: activities
  end

  def destroy
    activity = Activity.find_by_id(params[:id])
    if activity
      activity.destroy
    else
      render json: { error: "Activity not found" }, status: :not_found
    end
  end

end
