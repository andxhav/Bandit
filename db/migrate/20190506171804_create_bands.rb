class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :band_name, null: false
      t.string :scene, null: false
      t.string :genre
      t.text :bio

      t.timestamps
    end
  end
end
