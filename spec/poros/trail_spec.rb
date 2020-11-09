require 'rails_helper'

RSpec.describe 'Trail Search Details poro' do
  it 'exists' do
    VCR.use_cassette('trail_object_nyc') do
      attr = {
              :id=>7037161,
              :name=>"Peanut Leap Cascade into Giant Stairs",
              :type=>"Recommended Route",
              :summary=>"A great but very steep hike with some gorgeous views and fun rock scrambling.",
              :difficulty=>"black",
              :stars=>4.6,
              :starVotes=>18,
              :location=>"Northvale, New Jersey",
              :url=>"https://www.hikingproject.com/trail/7037161/peanut-leap-cascade-into-giant-stairs",
              :imgSqSmall=>"https://cdn2.apstatic.com/photos/hike/7047406_sqsmall_1555537006.jpg",
              :imgSmall=>"https://cdn2.apstatic.com/photos/hike/7047406_small_1555537006.jpg",
              :imgSmallMed=>"https://cdn2.apstatic.com/photos/hike/7047406_smallMed_1555537006.jpg",
              :imgMedium=>"https://cdn2.apstatic.com/photos/hike/7047406_medium_1555537006.jpg",
              :length=>4.2,
              :ascent=>764,
              :descent=>-765,
              :high=>524,
              :low=>5,
              :longitude=>-73.9073,
              :latitude=>40.9891,
              :conditionStatus=>"Unknown",
              :conditionDetails=>nil,
              :conditionDate=>"1970-01-01 00:00:00"
                  }

      start_coordinates = {:lat=>40.713054, :lng=>-74.007228}

      trail = Trail.new(attr, start_coordinates)

      expect(trail).to be_a(Trail)
      expect(trail.difficulty).to eq(attr[:difficulty])
      expect(trail.distance_to_trail).to be_a(Numeric)
      expect(trail.location).to eq(attr[:location])
      expect(trail.name).to eq(attr[:name])
      expect(trail.summary).to eq(attr[:summary])
    end
  end
end