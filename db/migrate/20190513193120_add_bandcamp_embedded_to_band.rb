class AddBandcampEmbeddedToBand < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :bandcamp_embedded, :text, default: nil 
  end
end
