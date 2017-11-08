require 'httparty'

toronto_wards_response = HTTParty.get('https://represent.opennorth.ca/boundaries/toronto-wards/')
toronto_wards_jason = JSON.parse(toronto_wards_response.body)

@wards = toronto_wards_jason["objects"]
@wards.map do |ward|
  puts ward['name']
  # puts "#{ward['name']}"
end

puts "******************************************"

toronto_commons_response = HTTParty.get('https://represent.opennorth.ca/representatives/house-of-commons/')
toronto_commons_json = JSON.parse(toronto_commons_response.body)

@commons = toronto_commons_json['objects']
@commons.each do |member|
  puts "Name: #{member['name']}"
  puts "Member of: #{member['party_name']}"
  puts "---"
end
