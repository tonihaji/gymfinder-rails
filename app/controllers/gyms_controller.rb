class GymsController < ApplicationController
    skip_before_action :authorized, only: [:index]
  
      # GET/gyms
      def index
          render json:Gym.all
      end
  
       # GET /gyms/:id
    def show
      gym = current_admin.gyms.find_by(id: params[:id])
      if gym
        render json: gym
      else
        render json: { error: "gym not found" }, status: :not_found
      end
    end
  
    
  
    def create
      gym = current_admin.gyms.new(gym_params)
      print "Hey! #{current_admin}"
      if gym.save
        render json: gym , status: :created, location: gym
      else
        render json: gym.errors, status: :unprocessable_entity
      end
    end
    
     # DELETE /gyms/1
     def destroy
      gym = current_admin.gyms.find_by(id: params[:id])
      gym.destroy
      head :no_content
  
    end
  
      #PATCH /gym/:id
      
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
        
  
    private
    
    def gym_params
      params.permit(:image, :name, :location, :operatingHours, :price, :contact)
    end
    
     
  end
  
