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
end