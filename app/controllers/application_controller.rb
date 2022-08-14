class ApplicationController < ActionController::API
    include JsonWebToken
    include Pagy::Backend

    before_action :authenticate_request

    private
    def authenticate_request
        begin
            header = request.headers["Authorization"]
            header = header.split(" ").last if header            
            admin_id = jwt_decode(header)            
            if !@current_user = Admin.find(admin_id)            
                render json: {message: "Not authorized"}, status: :unprocessable_entity
            end
        rescue
            render json: {message: "Not authorized"}, status: :unprocessable_entity
        end
    end
end
