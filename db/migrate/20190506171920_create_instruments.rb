class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :instrument, null: false
      t.integer :years_experience, null: false

      t.belongs_to :musician, null: false

      t.timestamps
    end
  end
end
