class Movie < ApplicationRecord
    validates :title, :image, presence: true
    
    has_many :playlist_movies
    has_many :playlists, through: :playlist_movies
end
