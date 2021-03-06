module HotelsHelper

   def get_hotelinfo(hotel_number)
     key = "leo157613fc400"
     feedURL = "http://jws.jalan.net/APIAdvance/HotelSearch/V1/?key="
     feedURL = feedURL + key
     feedURL = feedURL + "&h_id=" + hotel_number.to_s
     feedURL = feedURL + "&xml_ptn=2"
     xml = open(feedURL).read
     arr = REXML::Document.new(xml)
     hotels = {
      "No" => arr.elements["//Hotel/HotelID"].text,
      "Name" => arr.elements["//Hotel/HotelName"].text,
      "Address" => arr.elements["//Hotel/HotelAddress"].text,
      "Price" => arr.elements["//Hotel/SampleRateFrom"].text,
      "InformationURL" => arr.elements["//Hotel/HotelDetailURL"].text,
      "Access" => arr.elements["//Hotel/AccessInformation"].text,
      "Picture" => arr.elements["//Hotel/PictureURL"].text
    }
   end
   
   def get_map(address)
     place = Geocoder.coordinates(address)
     key = "dj0zaiZpPXdMV2NhazJleFFSTiZzPWNvbnN1bWVyc2VjcmV0Jng9MTI-"
     feedURL = "https://map.yahooapis.jp/map/V1/static?appid="
     feedURL = feedURL + key
     feedURL = feedURL + "&pindefault=" + place[0].to_s + "," + place[1].to_s
     feedURL = feedURL + "&z=16"
     feedURL = feedURL + "&width=600"
     feedURL = feedURL + "&height=600"
   end
      
end