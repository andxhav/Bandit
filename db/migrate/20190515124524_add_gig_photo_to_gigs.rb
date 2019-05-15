class AddGigPhotoToGigs < ActiveRecord::Migration[5.2]
  def change
    add_column :gigs, :gig_photo, :string
  end
end
