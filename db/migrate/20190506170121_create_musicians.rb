class CreateMusicians < ActiveRecord::Migration[5.2]
  def change
    create_table :musicians do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :home_town
      t.string :email, null: false
      t.string :scene, null: false
      t.string :instruments, null: false
      t.text :bio

      t.belongs_to :user

      t.timestamps
    end
  end
end
