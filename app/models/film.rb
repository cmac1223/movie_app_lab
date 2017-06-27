class Film < ApplicationRecord
    include HTTParty
    base_uri 'http://img.omdbapi.com/?i=tt3896198&h=600&apikey=36120b99'

    def self.generate(api_id)
        film = find_by api_id: api_id
        return film unless film.nil?

        response = get "/#{api_id}"
        placeholder_image = "http://img.omdbapi.com/?i=tt3896198&h=600&apikey=36120b99/#{200 + api_id}/#{200 + api_id}"

        create!()
end
