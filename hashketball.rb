# Write your code here!
require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson":
        {number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1},

        "Reggie Evans":
        {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7},

        "Brook Lopez":
        {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },

        "Mason Plumlee":
        {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },

        "Jason Terry":
        {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }

        }},
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {"Jeff Adrien":
        {
          number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
        },

        "Bismak Biyombo":
        {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
        },

        "DeSagna Diop":
        {
          number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
        },

        "Ben Gordon":
        {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
        },

        "Brendan Haywood":
        {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 22,
        blocks: 5,
        slam_dunks: 12
      }
        }}}
end


def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, statname|
      if name.to_s == player
        return statname[:points]
      else nil
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, statname|
      if name.to_s == player
        return statname[:shoe]
      else nil
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      return team_data[:colors]
    end
  end
end

def team_names
  names =[]
  game_hash.each do |location, team_data|
    names << team_data[:team_name]
  end
  names
end

def player_numbers(team_name)
  numbers =[]
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |name, stats|
        numbers << stats[:number]
      end
    end
  end
  numbers
end

# def player_numbers(team_name)
#   game_hash.collect do |location, team_data|
#     if team_data[:team_name] == team_name
#       team_data[:players].collect do |name, stats|
#         stats[:number]
#       end
#     end
#   end
# end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      if name.to_s == player
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  player_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if stats[:points] > points
        points = stats[:points]
        player_name = player.to_s
      end
    end
  end
  points
  player_name
end

def winning_team
  brooklyn_score = 0
  charlotte_score = 0
  game_hash.each do |location, team_data|
    if team_data[:team_name] == "Brooklyn Nets"
      team_data[:players].each do |player, stats|
        brooklyn_score += stats[:points]
      end
    elsif team_data[:team_name] == "Charlotte Hornets"
      team_data[:players].each do |player, stats|
        charlotte_score += stats[:points]
      end
    end
  end
  if brooklyn_score > charlotte_score
    return "Brooklyn Nets"
  elsif charlotte_score > brooklyn_score
    return "Charlotte Hornets"
  end
end

def player_with_longest_name

  longest_name = ""
  name_length = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |playername, stats|
      if playername.length > name_length
        longest_name = playername.to_s
      end
    end
  end

  longest_name
end

def most_steals
  steals = 0
  player_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if stats[:steals] > steals
        steals = stats[:steals]
        player_name = player.to_s
      end
    end
  end
  steals
  player_name
end

def long_name_steals_a_ton?
  if player_with_longest_name == most_steals
    then true
  end
end
