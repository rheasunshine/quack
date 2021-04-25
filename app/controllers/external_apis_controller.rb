class ExternalApisController < ApplicationController
  before_action :set_external_api, only: %i[ show edit update destroy ]

  # GET /external_apis or /external_apis.json
  def index
    @external_apis = ExternalApi.all
  end

  # GET /external_apis/1 or /external_apis/1.json
  def show
  end

  # GET /external_apis/new
  def new
    @external_api = ExternalApi.new
  end

  # GET /external_apis/1/edit
  def edit
  end

  # POST /external_apis or /external_apis.json
  def create
    binding.pry
    @external_api = ExternalApi.new(external_api_params)

    respond_to do |format|
      if @external_api.save
        format.html { redirect_to @external_api, notice: "External api was successfully created." }
        format.json { render :show, status: :created, location: @external_api }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @external_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /external_apis/1 or /external_apis/1.json
  def update
    respond_to do |format|
      if @external_api.update(external_api_params)
        format.html { redirect_to @external_api, notice: "External api was successfully updated." }
        format.json { render :show, status: :ok, location: @external_api }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @external_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_apis/1 or /external_apis/1.json
  def destroy
    @external_api.destroy
    respond_to do |format|
      format.html { redirect_to external_apis_url, notice: "External api was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_api
      @external_api = ExternalApi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def external_api_params
      params.require(:external_api).permit(:name, :description, :partner_id)
    end
end
