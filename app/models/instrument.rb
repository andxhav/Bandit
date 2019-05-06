class Instrument < ApplicationRecord
  validates :instrument, presence: true
  validates :years_experience, presence: true

  belongs_to :musician
end
