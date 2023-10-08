class PlaylistMovie < ApplicationRecord
  belongs_to :playlist
  belongs_to :movie
end
