class InsuredsController < ApplicationController
  before_action :set_insured, only: [:show, :edit, :update, :destroy]

  # GET /insureds
  # GET /insureds.json
  def index
    @insureds = Insured.all
  end

  # GET /insureds/1
  # GET /insureds/1.json
  def show
  end

  # GET /insureds/new
  def new
    @insured = Insured.new
  end

  # GET /insureds/1/edit
  def edit
  end

  # POST /insureds
  # POST /insureds.json
  def create
    @insured = Insured.new(insured_params)

    respond_to do |format|
      if @insured.save
        format.html { redirect_to @insured, notice: 'Insured was successfully created.' }
        format.json { render action: 'show', status: :created, location: @insured }
      else
        format.html { render action: 'new' }
        format.json { render json: @insured.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insureds/1
  # PATCH/PUT /insureds/1.json
  def update
    respond_to do |format|
      if @insured.update(insured_params)
        format.html { redirect_to @insured, notice: 'Insured was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @insured.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insureds/1
  # DELETE /insureds/1.json
  def destroy
    @insured.destroy
    respond_to do |format|
      format.html { redirect_to insureds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insured
      @insured = Insured.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insured_params
      params.require(:insured).permit(:pacient_id, :insurance_id)
    end
end
