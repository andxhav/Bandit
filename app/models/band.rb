class Band < ApplicationRecord
  mount_uploader :band_photo, BandPhotoUploader

  validates :band_name, presence: true
  validates :scene, presence: true

  has_many :musicians, through: :band_members
  has_many :gigs

end
