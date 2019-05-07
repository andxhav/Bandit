class Gig < ApplicationRecord
  validates :address, presence: true
  validates :gig_lat, presence: true
  validates :gig_long, presence: true
  validates :date, presence: true

  belongs_to :band
end
