class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[ show ]

  # GET /users/1
  def show
    gym = Gym.find_by(id: params[:id])
      if gym
        render json: gym
      else
        render json: { error: "Gym not found" }, status: :not_found
      end
  end
end
