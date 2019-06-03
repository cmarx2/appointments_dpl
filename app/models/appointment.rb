class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient, optional: true
end
