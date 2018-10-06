module GamesViews
  def accusation_view(info)
    puts
    p "I think it was #{info[:character]} with the #{info[:weapon]} in the #{info[:room]}."
    puts
  end
end