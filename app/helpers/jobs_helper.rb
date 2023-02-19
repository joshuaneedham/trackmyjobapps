module JobsHelper
    def job_status_badge_class(job_application_status)
        badge_classes = {
          submitted: 'badge bg-primary',
          interview: 'badge bg-secondary',
          withdrawn: 'badge bg-danger',
          offer_received: 'badge bg-info',
          rejected: 'badge bg-danger',
          hired: 'badge bg-success'
        }
        badge_classes[job_application_status.to_sym] || 'badge bg-secondary'
      end

end