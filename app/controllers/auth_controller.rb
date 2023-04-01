class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

def create
  @admin = Admin.find_by(adminname: admin_login_params[:adminname])
  #User#authenticate comes from BCrypt
  if @admin&.authenticate(admin_login_params[:password])
    # encode token comes from ApplicationController
    token = encode_token({ admin_id: @admin.id })
    render json: { admin: AdminSerializer.new(@admin), jwt: token }, status: :accepted
  else
    render json: { message: 'Invalid adminname or password' }, status: :unauthorized
  end
end

private

def admin_login_params
  # params { admin: {adminname: 'Chandler Bing', password: 'hi' } }
  params.permit(:adminname, :password)
end
end
