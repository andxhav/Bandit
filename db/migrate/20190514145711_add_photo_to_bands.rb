class AddPhotoToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :band_photo, :string 
  end
end
