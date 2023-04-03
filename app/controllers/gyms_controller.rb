class GymsController < ApplicationController
  skip_before_action :authorized, only: [:index, :create, :show, :update, :destroy]

  # GET /gyms
  def index
    @gyms = Gym.all

    render json: @gyms
  end

  # GET /gyms/1
  def show
    gym = current_admin.gyms.find_by(id: params[:id])
    if gym
      render json: gym
    else
      render json: { error: "Gym not found" }, status: :not_found
    end
  end

  # POST /gyms
  def create
    gym = current_admin.gyms.new(gym_params)
    if gym.save
      render json: gym , status: :created
    else
      render json: gym.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gyms/1
  def update
    gym = current_admin.gyms.find_by(id: params[:id])
      if gym
        if gym.update(gym_params)
          render json: gym, status: :ok
        else
          render json: { errors: gym.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "Gym not found" }, status: :not_found
      end
  end

  # DELETE /gyms/1
  def destroy
    gym = current_admin.gyms.find_by(id: params[:id])
    gym.destroy
    head :no_content
  end

  private
    # Only allow a list of trusted parameters through.
    def gym_params
      params.permit(:image, :name, :location, :operatingHours, :price, :contact, :admin_id)
    end
end
