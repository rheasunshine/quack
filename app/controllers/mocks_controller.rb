class MocksController < ApplicationController
  before_action :set_mock, only: %i[ show edit update destroy move ]

  # GET /mocks or /mocks.json
  def index
    @mocks = Mock.order(:position)
  end

  def move
    @mock.insert_at(params[:position].to_i)
    head :ok
  end

  # GET /mocks/1 or /mocks/1.json
  def show
  end

  # GET /mocks/new
  def new
    @mock = Mock.new
  end

  # GET /mocks/1/edit
  def edit
  end

  # POST /mocks or /mocks.json
  def create
    @mock = Mock.new(mock_params)

    respond_to do |format|
      if @mock.save
        format.html { redirect_to @mock, notice: "Mock was successfully created." }
        format.json { render :show, status: :created, location: @mock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mocks/1 or /mocks/1.json
  def update
    respond_to do |format|
      if @mock.update(mock_params)
        format.html { redirect_to @mock, notice: "Mock was successfully updated." }
        format.json { render :show, status: :ok, location: @mock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mocks/1 or /mocks/1.json
  def destroy
    @mock.destroy
    respond_to do |format|
      format.html { redirect_to mocks_url, notice: "Mock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mock
      @mock = Mock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mock_params
      params.require(:mock).permit(:name, :description, :request_method, :status, :content_type, :body_type, :body_content, :active, :position, :endpoint_id, headers_attributes: %i[name value])
    end
end
