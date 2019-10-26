require 'pry'

# HASKETBALL

def game_hash
  {
    home:
    {
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players:
      [
        { player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        { player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        { player_name: 'Brook Lopez',
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: 'Mason Plumlee',
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        { player_name: 'Jason Terry',
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away:
    {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise","Purple"],
      players:
      [
        { player_name: 'Jeff Adrien',
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        { player_name: 'Bismack Biyombo',
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        { player_name: 'DeSagna Diop',
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        { player_name: 'Ben Gordon',
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        { player_name: 'Kemba Walker',
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    },
  }

end

# levels gamehash[side][team][specs][info][player]

#METHODS

#number points scred by seleted player
def num_points_scored(player_name)
  game_hash.each do |side, team|
    team.each do |specs, info|
      if specs == :players

        info.each do |player|
          if player[:player_name] == player_name
            return player[:points]
          end
        end
      end
    end
  end
end

#binding.pry


#shoe size for selected player()
def shoe_size (player_name)

  game_hash.each do |side, team|
    team.each do |specs, info|
      if specs == :players

        info.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

#team colors
def team_colors(team_name)
  game_hash.each do |side,team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end


# names of BOTH teams
def team_names()
  result = []
  game_hash.each do |side,team|
    result.push(team[:team_name])
  end
  result
end


#jersey numbers for selected team
def player_numbers(team_name)
  result = []
  game_hash.each do |side,team|
    if team[:team_name] == team_name
      team.each do |specs, info|
        next unless specs == :players

        info.each do |player|
          result.push(player[:number])
        end
      end
    end
  end
  result
end


# all stats for selected player
def player_stats(player_name)
  result = {}
  game_hash.each do |side,team|
    team.each do |specs,info|
      if specs == :players

        info.each do |player|
          if player[:player_name] == player_name
            result = player
            result.delete(:player_name)
          end
        end
      end
    end
  end
  result
end


# # rebounds for player with biggest foot
def big_shoe_rebounds()
  shoe_size = 0
  result = 0

  game_hash.each do |side,team|
    team.each do |specs,info|
      if specs == :players
        info.each do |player|
          if player[:shoe] > shoe_size
            shoe_size = player[:shoe]
            result = player[:rebounds]

          end
        end
      end
    end
  end
  result
end


#BONUS

# player who scored the most Points
def most_points_scored()
  points = 0
  result = ""

  game_hash.each do |side,team|
    team.each do |specs,info|
      if specs == :players
        info.each do |player|
          if player[:points] > points
            points = player[:points]
            result = player[:player_name]

          end
        end
      end
    end
  end
  result
end

# team who won (scored the most points)
def winning_team
  points_home = 0
  points_away = 0
  result = ""

  game_hash.each do |side,team|
    team.each do |specs,info|
      if specs == :players
        info.each do |player|
          if  side = :home
            points_home += player[:points]
          else
            points_away += player[:points]
          end
        end
      end
    end
  end
  if points_home > points_away
    result = game_hash[:home][:team_name]
  else
    result = game_hash[:away][:team_name]
  end
  result
end

#player with longest name
def player_with_longest_name()
count = 0
result = ""

game_hash.each do |side,team|
  team.each do |specs,info|
    if specs == :players
      info.each do |player|

        if player[:player_name].length > count
          count = player[:player_name].length
          result = player[:player_name]

        end
      end
    end
  end
end
result
end

# find out if the person with the longet name also hast the most steals
def long_name_steals_a_ton?()

  def most_steals()
    steals = 0
    result = ""

    game_hash.each do |side,team|
      team.each do |specs,info|
        if specs == :players
          info.each do |player|
            if player[:steals] > steals
              steals = player[:steals]
              result = player[:player_name]

            end
          end
        end
      end
    end
    result
  end

  return player_with_longest_name() == most_steals()
end
