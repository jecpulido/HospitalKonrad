json.extract! patient, :id, :document, :name, :lastName, :age, :sex, :eps, :phone, :email, :address, :created_at, :updated_at
json.url patient_url(patient, format: :json)
