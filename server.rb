require "pry"
require "sinatra"
require "sinatra/reloader"

def get_teams

  games = [
  {
    home_team: "Patriots",
    away_team: "Broncos",
    home_score: 7,
    away_score: 3
  },
  {
    home_team: "Broncos",
    away_team: "Colts",
    home_score: 3,
    away_score: 0
  },
  {
    home_team: "Patriots",
    away_team: "Colts",
    home_score: 11,
    away_score: 7
  },
  {
    home_team: "Steelers",
    away_team: "Patriots",
    home_score: 7,
    away_score: 21
  }]


  teams = []
  games.each do |game|
    if !teams.include? game[:home_team]
      teams << game[:home_team]
    end
    if !teams.include? game[:away_team]
      teams << game[:away_team]
    end
  end
  teams
end

def teams_with_score

   games = [
  {
    home_team: "Patriots",
    away_team: "Broncos",
    home_score: 7,
    away_score: 3
  },
  {
    home_team: "Broncos",
    away_team: "Colts",
    home_score: 3,
    away_score: 0
  },
  {
    home_team: "Patriots",
    away_team: "Colts",
    home_score: 11,
    away_score: 7
  },
  {
    home_team: "Steelers",
    away_team: "Patriots",
    home_score: 7,
    away_score: 21
  }]


  teams = []
  games.each do |game|
    if !teams.include? game[:home_team]
      teams << game[:home_team]
    end
    if !teams.include? game[:away_team]
      teams << game[:away_team]
    end
  end

    wins = 0
  teams.each do |team|
    games.each do |game|
      if game[:home_team] == team && game[:home_score] > game[:away_score]
        wins += 1
      end
      if game[:away_team]== team && game[:away_score] > game[:home_score]
        wins += 1
      end
    end
  end

  teams_scores = []
  teams.each do |team|
    team_score = [team, team_wins(team)]
    teams_scores << team_score
  end
  teams_scores
end



get "/" do
  @teams = get_teams
  erb :landing
end

get '/leader_board' do
  @teams = get_teams
  @teams_scores = teams_with_score
  erb :index

end

get '/teams/:team' do
  @teams = get_teams
  @team = params[:team]

  erb :team
end

