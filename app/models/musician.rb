class Musician < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email, presence: true
  validates :scene, presence: true

  has_many :instruments
  has_many :bands, through: :band_members
end
