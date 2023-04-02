class GymsController < ApplicationController
  skip_before_action :authorized, only: %i[ index ]

  # GET /gyms
  def index
    @gyms = Gym.all

    render json: @gyms
  end

  # GET /gyms/1
  def show
    gyms = current_admin.gyms.find_by(id: params[:id])
    if gyms
      render json: gyms
    else
      render json: { error: "Gym not found" }, status: :not_found
    end
  end

  # POST /gyms
  def create
    gyms = current_admin.gyms.new(gym_params)
    if gyms.save
      render json: gyms , status: :created, location: gyms
    else
      render json: gyms.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gyms/1
  def update
    gyms = current_admin.gyms.find_by(id: params[:id])
      if gyms
        if gyms.update(gym_params)
          render json: gyms, status: :ok
        else
          render json: { errors: gyms.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "Gym not found" }, status: :not_found
      end
  end

  # DELETE /gyms/1
  def destroy
    gyms = current_admin.gyms.find_by(id: params[:id])
    gyms.destroy
    head :no_content
  end

  private
    # Only allow a list of trusted parameters through.
    def gym_params
      params.permit(:image, :name, :location, :operatingHours, :price, :contact, :admin_id)
    end
end
