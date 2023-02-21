class InterviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_interview, only: [:show, :edit, :update, :destroy]

  def index
    @interviews = current_user.interviews.all.order(interview_date: :desc)
  end

  def show
  end

  def new
    @interview = Interview.new
    @jobs = current_user.jobs.order(company: :asc)
    @contacts = current_user.contacts.order(contact_name: :asc)
  end

  def edit
    @jobs = current_user.jobs.order(company: :asc)
    @contacts = current_user.contacts.order(contact_name: :asc)
  end

  def create
    @interview = Interview.new(interview_params)
    @interview.user = current_user

    if @interview.save
      redirect_to @interview, notice: "Interview was successfully created."
    else
      render :new
    end
  end

  def update
    if @interview.update(interview_params)
      redirect_to @interview, notice: "Interview was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @interview.destroy
    redirect_to interviews_url, notice: "Interview was successfully destroyed."
  end

  private

  def set_interview
    @interview = current_user.interviews.find(params[:id])
  end

  def interview_params
    params.require(:interview).permit(:title, :notes, :interview_date, :interview_type, :job_id, :contact_id)
  end
end
