class Category < ApplicationRecord
    has_many :albums

    validates :name, presence: true

    has_one_attached :image

    def artists
        Artist.joins(:albums).where(albums: {id: self.albums.ids}).uniq
    end

    def songs
        Song.joins(:albums).where(songs: {id: self.albums.ids}).uniq
    end
end
