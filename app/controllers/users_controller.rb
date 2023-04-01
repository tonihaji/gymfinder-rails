class UsersController < ApplicationController
    skip_before_action :authorized, only: [:show]

    def show
        gym = Gym.find_by(id: params[:id])
        if gym
          render json: gym
        else
          render json: { error: "gym not found" }, status: :not_found
        end
      end
end
