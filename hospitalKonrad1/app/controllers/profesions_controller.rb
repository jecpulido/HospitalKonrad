class ProfesionsController < ApplicationController
  before_action :set_profesion, only: [:show, :edit, :update, :destroy]

  # GET /profesions
  # GET /profesions.json
  def index
    @profesions = Profesion.all
  end

  # GET /profesions/1
  # GET /profesions/1.json
  def show
  end

  # GET /profesions/new
  def new
    @profesion = Profesion.new
  end

  # GET /profesions/1/edit
  def edit
  end

  # POST /profesions
  # POST /profesions.json
  def create
    @profesion = Profesion.new(profesion_params)

    respond_to do |format|
      if @profesion.save
        format.html { redirect_to @profesion, notice: 'Profesion was successfully created.' }
        format.json { render :show, status: :created, location: @profesion }
      else
        format.html { render :new }
        format.json { render json: @profesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profesions/1
  # PATCH/PUT /profesions/1.json
  def update
    respond_to do |format|
      if @profesion.update(profesion_params)
        format.html { redirect_to @profesion, notice: 'Profesion was successfully updated.' }
        format.json { render :show, status: :ok, location: @profesion }
      else
        format.html { render :edit }
        format.json { render json: @profesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesions/1
  # DELETE /profesions/1.json
  def destroy
    @profesion.destroy
    respond_to do |format|
      format.html { redirect_to profesions_url, notice: 'Profesion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profesion
      @profesion = Profesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profesion_params
      params.require(:profesion).permit(:name, :description)
    end
end
