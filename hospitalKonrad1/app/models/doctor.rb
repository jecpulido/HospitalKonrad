class Doctor < ApplicationRecord
  belongs_to :profesion
  has_many :schedule
end
