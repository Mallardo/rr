# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'
require 'faker'

def parse_player_age(string)
  Integer(string || "")
rescue ArgumentError
  rand(18..35)
end

url = "https://allsportsapi.com/api/football/?&met=Teams&leagueId=148&APIkey=51060bd0b78566bf222faddf9ea46489009708a43f90dc5bc15c4b49100a63a8"

# response.body
resp = JSON.load open(url).read
resp["result"].each do |team|
  unless team["coaches"].empty?
    db_team = Team.create(
        name: team["team_name"],
        coach: team["coaches"][0]['coach_name'],
        creation_year: rand(1850...1970),
        logo_url: team["team_logo"],
        country: "England",
        description: Faker::Lorem.paragraph(rand(1..3)),
        achievement: Faker::Lorem.words(rand(5..15)).join(', ')
    )
    team["players"].each do |player|
      player_age = parse_player_age(player["player_age"])
      Player.create(
          team: db_team,
          name: player["player_name"],
          birthday: Faker::Date.birthday(min_age=player_age, max_age=player_age + 1),
          country: player["player_country"],
          position: player["player_type"],
          number: player["player_number"],
          achievement: Faker::Lorem.words(rand(0..15)).join(', ')
      )
    end
  end
end