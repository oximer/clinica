class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:show, :edit, :update, :destroy, :cancel]

  # GET /consultations
  # GET /consultations.json
  def index
    @consultations = Consultation.all
  end

  # GET /consultations/1
  # GET /consultations/1.json
  def show
  end

  # GET /consultations/new
  def new
    @consultation = Consultation.new
    if params[:treatment_id] != nil    
        @consultation.treatment_id = params[:treatment_id]
    end
  end

  # GET /consultations/1/edit
  def edit
    if params[:cancel] != nil 
        params[:cancel] == true
        session[:return_to] ||= request.referer
        @consultation.canceled = true;
        @consultation.canceled_reason = params[:canceled_reason]
        @consultation.save
        redirect_to session.delete(:return_to), notice: "Consulta cancelada"
    end
  end

  # POST /consultations
  # POST /consultations.json
  def create
    @consultation = Consultation.new(consultation_params)

    respond_to do |format|
      if @consultation.save
        format.html { redirect_to @consultation, notice: 'Consultation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consultation }
      else
        format.html { render action: 'new' }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consultations/1
  # PATCH/PUT /consultations/1.json
  def update
    respond_to do |format|
      if @consultation.update(consultation_params)
        format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultations/1
  # DELETE /consultations/1.json
  def destroy
    @consultation.destroy
    respond_to do |format|
      format.html { redirect_to consultations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultation
      @consultation = Consultation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultation_params
      params.require(:consultation).permit(:treatment_id, :date, :description, :canceled, :canceled_reason)
    end
end
