class AddMusicianStateToMusician < ActiveRecord::Migration[5.2]
  def change
    add_column :musicians, :musician_state, :string, default: 'closed'
  end
end
