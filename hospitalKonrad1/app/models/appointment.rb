class Appointment < ApplicationRecord
  belongs_to :schedule
  belongs_to :patient
  belongs_to :state
end
