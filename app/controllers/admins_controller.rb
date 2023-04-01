class AdminsController < ApplicationController
def index
    admin = Admin.all 
    render json: admin   
end
     # skip_before_action :authorized, only: [:create]
  
    # def profile
    #   render json: { admin: AdminSerializer.new(current_admin) }, status: :accepted
    # end
  
    # def create 
    #   admin = Admin.create(admin_params)
    #   if admin.valid?
    #     token = encode_token({ admin_id: admin.id })
    #     render json: { success: 'admin saved successfully!', jwt: token }
    #   else
    #     render json: admin.errors.messages, status: :unprocessable_entity
    #   end
    # end
  
    # def show
    #   admin = current_admin.admins.find_by(id: params[:id])
    #   if admin
    #     render json: admin
    #   else
    #     render json: { error: "Admin not found" }, status: :not_found
    #   end
    # end
    
      
    # private
    
    # def admin_params
    #   params.permit(:adminname, :email, :password)
    # end
  end
  