class Band < ApplicationRecord
  validates :band_name, presence: true
  validates :scene, presence: true

  has_many :musicians
  has_many :gigs

  belongs_to :musician
end
