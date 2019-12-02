class CampainsController < ApplicationController
  before_action :set_campain, only: [:show, :edit, :update, :destroy]

  # GET /campains
  # GET /campains.json
  def index
    @campains = Campain.all
  end

  # GET /campains/1
  # GET /campains/1.json
  def show
  end

  # GET /campains/new
  def new
    @campain = Campain.new
  end

  # GET /campains/1/edit
  def edit
  end

  # POST /campains
  # POST /campains.json
  def create
    @campain = Campain.new(campain_params)

    respond_to do |format|
      if @campain.save
        format.html { redirect_to @campain, notice: 'Campain was successfully created.' }
        format.json { render :show, status: :created, location: @campain }
      else
        format.html { render :new }
        format.json { render json: @campain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campains/1
  # PATCH/PUT /campains/1.json
  def update
    respond_to do |format|
      if @campain.update(campain_params)
        format.html { redirect_to @campain, notice: 'Campain was successfully updated.' }
        format.json { render :show, status: :ok, location: @campain }
      else
        format.html { render :edit }
        format.json { render json: @campain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campains/1
  # DELETE /campains/1.json
  def destroy
    @campain.destroy
    respond_to do |format|
      format.html { redirect_to campains_url, notice: 'Campain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campain
      @campain = Campain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def campain_params
      params.require(:campain).permit(:name, :user_id, :start_date, :end_date, :producto)
    end
end
