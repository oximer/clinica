class ProceduretypesController < ApplicationController
  before_action :set_proceduretype, only: [:show, :edit, :update, :destroy]

  # GET /proceduretypes
  # GET /proceduretypes.json
  def index
    @proceduretypes = Proceduretype.all
  end

  # GET /proceduretypes/1
  # GET /proceduretypes/1.json
  def show
  end

  # GET /proceduretypes/new
  def new
    @proceduretype = Proceduretype.new
  end

  # GET /proceduretypes/1/edit
  def edit
  end

  # POST /proceduretypes
  # POST /proceduretypes.json
  def create
    @proceduretype = Proceduretype.new(proceduretype_params)

    respond_to do |format|
      if @proceduretype.save
        format.html { redirect_to @proceduretype, notice: 'Proceduretype was successfully created.' }
        format.json { render action: 'show', status: :created, location: @proceduretype }
      else
        format.html { render action: 'new' }
        format.json { render json: @proceduretype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proceduretypes/1
  # PATCH/PUT /proceduretypes/1.json
  def update
    respond_to do |format|
      if @proceduretype.update(proceduretype_params)
        format.html { redirect_to @proceduretype, notice: 'Proceduretype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @proceduretype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proceduretypes/1
  # DELETE /proceduretypes/1.json
  def destroy
    @proceduretype.destroy
    respond_to do |format|
      format.html { redirect_to proceduretypes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceduretype
      @proceduretype = Proceduretype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proceduretype_params
      params.require(:proceduretype).permit(:name, :followup)
    end
end
