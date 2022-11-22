3.times do
  User.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, phone_number: nil)
end

3.times do
  User.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name, phone_number: "+#{FFaker::PhoneNumber.imei}")
end
