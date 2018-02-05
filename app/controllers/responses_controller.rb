class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.paginate(:page=>params[:page],per_page:30)
    @all_responses = Response.all
    respond_to do |format|
      format.html
      format.csv { send_data @all_responses.to_csv }
      format.xls
    end
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  def start_coding
    if(Response.exists?(["judgement = 0 and response != ''"]))
      @response = Response.where(["judgement = 0 and response != ''"]).order('id').first
      redirect_to edit_response_path(@response)
    else
      redirect_to root_url, notice: "No subject responses left to code."
    end
  end

  # GET /responses/new
  def new
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Response.import(params[:file])
    redirect_to root_url, notice: "Subject responses imported."
  end

  def destroy_all
    @Responses = Response.all
    @Responses.each do |a|
      a.destroy
    end
    redirect_to responses_path, notice: "Records Deleted"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:subjnum, :dyad, :whichtest, :condition, :date, :photo, :code, :response, :judgement, :coder)
    end
end
