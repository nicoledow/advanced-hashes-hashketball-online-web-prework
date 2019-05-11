
require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      },
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe =>18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7,:slam_dunks => 2
        },
        "Bismack Biyombo" => {:number => 0,:shoe => 16, :points => 12,:rebounds => 4, :assists => 7, :steals => 7, :blocks => 15,:slam_dunks => 10},
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      },
    }
  }
end

def num_points_scored(player)
  hash = game_hash
  hash.each do |location, info| 
    info.each do |attribute, stats|
      if stats.include?(player) 
       return hash[location][attribute][player][:points]
      end
    end
  end
end

def shoe_size(player)
  hash = game_hash
  
  hash.each do |location, info|
    info.each do |attribute, data_set|
      if data_set.include?(player)
        return hash[location][attribute][player][:shoe]
      end
    end
  end
end

def team_colors(team)
  hash = game_hash
  
  hash.each do |location, team_data_set|
    if team_data_set[:team_name] == team
      return hash[location][:colors]
    end
  end
end

def team_names
  names_of_teams = []
  hash = game_hash
  
  hash.each do |location, team_data_set|
    names_of_teams << hash[location][:team_name]
  end
  
  names_of_teams
end

def player_numbers(team)
  jersey_numbers = []
  hash = game_hash
  
  if hash[:home][:team_name] == team
    hash[:home][:players].each do |player_name, info|
      info.each do |stat_name, stat_value|
        if stat_name == :number
          jersey_numbers << stat_value
        end
      end
    end
  end
  
   if hash[:away][:team_name] == team
    hash[:away][:players].each do |player_name, info|
      info.each do |stat_name, stat_value|
        if stat_name == :number
          jersey_numbers << stat_value
        end
      end
    end
  end
  
  jersey_numbers
end

def player_stats(name)
  player_stats = nil 
  game_hash.each do |home_away, team_info|
    team_info.each do |data_label, data|
      if data_label == :players
        data.each do |player_name, stats|
          if player_name == name
            player_stats = stats
          end
        end
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  hash = game_hash
  biggest_shoe_size = 0
  player_with_biggest_shoe_size = ""
  
  hash.each do |location, team_data_set|
    team_data_set.each do |attribute, info|
      if attribute == :players
        info.each do |player, statistic|
          statistic.each do |stat_label, stat_value|
            if stat_label == :shoe && stat_value > biggest_shoe_size
              biggest_shoe_size = stat_label
              player_with_biggest_shoe_size = hash[location][:players][player]
            end
          end
        end
      end
    end
  end
end

big_shoe_rebounds
