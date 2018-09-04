json.extract! appointment, :id, :report, :room, :schedule_id, :patient_id, :state_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
