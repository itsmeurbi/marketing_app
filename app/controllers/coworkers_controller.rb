class CoworkersController < ApplicationController
  before_action :set_coworker, only: [:show, :edit, :update, :destroy]

  # GET /coworkers
  # GET /coworkers.json
  def index
    @coworkers = Coworker.all
  end

  # GET /coworkers/1
  # GET /coworkers/1.json
  def show
  end

  # GET /coworkers/new
  def new
    @coworker = Coworker.new
  end

  # GET /coworkers/1/edit
  def edit
  end

  # POST /coworkers
  # POST /coworkers.json
  def create
    @coworker = Coworker.new(coworker_params)

    respond_to do |format|
      if @coworker.save
        format.html { redirect_to @coworker, notice: 'Coworker was successfully created.' }
        format.json { render :show, status: :created, location: @coworker }
      else
        format.html { render :new }
        format.json { render json: @coworker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coworkers/1
  # PATCH/PUT /coworkers/1.json
  def update
    respond_to do |format|
      if @coworker.update(coworker_params)
        format.html { redirect_to @coworker, notice: 'Coworker was successfully updated.' }
        format.json { render :show, status: :ok, location: @coworker }
      else
        format.html { render :edit }
        format.json { render json: @coworker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coworkers/1
  # DELETE /coworkers/1.json
  def destroy
    @coworker.destroy
    respond_to do |format|
      format.html { redirect_to coworkers_url, notice: 'Coworker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coworker
      @coworker = Coworker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coworker_params
      params.require(:coworker).permit(:role, :user_id, :campain_id)
    end
end
