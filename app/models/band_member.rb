class BandMember < ApplicationRecord
  validates :band_id, presence: true
  validates :musician_id, presence: true

end
