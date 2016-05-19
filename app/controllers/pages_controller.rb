class PagesController < ApplicationController

  def intro
    @challenges = Challenge.order(updated_at: :desc)
  end

end
