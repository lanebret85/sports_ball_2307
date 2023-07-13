class Team
  attr_reader :name, :location, :roster

  def initialize(name, location)
    @name = name
    @location = location
    @roster = []
  end

  def player_count
    @roster.count
  end

  def add_player(player)
    @roster << player
  end

  def long_term_players
    players = []
    @roster.each do |player|
      if player.contract_length > 24
        players << player
      end
    end
    players
  end

  def short_term_players
    players = []
    @roster.each do |player|
      if player.contract_length <= 24
        players << player
      end
    end
    players
  end

  def total_value
    player_costs = []
    @roster.each do |player|
      player_costs << player.total_cost
    end
    total_amount = 0
    player_costs.each do |cost|
      total_amount = total_amount + cost
    end
    total_amount
  end

  def details
    team_details = {}
    team_details.store("total_value", total_value)
    team_details.store("player_count", player_count)
    team_details
  end

  def average_cost_of_player
    avg_cost = total_value / player_count
    avg_cost_as_string = avg_cost.to_s
    avg_cost_dollar_amt = "$#{avg_cost_as_string}"
  end
end