class PagesController < ApplicationController

  def home
    @games = policy_scope(Game)
  end

end
