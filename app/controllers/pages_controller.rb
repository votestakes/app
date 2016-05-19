class PagesController < ApplicationController

  def intro
    @challenges = Challenge.order(updated_at: :desc).limit(9)
  end

end
