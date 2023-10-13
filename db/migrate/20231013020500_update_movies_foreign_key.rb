class UpdateMoviesForeignKey < ActiveRecord::Migration[7.0]
  def change
  # Remove existing foreign keys
  remove_foreign_key :playlist_movies, :playlists
  remove_foreign_key :playlist_movies, :movies

  # Add new foreign keys with ON DELETE CASCADE
  add_foreign_key :playlist_movies, :playlists, on_delete: :cascade
  add_foreign_key :playlist_movies, :movies, on_delete: :cascade
  end
end
