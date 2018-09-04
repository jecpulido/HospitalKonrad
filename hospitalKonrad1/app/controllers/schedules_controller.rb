class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  #GPOST /create_schedules
  def create_schedules
    #Parametros
    start_date_h_p = params[:start_date].split(':')[0].to_i
    start_date_m_p = params[:start_date].split(':')[1].to_i
    end_date_h_p = params[:end_date].split(':')[0].to_i
    end_date_m_p = params[:end_date].split(':')[1].to_i
    doctor_id_p = params[:doctor_id]
    date_schedule_p = params[:date_schedule]

    #date_schedule_p = DateTime.now
    end_minutes = ((end_date_h_p * 60) + end_date_m_p)
    start_minutes =  ((start_date_h_p * 60) + start_date_m_p)
    end_seconds = end_minutes*60
    start_seconds = start_minutes*60
    
    if (start_minutes > end_minutes)
      render json: { Error: "Hora inicio debe ser menor a Hora Fin" }
      return
    end

    bloque = 1200
    numeroCitas =  (end_minutes - start_minutes)/20.0
    #Valida si el numero de citas es exacto
    if (numeroCitas % 1 == 0)  
      #Crear Bloques
      for i in (1 .. numeroCitas)
        start_schedule = Time.at(start_seconds).utc.strftime("%H:%M:%S")
        end_schedule =  Time.at(start_seconds+bloque).utc.strftime("%H:%M:%S")
        Schedule.create(start:start_schedule,end:end_schedule,date_schedule:date_schedule_p,available: true,doctor_id:doctor_id_p)
        start_seconds +=bloque
      end

    else
      render json: { Error: "Hora inicio y Hora Fin no coinciden" }
      return
    end
  end


  #GET /find_schedule_pro/1
  def find_schedules
    doctors = Doctor.where(profesion_id:params[:profesion_id]).ids
    scheduless = Schedule.where(doctor_id:doctors, available:true)
    render json: (scheduless)
  end

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:start, :end, :date_schedule, :available, :doctor_id)
    end
end
