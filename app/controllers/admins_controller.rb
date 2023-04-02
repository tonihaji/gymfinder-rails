class AdminsController < ApplicationController
  
  skip_before_action :authorized, only: %i[ create ]

  def profile
    render json: { admin: AdminSerializer.new(current_admin) }, status: :accepted
  end
  
  # POST /admins
  def create 
    admin = Admin.create(admin_params)
    if admin.valid?
      token = encode_token({ admin_id: admin.id })
      render json: { success: 'admin saved successfully!', jwt: token }
    else
      render json: admin.errors.messages, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def admin_params
      params.permit(:adminname, :email, :password)
    end
end
