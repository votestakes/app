class PagesController < ApplicationController

  def intro
    @challenges = Challenge.all
  end

end
