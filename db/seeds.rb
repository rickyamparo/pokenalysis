require 'csv'

csv_text = File.read(Rails.root.join('db', 'data', 'pokemon_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Pokemon.new
  p.name = row["Name"]
  p.health = row["HP"]
  p.power = row["Attack"]
  p.speed = row["Speed"]
  p.save
end

User.create(name: "test", email: "test@test.com", password: "testing")
User.create(name: "admin", email: "admin@admin.com", password: "admining", role: 1)
