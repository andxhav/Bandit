class CreateGigs < ActiveRecord::Migration[5.2]
  def change
    create_table :gigs do |t|
      t.string :address, null: false
      t.float :gig_lat, null: false
      t.float :gig_long, null: false
      t.datetime :date, null: false

      t.belongs_to :band, null: false

      t.timestamps
    end
  end
end
