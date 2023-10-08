class Playlist < ApplicationRecord
    validates :name, presence: true

    has_many :playlist_movies
    has_many :movies, through: :playlist_movies
end
