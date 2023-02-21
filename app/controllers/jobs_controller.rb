class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /jobs or /jobs.json
  def index
    @jobs = current_user.jobs.all.order("updated_at DESC")
    @time_zone = current_user.time_zone || "Eastern Time (US & Canada)"

    @jobs.each do |job|
      job.updated_at = job.updated_at.in_time_zone(@time_zone) if job.updated_at.present?
    end
  end

  # # Dashboard page
  # def dashboard
  #   @jobs = current_user.jobs.order(updated_at: :desc).paginate(page: params[:page], per_page: 5)
  #   @time_zone = current_user.time_zone || "Eastern Time (US & Canada)"

  #   @jobs.each do |job|
  #     job.updated_at = job.updated_at.in_time_zone(@time_zone) if job.updated_at.present?
  #   end
  # end

  # GET /jobs/1 or /jobs/1.json
  def show
    @job = current_user.jobs.find(params[:id])
  end

  # GET /jobs/new
  def new
    @job = current_user.jobs.build
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create
    @job = current_user.jobs.build(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_url(@job), notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = current_user.jobs.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit(:company, :job_title, :job_board_link, :application_date, :job_description, :job_position_type, :job_pay_type, :job_application_status).merge(user_id: current_user.id)
  end
end
