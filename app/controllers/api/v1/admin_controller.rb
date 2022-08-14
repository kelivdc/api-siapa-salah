class Api::V1::AdminController < ApplicationController
  skip_before_action :authenticate_request
  
  def login
    @admin = Admin.find_by(username: params[:username])
    if @admin&.authenticate(params[:password])
      token = jwt_encode(admin_id: @admin.id)
      render json: {token: token, fullname: @admin.fullname}
    else
      render json: {message: 'Invalid username or password'}, status: :bad_request
    end
  end
end
