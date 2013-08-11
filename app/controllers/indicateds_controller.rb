class IndicatedsController < ApplicationController
  before_action :set_indicated, only: [:show, :edit, :update, :destroy]

  # GET /indicateds
  # GET /indicateds.json
  def index
    @indicateds = Indicated.all
  end

  # GET /indicateds/1
  # GET /indicateds/1.json
  def show
  end

  # GET /indicateds/new
  def new
    @indicated = Indicated.new
  end

  # GET /indicateds/1/edit
  def edit
  end

  # POST /indicateds
  # POST /indicateds.json
  def create
    @indicated = Indicated.new(indicated_params)

    respond_to do |format|
      if @indicated.save
        format.html { redirect_to @indicated, notice: 'Indicated was successfully created.' }
        format.json { render action: 'show', status: :created, location: @indicated }
      else
        format.html { render action: 'new' }
        format.json { render json: @indicated.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicateds/1
  # PATCH/PUT /indicateds/1.json
  def update
    respond_to do |format|
      if @indicated.update(indicated_params)
        format.html { redirect_to @indicated, notice: 'Indicated was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @indicated.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicateds/1
  # DELETE /indicateds/1.json
  def destroy
    @indicated.destroy
    respond_to do |format|
      format.html { redirect_to indicateds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicated
      @indicated = Indicated.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicated_params
      params.require(:indicated).permit(:indication_id, :description)
    end
end
