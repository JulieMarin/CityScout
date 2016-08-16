class Citibike < ApplicationRecord
  geocoded_by :address => :full_address
  reverse_geocoded_by :latitude, :longitude, :address => :full_address



  def full_address
    [street, city, state, country].compact.join(', ')
  end

  def filter_by_distance(latitudeUserInput, longitudeUserInput)
    Citibike.where('(abs(citibikes.latitude - ?) < 0.00001) AND (abs(citibikes.longitude - ?) < 0.00001)', latitudeUserInput, longitudeUserInput)
  end
end
