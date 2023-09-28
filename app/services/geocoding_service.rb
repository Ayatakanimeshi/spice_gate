class GeocodingService
    def self.get_coordinates(address)
      api_key = ENV['GOOGLE_MAPS_API_KEY']
      base_url = "https://maps.googleapis.com/maps/api/geocode/json"
      encoded_address = URI.encode_www_form_component(address)
      url = "#{base_url}?address=#{encoded_address}&key=#{api_key}"
      response = Net::HTTP.get(URI(url))
      json = JSON.parse(response)
      if json['status'] == 'OK'
        json['results'][0]['geometry']['location']
      else
        nil
      end
    end
  end
