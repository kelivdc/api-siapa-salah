class Api::V1::CategoriesController < ApplicationController
  before_action :set_api_v1_category, only: %i[ show update destroy ]

  # GET /api/v1/categories
  def index   
    keyword = params[:keyword] || ''
    @pagy, @records = pagy(Category.where("LOWER(name) LIKE ?", "%" + keyword.downcase + "%"), page: params[:page], items: params[:items])
    records = CategoryBlueprint.render(@records)
    render json: {pagy: @pagy, records: JSON.parse(records)}
  end

  # GET /api/v1/categories/1
  def show
    render json: @api_v1_category
  end

  # POST /api/v1/categories
  def create    
    @api_v1_category = Category.new(api_v1_category_params)
    if @api_v1_category.save
      render json: @api_v1_category, status: :created
    else
      render json: @api_v1_category.errors.full_messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/categories/1
  def update
    if @api_v1_category.update(api_v1_category_params)
      render json: @api_v1_category
    else
      render json: @api_v1_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/categories/1
  def destroy
    if @api_v1_category.destroy
      render json: @api_v1_category, status: :ok
    else
      render json: @api_v1_category.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_category
      @api_v1_category = Category.find_by(slug: params[:slug])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_category_params
      params.permit(:name, :slug, :sort, :publish)
    end
end
