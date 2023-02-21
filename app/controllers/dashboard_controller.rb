class DashboardController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    if current_user.present?
      @jobs = current_user.jobs.all.order(updated_at: :desc).limit(8)
      @time_zone = current_user.time_zone || "Eastern Time (US & Canada)"
      @contacts = current_user.contacts.all.order(created_at: :desc).limit(8)
      @interviews = current_user.interviews.joins(:job).where("jobs.user_id = ? AND interview_date >= ?", current_user.id, Time.zone.now.beginning_of_day).all.order(interview_date: :asc).limit(8)

      @jobs.each do |job|
        job.updated_at = job.updated_at.in_time_zone(@time_zone) if job.updated_at.present?
      end

      @contacts.each do |contact|
        contact.created_at = contact.created_at.in_time_zone(@time_zone) if contact.created_at.present?
      end

      @interviews.each do |interview|
        interview.interview_date = interview.interview_date.in_time_zone(@time_zone) if interview.interview_date.present?
      end
    end
  end
end
