class CreatePlaylistMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :playlist_movies do |t|
      t.references :playlist, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
